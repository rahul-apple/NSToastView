#
# Be sure to run `pod lib lint NSToastView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "NSToastView"
s.version          = "1.0.0"
s.summary          = "Android Similar toast library for iOS"
s.description      = <<-DESC

Toast in iOS
Usage:


refer the example for More Details


* Markdown format.
* Don't worry about the indent, we strip it!
DESC
s.homepage         = "https://github.com/rahul-apple/NSToastView"
# s.screenshots     = "http://imgur.com/KMjmhPDhttp://imgur.com/KMjmhPD"
s.license          = 'MIT'
s.author           = { "rahul-apple" => "rahulthazhuthala@gmail.com" }
s.source           = { :git => "https://github.com/rahul-apple/NSToastView.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

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
