Pod::Spec.new do |s|
  s.name             = 'iMojeSDK'
  s.version          = '0.1.7'
  s.summary          = 'iMojeSDK'
  s.homepage         = 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Netizens' => 'biuro@netizens.pl' }
  s.source           = { :git => 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK.git', :tag => s.version.to_s }

  s.resource_bundles = {'iMojeSDK' => ['iMojeSDK/iMoje-Assets/*.xcassets']}
  s.ios.deployment_target = '9.0'
  s.resources =  [
    'iMojeSDK/iMoje-Assets/*.{xcassets}',
    'iMojeSDK/iMoje-Assets/Fonts/*.{otf}',
    'iMojeSDK/iMoje-Assets/Fonts/*.{ttf}',
    'iMojeSDK/iMoje-Assets/Localizations/**/*.{strings}'
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
