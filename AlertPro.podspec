Pod::Spec.new do |s|
  s.name             = "AlertPro"
  s.version          = "1.0"
  s.summary          = "UIViewController category for easy showing UIAlertController."

  s.homepage         = "https://github.com/ivanshevelev/AlertPro"
  s.license          = 'MIT'
  s.author           = { "Ivan Shevelev" => "ivan.shevelev@sibers.com" }
  s.source           = { :git => "https://github.com/ivanshevelev/AlertPro.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/antsy_ivan'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AlertPro' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
