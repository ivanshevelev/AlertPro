Pod::Spec.new do |s|
s.name             = "AlertPro"
s.version          = "1.3"
s.summary          = "UIViewController category for easy showing UIAlertController."

s.homepage         = "https://github.com/ivanshevelev/AlertPro"
s.license          = 'MIT'
s.author           = { "Ivan Shevelev" => "ivan.shevelev@sibers.com" }
s.source           = { :git => "https://github.com/ivanshevelev/AlertPro.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/antsy_ivan'

s.ios.deployment_target = '8.0'
s.tvos.deployment_target = '9.0'
s.requires_arc = true

s.source_files = 'Pod/Sources/**/*'
s.public_header_files = 'Pod/Sources/**/*.h'

s.frameworks = 'UIKit'
end
