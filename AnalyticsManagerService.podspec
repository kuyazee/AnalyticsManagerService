Pod::Spec.new do |s|

  s.name         = "AnalyticsManagerService"
  s.version      = "0.0.1"
  s.summary      = "A Protocol Oriented Analytics Wrapper"
  # s.homepage     = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Zonily Jame Pesquera" => "zonilyjame@gmail.com" }
  s.social_media_url   = "http://twitter.com/kuyazee"

  s.platform     = :ios, "8.0"
  # s.requires_arc = true
  s.source       = { :git => "https://github.com/kuyazee/AnalyticsManagerService.git", :commit => "a3ddd06f43dc2ad9941ff791f819ac43c751c10f" }
  s.source_files  = "Classes", "AnalyticsServiceProtocol/**/*.{h,swift}"

  s.description  = "Reusable Analytics Wrapper"
  s.homepage     = "https://github.com/kuyazee/AnalyticsManagerService"
  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"
end
