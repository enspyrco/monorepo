#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_box2d_macos.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_box2d_macos'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'

  # Box2D source & headers
  s.public_header_files = 'Classes/**/*.h'
  s.source_files        = 'Classes/**/*.{cpp,h}'
  s.pod_target_xcconfig = {
    # Allow relative "#include"s from the project base directory:
    'HEADER_SEARCH_PATHS' => [
      '$(PODS_TARGET_SRCROOT)/Classes/include',
      '$(PODS_TARGET_SRCROOT)/Classes/src',
    ],

    # # Ensure some particular C++ standard, e.g:
    # 'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    # 'DEFINES_MODULE' => 'YES',
    # # Flutter.framework does not contain a i386 slice.
    # 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
  }

end
