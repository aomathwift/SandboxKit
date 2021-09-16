Pod::Spec.new do |spec|
  spec.name         = "SandboxKit"
  spec.version      = "0.1.0"
  spec.summary      = "Framework that makes it easy to launch a single Scene of your application"
  spec.homepage     = "https://github.com/aomathwift/SandboxKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "aomathwift" => "a.okw1011@gmail.com" }
  spec.social_media_url   = "https://twitter.com/aomathwift"
  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/aomathwift/SandboxKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "SandboxKit/*.{h,m}"
  spec.swift_version = "5.4"
end
