# iMojeSDK

![CI Status](https://img.shields.io/travis/imoje/iMojeSDK.svg?style=flat)](https://travis-ci.org/imoje/iMojeSDK)
![Version](https://img.shields.io/cocoapods/v/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)
![License](https://img.shields.io/cocoapods/l/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)
![Platform](https://img.shields.io/cocoapods/p/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)

## iMoje app test

To run the app test project: 

1. clone the repo [https://git.netizens.pl/imoje/imoje-app-ios.git](https://git.netizens.pl/imoje/imoje-app-ios.git) 

2. run `pod install` from the imoje-app-ios directory first.

## Requirements

### Configure sdk
1. Use plist
    1. Add your app's **iMoje.plist** file
    2. Add a `iMojeSDKMerchantIdentifier` key with a string value of your `merchantId`
    3. Add a `iMojeSDKServiceIdentifier` key with a string value of your `serviceId` 
    4. Add `iMojeSDKAccessToken` key with a string value of your `accessToken`

2. Use 
```swift
func configure(merchantId: String, serviceId: String, serviceKey: String, accessToken: String)
```

## Installation

imoje-ios-sdk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod 'iMojeSDK', '0.1.0'
```

## Localizable
Create file Localizable.strings like in [iMojeSDK](https://github.com/trmquang93/iMojeSDK/blob/master/iMojeSDK/Assets/Localizations/en.lproj/Localizable.strings)

```swift
// Change sdk language
iMojeSDK.sharedInstance.setLanguage(language: "pl")
```

## Usage
```swift
func showCheckout(amount: Int) {
        let window = UIApplication.shared.windows.first
        let info = Checkout()
        info.type = TransactionType.sale
        info.amount = amount
        info.currency = "PLN"
        let uuid = UUID().uuidString
        switch viewModel.forceResultTransaction {
        case .success:
            info.orderId = "TEST SUCCESS SDK-OID-\(uuid)"
        case .failure:
            info.orderId = "TEST FAIL SDK-OID-\(uuid)"
        default:
            info.orderId = "SDK-OID-\(uuid)"
        }
        
        info.title = "sdk test"
        info.paymentMethod = self.viewModel.paymnentMethod
        info.widgetType = viewModel.recurring ? PaymentWidgetType.recurring : PaymentWidgetType.ecom3ds
        info.paymentFor = "Shop name of customer"
        let customer = Customer()
        customer.firstName = self.viewModel.firstName
        customer.lastName = self.viewModel.lastName
        customer.email = self.viewModel.email
        customer.cid = "123"
        info.customer = customer
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            PaymentMethodView.appearance().numbersOfColumn = 5
        }
        
        if info.paymentMethod == .twisto {
            let cartData = CartData(
                address:
                CartDataAddress(
                    billing: Address(
                        name: "Jan Kowalski",
                        street: "Warszawska",
                        city: "Miasto",
                        postalCode: "00-000",
                        country: "PL",
                        phone: "500000000"),
                    delivery: Address(
                        name: "Anna Nowak",
                        street: "Kwietna",
                        city: "Miasto",
                        postalCode: "00-000",
                        country: "PL",
                        phone: "500000000")),
                shipping: Cost(name: "Kurier", amount: 15, vat: 23),
                discount: Cost(name: "Znizka", amount: 19, vat: 23),
                items: [
                    Cost(id: "1", quantity: 2, name: "Koszulka", amount: 49.00, vat: 23)
                ]
            )
            info.cartData = cartData
        }
        
        iMojeSDK.sharedInstance.checkout(from: window?.rootViewController, info: info) { (txnId, err) in
            if let `txnId` = txnId, !txnId.isEmpty {
                self.recentTransactionViewModel.enqueue(txnId: txnId)
            }
        }
```
## Author

Netizens, biuro@netizens.pl

## License

iMojeSDK is available under the MIT license. See the LICENSE file for more info.

