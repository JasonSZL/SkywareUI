Pod::Spec.new do |s|
  s.name         = "SkywareUI"
  s.version      = "1.1.2"
  s.summary      = "Skyware->UI"
  s.homepage     = "https://github.com/lixiao7215981"
  s.license      = "MIT"
  s.author             = { "SuperlX" => "2750949592@qq.com" }
  s.social_media_url   = "http://weibo.com/2106002880/profile?topnav=1&wvr=6"
  s.source       = { :git => "https://github.com/lixiao7215981/SkywareUI.git", :tag => s.version }
  s.source_files  = "SkywareUI/SkywareUI/SkywareUI/**/*.{h,m}"
  s.resources = "SkywareUI/SkywareUI/SkywareUI/**/*.{xib,storyboard,png}"
  s.requires_arc = true
  s.dependency  'SkywareSDK'
  s.dependency  'SMS_SDK'
  #s.ios.deployment_target = "6.0"
  #s.osx.deployment_target = "10.8"
end