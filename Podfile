use_frameworks!

platform :ios, '13.5'

target 'KMMBridgeKickStartIos' do
  if ENV.include?("LOCAL_KOTLIN_PATH")
    pod 'KMMBridge-KickStart', :path => ENV["LOCAL_KOTLIN_PATH"]
  else
    pod 'KMMBridge-KickStart', '~> 0.1'
  end
end

source 'git@github.com:touchlab/PodSpecs.git'
source 'https://github.com/CocoaPods/Specs.git'
