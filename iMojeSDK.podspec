Pod::Spec.new do |s|
  s.name             = 'iMojeSDK'
  s.version          = '0.1.0'
  s.summary          = 'iMojeSDK'
  s.homepage         = 'https://git.netizens.pl/imoje'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Netizens' => 'biuro@netizens.pl' }
  s.source           = { :git => 'https://git.netizens.pl/imoje/imoje-sdk-ios.git', :tag => s.version.to_s }
  s.subspec 'iMojeSDKSubSpec' do |sub_spec|
    sub_spec.dependency 'Alamofire', '4.9.1'
    sub_spec.dependency 'RxSwift', '5.1.1'
    sub_spec.dependency 'RxCocoa', '5.1.1'
  end
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'build/iMojeSDK-Release-iphoneuniversal/iMojeSDK.framework'
  s.public_header_files = 'build/iMojeSDK-Release-iphoneuniversal/iMojeSDK.framework/Headers/*.h'
  s.source_files = 'build/iMojeSDK-Release-iphoneuniversal/iMojeSDK.framework/Headers/*.h'
  s.resources =  [
      'iMojeSDK/Assets/*.{xcassets}',
      'iMojeSDK/Assets/Fonts/*.{otf}',
      'iMojeSDK/Assets/Localizations/**/*.{strings}'
  ]
  s.frameworks = 'Foundation', 'Security', 'UIKit', 'WebKit'
end
