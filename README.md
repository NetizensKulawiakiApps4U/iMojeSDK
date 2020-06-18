# iMojeSDK

[![CI Status](https://img.shields.io/travis/imoje/iMojeSDK.svg?style=flat)](https://travis-ci.org/imoje/iMojeSDK)
[![Version](https://img.shields.io/cocoapods/v/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)
[![License](https://img.shields.io/cocoapods/l/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)
[![Platform](https://img.shields.io/cocoapods/p/iMojeSDK.svg?style=flat)](https://cocoapods.org/pods/iMojeSDK)

## iMoje app test

To run the app test project, clone the repo https://git.netizens.pl/imoje/imoje-app-ios.git, and run `pod install` from the imoje-app-ios directory first.

## Requirements

### Build frameworks 
1. Run `pod install`
2. Open `iMojeSDK.xcworkspace`
3. Build scheme `iMojeSDK-universal`
4. `iMojeSDK.framework` then build at dir `./build`

### Gen documents
1. Install [jazzy](https://github.com/realm/jazzy)
2. Run `jazzy`

### Configure sdk
1. Use plist

    Add your app's iMoje.plist file, add a `iMojeSDKMerchantIdentifier` key with a string value of your `merchantId`, add a `iMojeSDKServiceIdentifier` key with a string value of your `serviceId` and `iMojeSDKAccessToken` key with a string value of your `accessToken`

2. Use `func configure(merchantId: String, serviceId: String, serviceKey: String, accessToken: String)`

## Installation

imoje-ios-sdk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# private
pod 'iMojeSDK', :path => '../imoje-sdk-ios/iMojeSDK-private.podspec'

# local
pod 'iMojeSDK', :path => '../imoje-sdk-ios/iMojeSDK.podspec'

# public
pod 'iMojeSDK', '0.1.0'
```
## Localizable
Create file Localizable.strings like in [iMojeAppTest](https://git.netizens.pl/imoje/imoje-app-ios/-/tree/develop/iMoje/Localizations/pl.lproj/Localizable.strings)

```swift
// Change sdk language
iMojeSDK.sharedInstance.setLanguage(language: "pl")
```

## Author

Netizens, biuro@netizens.pl

## License

iMojeSDK is available under the MIT license. See the LICENSE file for more info.
