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
#  s.resource_bundles = {
#    'ESportsGameClient' => ['ESportsGameClient/Assets/*']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.vendored_frameworks =
    'ESportsGameClient/Frameworks/react_native_safe_area_context.framework',
    'ESportsGameClient/Frameworks/react_native_config.framework',
    'ESportsGameClient/Frameworks/glog.framework',
    'ESportsGameClient/Frameworks/yoga.framework',
    'ESportsGameClient/Frameworks/UMReactNativeAdapter.framework',
    'ESportsGameClient/Frameworks/UMPermissionsInterface.framework',
    'ESportsGameClient/Frameworks/UMCore.framework',
    'ESportsGameClient/Frameworks/UMAppLoader.framework',
    'ESportsGameClient/Frameworks/ReactCommon.framework',
    'ESportsGameClient/Frameworks/jsinspector.framework',
    'ESportsGameClient/Frameworks/jsireact.framework',
    'ESportsGameClient/Frameworks/jsi.framework',
    'ESportsGameClient/Frameworks/cxxreact.framework',
    'ESportsGameClient/Frameworks/RCTVibration.framework',
    'ESportsGameClient/Frameworks/RCTText.framework',
    'ESportsGameClient/Frameworks/RCTSettings.framework',
    'ESportsGameClient/Frameworks/RCTNetwork.framework',
    'ESportsGameClient/Frameworks/RCTLinking.framework',
    'ESportsGameClient/Frameworks/RCTImage.framework',
    'ESportsGameClient/Frameworks/RCTBlob.framework',
    'ESportsGameClient/Frameworks/RCTAnimation.framework',
    'ESportsGameClient/Frameworks/RCTActionSheet.framework',
    'ESportsGameClient/Frameworks/CoreModules.framework',
    'ESportsGameClient/Frameworks/React.framework',
    'ESportsGameClient/Frameworks/RNScreens.framework',
    'ESportsGameClient/Frameworks/RNReanimated.framework',
    'ESportsGameClient/Frameworks/RNGestureHandler.framework',
    'ESportsGameClient/Frameworks/RNCMaskedView.framework',
    'ESportsGameClient/Frameworks/RCTTypeSafety.framework',
    'ESportsGameClient/Frameworks/folly.framework',
    'ESportsGameClient/Frameworks/FBReactNativeSpec.framework',
    'ESportsGameClient/Frameworks/EXWebBrowser.framework',
    'ESportsGameClient/Frameworks/EXUpdates.framework',
    'ESportsGameClient/Frameworks/EXSQLite.framework',
    'ESportsGameClient/Frameworks/EXPermissions.framework',
    'ESportsGameClient/Frameworks/EXLocation.framework',
    'ESportsGameClient/Frameworks/EXLinearGradient.framework',
    'ESportsGameClient/Frameworks/EXKeepAwake.framework',
    'ESportsGameClient/Frameworks/EXImageLoader.framework',
    'ESportsGameClient/Frameworks/EXFont.framework',
    'ESportsGameClient/Frameworks/EXFileSystem.framework',
    'ESportsGameClient/Frameworks/EXErrorRecovery.framework',
    'ESportsGameClient/Frameworks/EXConstants.framework',
    'ESportsGameClient/Frameworks/DoubleConversion.framework',
    'ESportsGameClient/Frameworks/RNSVG.framework'
end
