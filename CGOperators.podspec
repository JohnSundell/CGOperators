Pod::Spec.new do |s|
  s.name         = "CGOperators"
  s.version      = "1.0"
  s.summary      = "Easily manipulate CGPoints, CGSizes and CGVectors using math operators"
  s.description  = <<-DESC
    A small Swift framework that enables you to easily manipulate Core Graphic's vector types (CGPoint, CGSize and CGVector) using math operators.
  DESC
  s.homepage     = "https://github.com/JohnSundell/CGOperators"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "John Sundell" => "john@sundell.co" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/JohnSundell/CGOperators.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
