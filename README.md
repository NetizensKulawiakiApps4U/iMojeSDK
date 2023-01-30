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
Add this line on the top of pod file
```swift
install! 'cocoapods', :disable_input_output_paths => true
```

## Localizable
Create file Localizable.strings like in [iMojeSDK](https://github.com/trmquang93/iMojeSDK/blob/master/iMojeSDK/Assets/Localizations/en.lproj/Localizable.strings)

```swift
// Change sdk language
iMoje.sharedInstance.setLanguage(language: "pl")
```

## Usage
- Create new `INGChosePaymentViewController` with extra payment methods  
```swift
func showChosePaymentButton() {
    let customPayments: [INGPaymentMethod] = [
        .custom(id: "visa", image: .named(imageName: "imoje"), name: "Dodatkowy kafelek")
    ]
    
    let viewController = INGChosePaymentViewController(customItems: customPayments)
    viewController.navigationBarTitle = nil
    
    viewController.itemSelected = {[weak self] method in
        self?.showConfirmView(item: method)
    }
    
    showViewController(viewController, animated: true)
}
```
- Retrive standard id Payment Method  `INGPaymentMethodType`
```swift
    INGPaymentMethodType.from(string: item.id)
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
- Create `INGBankViewController` with custom bank item
```swift
func showBanks(_ banks: [INGBank], confirm: INGConfirm) {
    let customBank = INGBank(paymentMethod: .custom(code: "Custom"), paymentMethodCode: .custom(code: "custom", image: .url(imageURL: URL(string: "https://www.interest.co.nz/sites/default/files/feature_images/bank-3_0_0_0.jpg")!), name: "Custom Bank"), isActive: true, isOnline: false, currency: "PLN")
    
    let banksViewController = INGBankViewController(banks: banks + [customBank])
    banksViewController.bankSelected = {[weak self] bank in
        self?.createTransaction(with: bank, confirm: confirm)
    }
    banksViewController.navigationBarTitle = nil
    banksViewController.numbersOfColumn = 3
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
## ApplePay usage
- Start ApplePay 

```swift
    var applePayHandler: INGApplePayHandler?
    
    func createApplePayPayment(confirm: INGConfirm) {
        let transaction = INGApplePayTransaction(merchantIdentifier: "Your merchant",
                                                 paymentItemDescription: "Payment Description",
                                                 amount: NSDecimalNumber(value: confirm.amount / 100)) // amount = 100.99 is equal to 100,99 zł
        applePayHandler = INGApplePayHandler(onSuccess: { resultToken in
            guard let codableToken = resultToken.codable else {
                return
            }
            let transaction: CreateTransaction = self.baseTransaction(confirm: confirm)
            transaction.paymentMethod = .card
            transaction.paymentMethodCode = .ecom3ds
            transaction.wallet = .init(applePay: codableToken)
            self.createTransaction(transaction)
        }, onFailure: { [weak self] error in
            self?.showError(error: error)
        })
        applePayHandler?.purchase(in: self, with: transaction)
    }
```

## Author

Netizens, biuro@netizens.pl

## License

iMojeSDK is available under the MIT license. See the LICENSE file for more info.

