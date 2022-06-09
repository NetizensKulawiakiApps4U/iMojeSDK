Pod::Spec.new do |s|
  s.name             = 'iMojeSDK'
  s.version          = '0.1.5'
  s.summary          = 'iMojeSDK'
  s.swift_versions   = '5.0'
  s.homepage         = 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Netizens' => 'biuro@netizens.pl' }
  s.source           = { :git => 'https://github.com/NetizensKulawiakiApps4U/iMojeSDK.git', :tag => s.version.to_s }
  s.resource_bundles = {'iMojeSDK' => ['iMojeSDK/Assets/*.xcassets']}
  s.ios.deployment_target = '9.0'
  s.ios.vendored_frameworks = 'build/iMojeSDK.xcframework'
  
  s.resources =  [
    'iMojeSDK/Assets/*.{xcassets}',
    'iMojeSDK/Assets/Fonts/*.{otf}',
    'iMojeSDK/Assets/Fonts/*.{ttf}',
    'iMojeSDK/Assets/Localizations/**/*.{strings}'
  ]
  s.dependency 'Alamofire'
  s.dependency 'AlamofireImage'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.xcconfig            = { "LIBRARY_SEARCH_PATHS" => '"$(PODS_ROOT)/iMojeSDK"' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.frameworks = 'Foundation', 'Security', 'UIKit', 'WebKit'
end
