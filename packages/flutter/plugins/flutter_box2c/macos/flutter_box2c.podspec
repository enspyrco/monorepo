#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_box2c.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_box2c'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'

  # Box2C source & headers
  s.source_files        = 'Classes/**/*.{c,h}'
  s.pod_target_xcconfig = {
    # Allow relative "#include"s from the project base directory:
    'HEADER_SEARCH_PATHS' => [
      '$(PODS_TARGET_SRCROOT)/Classes/include',
      '$(PODS_TARGET_SRCROOT)/Classes/src',
    ],
  }

end
