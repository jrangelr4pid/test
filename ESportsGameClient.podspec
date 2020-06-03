#
# Be sure to run `pod lib lint ESportsGameClient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ESportsGameClient'
  s.version          = '0.1.0'
  s.summary          = 'SDK for ESports Game Client'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jrangelr4pid/test'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jrangelr4pid' => 'justine.rangel@r4pid.com' }
  s.source           = { :git => 'https://github.com/jrangelr4pid/test.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'ESportsGameClient/Classes/**/*'
  s.resources = 'ESportsGameClient/Assets/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  #tingyun dependecy start
  s.frameworks = 'SystemConfiguration', 'Security', 'CoreTelephony', 'WebKit'
  s.library = 'c++', 'z'
  s.ios.dependency 'tingyunApp', '~> 2.14'
  #tingyun dependecy end
  
  s.vendored_frameworks = 'ESportsGameClient/Frameworks/*'
end
