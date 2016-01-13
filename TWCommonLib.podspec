Pod::Spec.new do |s|
  s.name         = "TWCommonLib"
  s.version      = "0.9"
  s.summary      = "Library containing iOS components and helpers I use in my projects"
  s.homepage     = "https://github.com/wyszo/TWCommonLib"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Tomasz W"
  s.platform = :ios, '8.0'
  s.social_media_url   = "http://twitter.com/Wyszo"
  s.source       = { :git => "https://github.com/wyszo/TWCommonLib.git", :tag => "CommonLib_0_9" }
  s.frameworks   = "CoreMotion", "MapKit", "CoreData"
  s.source_files  = "TWCommonLib", "TWCommonLib/**/*.{h,m,swift}"
  s.exclude_files = "TWCommonLib/Exclude", "TWCommonLib/Pods", "TWCommonLib/iOSInjectionProject", "TWCommonLib/TWCommonLib Tests"

  s.dependency  'UIAlertView-Blocks', '1.0'
  s.dependency  'KZAsserts', '1.0'
  s.dependency  'LBDelegateMatrioska', '0.0.2'
  s.dependency  'BlocksKit', '2.2.5'
  s.dependency  'FLKAutoLayout', '0.2.1'
  s.dependency  'MagicalRecord', '2.3.0' 
end
