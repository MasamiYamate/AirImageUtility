Pod::Spec.new do |s|
s.name         = "AirImageUtility"
s.version      = "0.0.1"
s.summary      = "Flash Air Utility"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.homepage     = "https://github.com/MasamiYamate/AirImageUtility.git"
s.author       = { "MasamiYamate" => "yamate.inquiry@mail.yamatte.net" }
s.source       = { :git => "https://github.com/MasamiYamate/AirImageUtility.git", :tag => "#{s.version}" }
s.platform     = :ios, "8.0"
s.requires_arc = true
s.source_files = 'AirImageUtility/**/*.{swift}'
s.swift_versions = ['5.0']
s.dependency 'RxSwift'
s.dependency 'RxCocoa'

end
