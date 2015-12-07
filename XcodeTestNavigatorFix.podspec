Pod::Spec.new do |s|
  s.name         = "XcodeTestNavigatorFix"
  s.version      = "0.1.0"
  s.summary      = "Prevent last run test case from disappearing from Xcode Test Navigator"

  s.homepage     = "https://github.com/soutaro/XcodeTestNavigatorFix"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = "Soutaro Matsumoto"
  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = '9.0'

  s.source       = { :git => "https://github.com/soutaro/XcodeTestNavigatorFix.git", :tag => "v#{s.version}" }
  s.source_files  = "XcodeTestNavigatorFix/TestNavigatorFix.m"

  s.public_header_files = []

  s.framework = "XCTest"
  s.requires_arc = true
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
end
