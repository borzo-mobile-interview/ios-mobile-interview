//
//  FakeOrdersApi.swift
//  interview
//
//  Created by Boris Bengus on 19/02/2024.
//

// In case you have network issues, uncomment this file

//import Foundation
//
//public final class FakeOrdersApi: OrdersApiProtocol {
//    private let fakeQueue = DispatchQueue(label: "FakeOrdersApi", qos: .userInitiated)
//    private let callbackQueue = DispatchQueue.main
//    private var fakeOrders = [OrderDto]()
//    
//    
//    // MARK: - Init
//    public init() {
//        self.fillFakeOrders()
//    }
//    
//    
//    // MARK: - OrdersApiProtocol
//    public func requestOrders(
//        limit: Int,
//        completion: @escaping (Result<OrdersResponseDto, OrdersApiError>) -> Void
//    ) {
//        requestOrders(
//            sinceId: nil,
//            limit: limit,
//            completion: completion
//        )
//    }
//    
//    public func requestOrders(
//        sinceId: Int?,
//        limit: Int,
//        completion: @escaping (Result<OrdersResponseDto, OrdersApiError>) -> Void
//    ) {
//        // 2000 because of fake implementation (see fake orders at the end of this file)
//        let sinceId = sinceId ?? 2000
//        fakeQueue.asyncAfter(deadline: .now() + 1) { [weak self] in
//            guard let self else { return }
//            if let indexOfAfterSinceId = fakeOrders.firstIndex(where: { $0.orderId > sinceId }) {
//                let orders = Array(self.fakeOrders.suffix(from: indexOfAfterSinceId).prefix(limit))
//                callbackQueue.async {
//                    completion(.success(OrdersResponseDto(orders: orders)))
//                }
//            } else {
//                callbackQueue.async {
//                    completion(.success(OrdersResponseDto(orders: [])))
//                }
//            }
//        }
//    }
//}
//
//extension FakeOrdersApi {
//    private func fillFakeOrders() {
//        self.fakeOrders = [
//            OrderDto(
//                orderId: 2001,
//                address: "Bandra, 1",
//                date: "2024-02-19T21:08:36+03:00",
//                text: "Aliquam eget laoreet odio. Vivamus id tempus diam. Morbi tempus justo nec dignissim bibendum. Aenean ac sem eget tortor venenatis varius."
//            ),
//            OrderDto(
//                orderId: 2002,
//                address: "Bandra, 2",
//                date: "2024-02-19T09:29:22+03:00",
//                text: "Praesent varius pulvinar ex quis sagittis. Nam ultrices, mauris non ultricies eleifend, tellus felis faucibus ligula, quis interdum arcu nisl eu eros."
//            ),
//            OrderDto(
//                orderId: 2003,
//                address: "Bandra, 3",
//                date: "2024-02-19T18:13:38+03:00",
//                text: "Ut vel pellentesque nunc. Mauris sollicitudin lacinia cursus."
//            ),
//            OrderDto(
//                orderId: 2004,
//                address: "Bandra, 4",
//                date: "2024-02-19T12:43:27+03:00",
//                text: "Maecenas vehicula, arcu et dignissim tincidunt, justo justo dignissim enim, nec tincidunt nisi eros nec magna."
//            ),
//            OrderDto(
//                orderId: 2005,
//                address: "Bandra, 5",
//                date: "2024-02-19T19:16:37+03:00",
//                text: "Nullam semper ultricies augue, eget pretium elit accumsan eu."
//            ),
//            OrderDto(
//                orderId: 2006,
//                address: "Bandra, 6",
//                date: "2024-02-19T16:32:42+03:00",
//                text: "Maecenas id risus gravida, rutrum felis nec, feugiat leo. Nam tortor tellus, tempor nec elementum ut, viverra vel arcu. Donec ligula lacus, pretium non viverra sed, sagittis nec sapien."
//            ),
//            OrderDto(
//                orderId: 2007,
//                address: "Bandra, 7",
//                date: "2024-02-19T11:07:21+03:00",
//                text: "Etiam quis felis in est mattis tempus."
//            ),
//            OrderDto(
//                orderId: 2008,
//                address: "Bandra, 8",
//                date: "2024-02-19T17:44:02+03:00",
//                text: "Etiam quis felis in est mattis tempus."
//            ),
//            OrderDto(
//                orderId: 2009,
//                address: "Bandra, 9",
//                date: "2024-02-19T17:55:43+03:00",
//                text: "Quisque volutpat tellus in nibh fermentum rutrum. Morbi lobortis varius nunc, a venenatis ipsum lacinia ut."
//            ),
//            OrderDto(
//                orderId: 2010,
//                address: "Bandra, 10",
//                date: "2024-02-19T12:32:21+03:00",
//                text: "Mauris venenatis sit amet turpis sit amet imperdiet. Pellentesque congue in lacus sit amet placerat."
//            ),
//            OrderDto(
//                orderId: 2011,
//                address: "Bandra, 11",
//                date: "2024-02-18T21:08:36+03:00",
//                text: "Aliquam eget laoreet odio. Vivamus id tempus diam. Morbi tempus justo nec dignissim bibendum. Aenean ac sem eget tortor venenatis varius."
//            ),
//            OrderDto(
//                orderId: 2012,
//                address: "Bandra, 12",
//                date: "2024-02-18T09:29:22+03:00",
//                text: "Praesent varius pulvinar ex quis sagittis. Nam ultrices, mauris non ultricies eleifend, tellus felis faucibus ligula, quis interdum arcu nisl eu eros."
//            ),
//            OrderDto(
//                orderId: 2013,
//                address: "Bandra, 13",
//                date: "2024-02-18T18:13:38+03:00",
//                text: "Ut vel pellentesque nunc. Mauris sollicitudin lacinia cursus."
//            ),
//            OrderDto(
//                orderId: 2014,
//                address: "Bandra, 14",
//                date: "2024-02-18T12:43:27+03:00",
//                text: "Maecenas vehicula, arcu et dignissim tincidunt, justo justo dignissim enim, nec tincidunt nisi eros nec magna."
//            ),
//            OrderDto(
//                orderId: 2015,
//                address: "Bandra, 15",
//                date: "2024-02-18T19:16:37+03:00",
//                text: "Nullam semper ultricies augue, eget pretium elit accumsan eu."
//            ),
//            OrderDto(
//                orderId: 2016,
//                address: "Bandra, 16",
//                date: "2024-02-18T16:32:42+03:00",
//                text: "Maecenas id risus gravida, rutrum felis nec, feugiat leo. Nam tortor tellus, tempor nec elementum ut, viverra vel arcu. Donec ligula lacus, pretium non viverra sed, sagittis nec sapien."
//            ),
//            OrderDto(
//                orderId: 2017,
//                address: "Bandra, 17",
//                date: "2024-02-18T11:07:21+03:00",
//                text: "Etiam quis felis in est mattis tempus."
//            ),
//            OrderDto(
//                orderId: 2018,
//                address: "Bandra, 18",
//                date: "2024-02-18T17:44:02+03:00",
//                text: "Etiam quis felis in est mattis tempus."
//            ),
//            OrderDto(
//                orderId: 2019,
//                address: "Bandra, 19",
//                date: "2024-02-18T17:55:43+03:00",
//                text: "Quisque volutpat tellus in nibh fermentum rutrum. Morbi lobortis varius nunc, a venenatis ipsum lacinia ut."
//            ),
//            OrderDto(
//                orderId: 2020,
//                address: "Bandra, 20",
//                date: "2024-02-18T12:32:21+03:00",
//                text: "Mauris venenatis sit amet turpis sit amet imperdiet. Pellentesque congue in lacus sit amet placerat."
//            ),
//            OrderDto(
//                orderId: 2021,
//                address: "Bandra, 21",
//                date: "2024-02-19T21:08:07+03:00",
//                text: "In mi neque, ornare nec maximus at, accumsan in nulla."
//            ),
//            OrderDto(
//                orderId: 2022,
//                address: "Bandra, 22",
//                date: "2024-02-19T17:35:07+03:00",
//                text: "Maecenas id risus gravida, rutrum felis nec, feugiat leo. Nam tortor tellus, tempor nec elementum ut, viverra vel arcu. Donec ligula lacus, pretium non viverra sed, sagittis nec sapien."
//            ),
//            OrderDto(
//                orderId: 2023,
//                address: "Bandra, 23",
//                date: "2024-02-19T12:50:25+03:00",
//                text: "Praesent varius pulvinar ex quis sagittis. Nam ultrices, mauris non ultricies eleifend, tellus felis faucibus ligula, quis interdum arcu nisl eu eros."
//            ),
//            OrderDto(
//                orderId: 2024,
//                address: "Bandra, 24",
//                date: "2024-02-19T14:10:30+03:00",
//                text: "Sed suscipit purus ut ex rutrum faucibus. Ut imperdiet ligula dolor, in luctus arcu vulputate eget. Vestibulum sagittis vitae eros sed dictum."
//            ),
//            OrderDto(
//                orderId: 2025,
//                address: "Bandra, 25",
//                date: "2024-02-19T15:12:29+03:00",
//                text: "Ut fermentum, quam id pulvinar condimentum, massa eros pulvinar augue, id aliquam ipsum urna sed purus. Nam ullamcorper laoreet elit ac volutpat."
//            ),
//            OrderDto(
//                orderId: 2026,
//                address: "Bandra, 26",
//                date: "2024-02-19T10:06:18+03:00",
//                text: "Praesent vulputate eleifend nunc quis vulputate."
//            ),
//            OrderDto(
//                orderId: 2027,
//                address: "Bandra, 27",
//                date: "2024-02-19T15:46:56+03:00",
//                text: "Donec rhoncus sapien eu massa tempor finibus. Nunc in lacus tellus. Cras euismod aliquam ante eget tincidunt. Phasellus sollicitudin arcu id enim lacinia tempor."
//            ),
//            OrderDto(
//                orderId: 2028,
//                address: "Bandra, 28",
//                date: "2024-02-19T09:31:51+03:00",
//                text: "Vestibulum sit amet quam vel nisl hendrerit viverra at sit amet risus. Suspendisse mollis posuere gravida. Sed pharetra ante vel quam sollicitudin, varius laoreet urna vehicula."
//            ),
//            OrderDto(
//                orderId: 2029,
//                address: "Bandra, 29",
//                date: "2024-02-19T20:41:30+03:00",
//                text: "In mi neque, ornare nec maximus at, accumsan in nulla."
//            ),
//            OrderDto(
//                orderId: 2030,
//                address: "Bandra, 30",
//                date: "2024-02-19T09:34:12+03:00",
//                text: "Fusce eu massa id ante pulvinar lacinia."
//            ),
//            OrderDto(
//                orderId: 2031,
//                address: "Bandra, 31",
//                date: "2024-02-19T21:08:36+03:00",
//                text: "Aliquam eget laoreet odio. Vivamus id tempus diam. Morbi tempus justo nec dignissim bibendum. Aenean ac sem eget tortor venenatis varius."
//            ),
//            OrderDto(
//                orderId: 2032,
//                address: "Bandra, 32",
//                date: "2024-02-19T09:29:22+03:00",
//                text: "Praesent varius pulvinar ex quis sagittis. Nam ultrices, mauris non ultricies eleifend, tellus felis faucibus ligula, quis interdum arcu nisl eu eros."
//            ),
//            OrderDto(
//                orderId: 2033,
//                address: "Bandra, 33",
//                date: "2024-02-19T18:13:38+03:00",
//                text: "Ut vel pellentesque nunc. Mauris sollicitudin lacinia cursus."
//            ),
//            OrderDto(
//                orderId: 2034,
//                address: "Bandra, 34",
//                date: "2024-02-19T12:43:27+03:00",
//                text: "Maecenas vehicula, arcu et dignissim tincidunt, justo justo dignissim enim, nec tincidunt nisi eros nec magna."
//            ),
//            OrderDto(
//                orderId: 2035,
//                address: "Bandra, 35",
//                date: "2024-02-19T19:16:37+03:00",
//                text: "Nullam semper ultricies augue, eget pretium elit accumsan eu."
//            ),
//            OrderDto(
//                orderId: 2036,
//                address: "Bandra, 36",
//                date: "2024-02-19T16:32:42+03:00",
//                text: "Maecenas id risus gravida, rutrum felis nec, feugiat leo. Nam tortor tellus, tempor nec elementum ut, viverra vel arcu. Donec ligula lacus, pretium non viverra sed, sagittis nec sapien."
//            ),
//            OrderDto(
//                orderId: 2037,
//                address: "Bandra, 37",
//                date: "2024-02-19T11:07:21+03:00",
//                text: "Etiam quis felis in est mattis tempus."
//            ),
//            OrderDto(
//                orderId: 2038,
//                address: "Bandra, 38",
//                date: "2024-02-19T17:44:02+03:00",
//                text: "Etiam quis felis in est mattis tempus."
//            ),
//            OrderDto(
//                orderId: 2039,
//                address: "Bandra, 39",
//                date: "2024-02-19T17:55:43+03:00",
//                text: "Quisque volutpat tellus in nibh fermentum rutrum. Morbi lobortis varius nunc, a venenatis ipsum lacinia ut."
//            ),
//            OrderDto(
//                orderId: 2040,
//                address: "Bandra, 40",
//                date: "2024-02-19T12:32:21+03:00",
//                text: "Mauris venenatis sit amet turpis sit amet imperdiet. Pellentesque congue in lacus sit amet placerat."
//            ),
//            OrderDto(
//                orderId: 2041,
//                address: "Bandra, 41",
//                date: "2024-02-19T21:08:07+03:00",
//                text: "In mi neque, ornare nec maximus at, accumsan in nulla."
//            ),
//            OrderDto(
//                orderId: 2042,
//                address: "Bandra, 42",
//                date: "2024-02-19T17:35:07+03:00",
//                text: "Maecenas id risus gravida, rutrum felis nec, feugiat leo. Nam tortor tellus, tempor nec elementum ut, viverra vel arcu. Donec ligula lacus, pretium non viverra sed, sagittis nec sapien."
//            ),
//            OrderDto(
//                orderId: 2043,
//                address: "Bandra, 43",
//                date: "2024-02-19T12:50:25+03:00",
//                text: "Praesent varius pulvinar ex quis sagittis. Nam ultrices, mauris non ultricies eleifend, tellus felis faucibus ligula, quis interdum arcu nisl eu eros."
//            ),
//            OrderDto(
//                orderId: 2044,
//                address: "Bandra, 44",
//                date: "2024-02-19T14:10:30+03:00",
//                text: "Sed suscipit purus ut ex rutrum faucibus. Ut imperdiet ligula dolor, in luctus arcu vulputate eget. Vestibulum sagittis vitae eros sed dictum."
//            ),
//            OrderDto(
//                orderId: 2045,
//                address: "Bandra, 45",
//                date: "2024-02-19T15:12:29+03:00",
//                text: "Ut fermentum, quam id pulvinar condimentum, massa eros pulvinar augue, id aliquam ipsum urna sed purus. Nam ullamcorper laoreet elit ac volutpat."
//            ),
//            OrderDto(
//                orderId: 2046,
//                address: "Bandra, 46",
//                date: "2024-02-19T10:06:18+03:00",
//                text: "Praesent vulputate eleifend nunc quis vulputate."
//            ),
//            OrderDto(
//                orderId: 2047,
//                address: "Bandra, 47",
//                date: "2024-02-19T15:46:56+03:00",
//                text: "Donec rhoncus sapien eu massa tempor finibus. Nunc in lacus tellus. Cras euismod aliquam ante eget tincidunt. Phasellus sollicitudin arcu id enim lacinia tempor."
//            ),
//            OrderDto(
//                orderId: 2048,
//                address: "Bandra, 48",
//                date: "2024-02-19T09:31:51+03:00",
//                text: "Vestibulum sit amet quam vel nisl hendrerit viverra at sit amet risus. Suspendisse mollis posuere gravida. Sed pharetra ante vel quam sollicitudin, varius laoreet urna vehicula."
//            ),
//            OrderDto(
//                orderId: 2049,
//                address: "Bandra, 49п",
//                date: "2024-02-19T20:41:30+03:00",
//                text: "In mi neque, ornare nec maximus at, accumsan in nulla."
//            )
//        ]
//    }
//}
