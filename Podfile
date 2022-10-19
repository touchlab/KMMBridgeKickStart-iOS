use_frameworks!

platform :ios, '13.5'

target 'Brownfield' do
  if ENV.include?("LOCAL_KOTLIN_PATH")
    pod 'allshared', :path => ENV["LOCAL_KOTLIN_PATH"]
  else
    pod 'allshared', '~> 1.0'
  end
  
  pod 'SQLite.swift', '~> 0.13'
end

source 'git@github.com:touchlab/PodSpecs.git'
source 'https://github.com/CocoaPods/Specs.git'
