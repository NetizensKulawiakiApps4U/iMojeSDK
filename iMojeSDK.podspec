Pod::Spec.new do |s|
  s.name             = 'iMojeSDK'
  s.version          = '0.1.4'
  s.summary          = 'iMojeSDK'
  s.homepage         = 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Netizens' => 'biuro@netizens.pl' }
  s.source           = { :git => 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK.git', :tag => s.version.to_s }
  s.subspec 'iMojeSDKSubSpec' do |sub_spec|
    sub_spec.dependency 'Alamofire', '4.9.1'
    sub_spec.dependency 'AlamofireImage', '3.6.0'
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
    'iMojeSDK/Assets/Fonts/*.{ttf}',
    'iMojeSDK/Assets/Localizations/**/*.{strings}'
  ]
  s.frameworks = 'Foundation', 'Security', 'UIKit', 'WebKit'
end
