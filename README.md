# iMojeSDK

[![CI Status](https://img.shields.io/travis/imoje/iMojeSDK.svg?style=flat)](https://travis-ci.org/imoje/iMojeSDK)
[![Version](https://img.shields.io/cocoapods/v/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)
[![License](https://img.shields.io/cocoapods/l/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)
[![Platform](https://img.shields.io/cocoapods/p/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)

## Installation

imoje-ios-sdk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod 'iMojeSDK'
```

## Localizable
Create file Localizable.strings like in [iMojeSDK](https://github.com/trmquang93/iMojeSDK/blob/master/iMojeSDK/Assets/Localizations/en.lproj/Localizable.strings)

```swift
// Change sdk language
iMojeSDK.sharedInstance.setLanguage(language: "pl")
```

## Usage
- Create new `INGChosePaymentViewController`
```swift
func showChosePaymentButton() {
    let payments: [INGPaymentMethod] = [
        .custom(id: "blik", image: .url(imageURL: URL(string: "https://data.imoje.pl/img/pay/blik.png")!), name: "BLIK", details: nil),
        .custom(id: "pbl", image: .url(imageURL: URL(string: "https://data.imoje.pl/img/pay/pbl.png")!), name: "Pay by link", details: "Lorem ipsum lorem"),
        .custom(id: "twisto", image: .url(imageURL: URL(string: "https://data.imoje.pl/img/pay/twisto.png")!), name: "Twisto", details: "Lorem ipsum lorem"),
        .custom(id: "card", image: .url(imageURL: URL(string: "https://data.imoje.pl/img/pay/mastercard.png")!), name: "Pay by card", details: "Lorem ipsum lorem"),
    ]
    
    let viewController = INGChosePaymentViewController(payments: payments)
    
    viewController.itemSelected = {[weak self] method in
        self?.showConfirmView(item: method)
    }
    
    showViewController(viewController, animated: true)
}
```
- Create new `INGConfirmViewController`
```swift
func showConfirmView(item: INGPaymentMethod) {
    var info = INGConfirm(amount: 1000)
    info.currency = "PLN"
    let uuid = UUID().uuidString
    info.orderId = "SDK-OID-\(uuid)"
    info.title = "some title"
    info.paymentMethod = INGPaymentMethodType.from(string: item.id)
    info.paymentFor = """
    iApps4U Krystian Kulawiak
    Str Biskupice 63
    Sieradz 98-200, Poland
    NIP 8272323448
    REGON 385961712
    """
    var customer = INGConfirm.Customer()
    customer.firstName = "Jan"
    customer.lastName = "Kowalski"
    customer.email = "jkowalski@gmail.com"
    customer.phone = "512615122"
    customer.cid = "123"
    info.customer = customer
    
    let confirmViewController = INGConfirmViewController(confirm: info)
    
    confirmViewController.callback = {[weak self] in
        self?.submitPayment(confirm: info)
    }
    showViewController(confirmViewController, animated: true)
}
```
- Create `INGBankViewController`
```swift
func showBanks(_ banks: [INGBank]) {
    let banksViewController = INGBankViewController(banks: banks)
    banksViewController.bankSelected = {[weak self] bank in
        // Create new transaction with selected bank
    }
    showViewController(banksViewController, animated: true)
}
```
- Create `INGWebViewController`
```swift
func showWebView(request: URLRequest?, html: String?, baseURL: URL?) {
    var webViewContent: INGWebViewContent
    if let request = request {
        webViewContent = .request(request: request)
    } else {
        webViewContent = .html(html: html ?? "", baseURL: baseURL)
    }
    let webView = INGWebViewController(content: webViewContent)

    showViewController(webView, animated: true)
}
```
## Author

Netizens, biuro@netizens.pl

## License

iMojeSDK is available under the MIT license. See the LICENSE file for more info.

