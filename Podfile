use_frameworks!

platform :ios, '13.5'

target 'Brownfield' do
  if ENV.include?("LOCAL_KOTLIN_PATH")
    pod 'BrownfieldSDK', :path => ENV["LOCAL_KOTLIN_PATH"]
  else
    pod 'BrownfieldSDK', '~> 1.0'
  end
end

source 'git@github.com:touchlab/PodSpecs.git'
