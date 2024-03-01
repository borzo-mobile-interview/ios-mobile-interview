//
//  Design.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

public enum Design {
    public static var isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public enum Fonts {
        public static var navBarTitle: UIFont { UIFont.systemFont(ofSize: 17, weight: .semibold) }
        public static var navBarButton: UIFont { UIFont.systemFont(ofSize: 17, weight: .regular) }
    }
    
    public enum Metrics {
        /// Почти все иконки 24 на 24
        public static let iconSize: CGFloat = 24
        public static let verticalGap: CGFloat = 10
        public static let bigVerticalGap: CGFloat = 20
        public static let horizontalGap: CGFloat = 16
        public static let bigHorizontalGap: CGFloat = 36
        public static let topGap: CGFloat = 16
        public static let bottomGap: CGFloat = 16
        public static let buttonHeight: CGFloat = 48
        public static let ipadButtonWidth: CGFloat = 320
        public static let buttonCornerRadius: CGFloat = 12
        public static let borderWidth: CGFloat = 1 / UIScreen.main.scale
    }
    
    /// This is Functional Palette, should be used in public code
    public enum Colors {
        // Emotional control state
        public static var accent: UIColor { Palette.blue }
        public static var positive: UIColor { Palette.green }
        public static var negative: UIColor { Palette.red }
        public static var info: UIColor { Palette.grey2 }
        public static var disabled: UIColor { Palette.grey3 }
        // Text
        public static var primaryText: UIColor { Palette.black }
        public static var secondaryText: UIColor { Palette.grey }
        public static var lightText: UIColor { Palette.white }
        public static var linksText: UIColor { Palette.blue }
        // Other Views-related
        public static var border: UIColor { Palette.grey1 }
        public static var borderDisabled: UIColor { Palette.grey4 }
        public static var defaultBackground: UIColor { Palette.white }
        public static var loadingIndicatorGrey: UIColor { Palette.grey }
        public static var loadingIndicatorWhite: UIColor { Palette.white }
        public static var loadingBackdropColor: UIColor { Palette.black.withAlphaComponent(0.3) }
        public static var navBarText: UIColor { Palette.black }
        public static var navBarBackground: UIColor { Palette.white }
    }
}

public extension Design.Colors {
    /// This is raw Palette from Designers, please avoid to use it directly. Try to use functional colors from Design.Colors.
    /// If you really need to use colors from this Palette, please wrap it in "private extension Design.Colors" in a specific View
    enum Palette {
        public static var black: UIColor { UIColor(hexString: "#2d333a") }
        public static var grey: UIColor { UIColor(hexString: "#565859") }
        public static var grey1: UIColor { UIColor(hexString: "#D0D7D9") }
        public static var grey2: UIColor { UIColor(hexString: "#E7E7E7") }
        public static var grey3: UIColor { UIColor(hexString: "#CCCDCD") }
        public static var grey4: UIColor { UIColor(hexString: "#F1F3F4") }
        public static var white: UIColor { UIColor(hexString: "#FFFFFF") }
        public static var red: UIColor { UIColor(hexString: "#FF6969") }
        public static var green: UIColor { UIColor(hexString: "#33CC8C") }
        public static var blue: UIColor { UIColor(hexString: "#3B82F6") }
    }
}

public extension Design {
    static func applyAppearance() {
        let backImage = UIImage.maskedImageNamed("back", color: Design.Colors.navBarText)
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().tintColor = Design.Colors.navBarText
        UINavigationBar.appearance().titleTextAttributes = [
            .font: Design.Fonts.navBarTitle,
            .foregroundColor: Design.Colors.navBarText
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes([
            .font: Design.Fonts.navBarButton,
            .foregroundColor: Design.Colors.navBarText
        ], for: .normal)
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundColor = Design.Colors.navBarBackground
        navBarAppearance.titleTextAttributes = [
            .font: Design.Fonts.navBarTitle,
            .foregroundColor: Design.Colors.navBarText
        ]
        navBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        let barButtonAppearance = UIBarButtonItemAppearance()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: Design.Fonts.navBarButton,
            .foregroundColor: Design.Colors.navBarText
        ]
        barButtonAppearance.normal.titleTextAttributes = attributes
        barButtonAppearance.highlighted.titleTextAttributes = attributes
        navBarAppearance.buttonAppearance = barButtonAppearance
        navBarAppearance.backButtonAppearance = barButtonAppearance
        
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().compactScrollEdgeAppearance = navBarAppearance
        }
    }
}
