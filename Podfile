platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

target 'PADGeneral' do

  # Pods for PADGeneral
  pod 'SwiftMessages', '~> 7.0.1'
  pod 'RoundCode', '~> 1.3.0'
  pod 'Sheeeeeeeeet', '~> 3.1.1'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
