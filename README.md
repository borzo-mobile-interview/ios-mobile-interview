# Orders list
This app consists of a 2 screens displaying fake orders. OrdersList and OrderDetails.
Orders are received from server.
Query example (you can copy-paste this into your browser):

    https://externalwebhooks.borzo.net/mobile-interview-api.php?since_id=2000&limit=20

## Task 1
Change displayed order date format to `September, 15 2023 18:50` in both screens OrderList and OrderDetails as well

## Task 2
Add paging. 
When you scroll down to the end of the list, app should automatically start loading next page.
While next page is loading, loading indicator must be displayed as the last item of the list.

In order to load next page from server, you can add `since_id` and `limit` parameters to request.
`since_id` parameter must be equal to the `order_id` of the last order on the previous page.
`limit` can be any number you like.

Paragraph below has already been implemented in the App. It is presented here only to better understand how query parameters actually work.
When the app starts or when you reload the page via pull-to-refresh, you should make a request 
without the `since_id` parameter to get the initial page.
