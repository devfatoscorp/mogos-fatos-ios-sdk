Pod::Spec.new do |s|
  s.name             = 'mogos-fatos-ios-sdk'
  s.version          = '0.0.1'
  s.summary          = 'FATOS Mogos SDK for internal distribution via gitlab.'
 
  s.description      = <<-DESC
  Software Development Kit to display 3d map and provide navigation functionalities.
                       DESC
 
  s.homepage         = 'https://git.fatos.biz/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FATOS' => 'dev@fatoscorp.com' }
  s.source           = { :git => 'https://github.com/devfatoscorp/mogos-fatos-ios-sdk.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '13.0'
  s.source_files = [
    "Products/usr/local/include/*.h",
  ]
#s.source_files = [
#    'setting/*.h',
#    'base/*.h',
#    'nativeBridge/*.h',
#    'nativeMap/*.h',
#    'nativeNavi/*.h',
#    'service/*.h',
#    'common/*.h',
#    'openAPI/*.h',
#    'config/*.h'
#    ]

#s.public_header_files = [
#   'base/*.h',
#    'nativeBridge/*.h',
#    'nativeMap/*.h',
#    'nativeNavi/*.h',
#    'service/GPSService.h'
#    ]

#  s.project_header_files = [
#    'config/*.h',
#    'openAPI/*.h',
#    'service/NMEA*.h',
#    'common/*.h',
#    'setting/*.h'
#    ]

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.frameworks = 'GLKit', 'OpenGLES', 'QuartzCore', 'UIKit', 'Foundation', 'CoreGraphics', 'CoreAudio', 'WebKit', 'CoreTelephony', 'CoreLocation'
  s.vendored_libraries = 'Products/usr/local/lib/libFatos.a'
 
end
