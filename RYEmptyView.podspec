#
# Be sure to run `pod lib lint RYEmptyView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RYEmptyView'
  s.version          = '0.1.0'
  s.summary          = 'runtime方式动态加载空占位图'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  tableView collectionView使用runtime方式动态加载空的占位图
                       DESC

  s.homepage         = 'https://github.com/Runyalsj/RYEmptyView.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Runyalsj' => 'runya_lsj@163.com' }
  s.source           = { :git => 'https://github.com/Runyalsj/RYEmptyView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  #s.source_files = 'RYEmptyView/Classes/**/*'
  s.subspec 'RYEmptyView' do |c|
    c.source_files = 'RYEmptyView/Classes/RYEmptyView/**/*'
    c.dependency  'Masonry'
  end

  s.resource_bundles = {
    'RYEmptyView' => ['RYEmptyView/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
