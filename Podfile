use_frameworks!

platform :ios, '13.5'

target 'KMMBridgeKickStartIos' do
  if ENV.include?("LOCAL_KOTLIN_PATH")
    pod 'allshared', :path => ENV["LOCAL_KOTLIN_PATH"]
  else
    pod 'allshared', '~> 0.2'
  end
end

source 'git@github.com:touchlab/PodSpecs.git'
source 'https://github.com/CocoaPods/Specs.git'
