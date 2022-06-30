Pod::Spec.new do |s|
  s.name             = 'Fatos'
  s.version          = '1.1.4'
  s.summary          = 'FATOS Mogos SDK for internal distribution via gitlab.'

  s.description      = <<-DESC
  Software Development Kit to display 3d map and provide navigation functionalities.
                       DESC

  s.homepage         = 'https://git.fatos.biz/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FATOS' => 'dev@fatoscorp.com' }
  s.source           = { :git => 'https://github.com/devfatoscorp/mogos-fatos-ios-sdk.git', :tag => s.version.to_s }
  s.resource         = 'ResFatos.bundle'
  s.swift_version    = '5.0'
  s.platform         = :ios

  s.ios.deployment_target = '13.0'
  s.source_files = [
    "include/*.h"
  ]
  s.preserve_path = 'module/module.modulemap'
  s.module_map = 'module/module.modulemap'
  s.pod_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
      'OTHER_LDFLAGS' => ['-ObjC', '-lc++', ''],
      'DEFINES_MODULE' => 'YES',
      'OTHER_SWIFT_FLAGS' => '',
      'HEADER_SEARCH_PATHS' => ' /Fatos/module',
      'SWIFT_INCLUDE_PATHS' => '/include'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.frameworks = 'GLKit', 'OpenGLES', 'QuartzCore', 'UIKit', 'Foundation', 'CoreGraphics', 'CoreAudio', 'WebKit', 'CoreTelephony', 'CoreLocation', 'AudioToolBox', 'AVFoundation'
  s.vendored_libraries = 'libFatos.a'

end
