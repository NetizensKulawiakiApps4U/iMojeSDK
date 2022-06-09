Pod::Spec.new do |s|
  s.name             = 'iMojeSDK'
  s.version          = '0.1.5'
  s.summary          = 'iMojeSDK'
  s.homepage         = 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Netizens' => 'biuro@netizens.pl' }
  s.source           = { :git => 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK.git', :tag => s.version.to_s }

  s.resource_bundles = {'iMojeSDK' => ['iMojeSDK/Assets/*.xcassets']}
  s.ios.deployment_target = '9.0'
  # s.vendored_frameworks = 'build/iMojeSDK.xcframework'
  # s.public_header_files = 'build/iMojeSDK.framework/Headers/*.h'
  # s.source_files = 'build/iMojeSDK.framework/Headers/*.h'
  s.resources =  [
    'iMojeSDK/Assets/*.{xcassets}',
    'iMojeSDK/Assets/Fonts/*.{otf}',
    'iMojeSDK/Assets/Fonts/*.{ttf}',
    'iMojeSDK/Assets/Localizations/**/*.{strings}'
  ]
  s.frameworks = 'Foundation', 'Security', 'UIKit', 'WebKit'
  s.dependency 'Alamofire', '4.9.1'
  s.dependency 'AlamofireImage', '3.6.0'
  s.dependency 'RxSwift', '6.5.0'
  s.dependency 'RxCocoa', '6.5.0'
  s.subspec 'SDKSupport' do |sp|
    sp.vendored_frameworks = 'build/iMojeSDK.xcframework'
  end
end
