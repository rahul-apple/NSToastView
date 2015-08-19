#
# Be sure to run `pod lib lint NSToastView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NSToastView"
  s.version          = "0.1.2"
  s.summary          = "An iOS Toast Similar for Android Toast."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
The class designed for showing a Toast with an Object in IOS .The code written in Objective-C

                       DESC

  s.homepage         = "https://github.com/rahul-apple/NSToastView"
  # s.screenshots     = "http://imgur.com/KMjmhPDhttp://imgur.com/KMjmhPD"
  s.license          = 'MIT'
  s.author           = { "rahul-apple" => "rahulthazhuthala@gmail.com" }
  s.source           = { :git => "https://github.com/rahul-apple/NSToastView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/@hijaz3710'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'NSToastView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
