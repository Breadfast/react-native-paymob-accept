require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-paymob-accept"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-paymob-accept
                   DESC
  s.homepage     = "https://github.com/breadfast/react-native-paymob-accept"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Ghobashy" => "m.ghobashy@breadfast.com" }
  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://github.com/breadfast/react-native-paymob-accept.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,c,m,swift}"
  s.requires_arc = true
  s.swift_version = "5.0"
  s.static_framework= true
  s.pod_target_xcconfig = { "DEFINES_MODULE" => "YES" }

  s.dependency "React"
  s.dependency "AcceptCardSDK", '~> 5.3.4'
  # ...
  # s.dependency "..."
end

