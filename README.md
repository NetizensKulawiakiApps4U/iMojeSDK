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
- Create new `INGChosePaymentViewController` with extra payment methods  
```swift
func showChosePaymentButton() {
    let extraPayments: [INGPaymentMethod] = [
        .custom(id: "visa", image: .named(imageName: "imoje"), name: "Dodatkowy kafelek")
    ]
    
    let viewController = INGChosePaymentViewController(extraPayments: extraPayments)
    viewController.navigationBarTitle = nil
    
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
    Salon Samochodowy Warszawa
    00-00 Warszawa
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
    let webView = INGWebViewController(content: webViewContent, successRedirectURL: "https://test.com/success", failureRedirectURL: "https://test.com/failure")
    
    webView.onSuccess = {[weak self] in
        print("Success")
        if RootViewController.showViewControllerModally {
            self?.dismiss(animated: true, completion: nil)
        } else {
            self?.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    webView.onFailure = {[weak self] in
        print("Failure")
        if RootViewController.showViewControllerModally {
            self?.dismiss(animated: true, completion: nil)
        } else {
            self?.navigationController?.popToRootViewController(animated: true)
        }
    }

    showViewController(webView, animated: true)
}
```
## Author

Netizens, biuro@netizens.pl

## License

iMojeSDK is available under the MIT license. See the LICENSE file for more info.

