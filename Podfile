# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
source "https://github.com/CocoaPods/Specs.git"

target 'Example iOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  pod 'SnapKit'
  # Pods for Example

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
  end
end
