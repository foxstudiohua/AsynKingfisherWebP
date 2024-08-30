Pod::Spec.new do |s|
  s.name             = 'KingfisherWebP'
  s.version          = '5.0.1'
  s.swift_version    = '5.0.1'
  s.summary          = 'A Kingfisher extension helping you process webp format'

  s.description      = <<-DESC
KingfisherWebP is an extension of the popular library [Kingfisher](https://github.com/onevcat/Kingfisher), providing a ImageProcessor and CacheSerializer for you to conveniently handle the WebP format.
                       DESC

  s.homepage         = 'https://github.com/foxstudiohua/KingfisherWebP'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yang Chao' => 'iyeatse@gmail.com' }
  s.source           = { :git => 'https://github.com/foxstudiohua/KingfisherWebP.git', :tag => s.version }

  s.ios.deployment_target = "13.0"
  s.osx.deployment_target = "10.15"

  s.frameworks = "Accelerate"

  s.source_files = 'Sources/**/*.{h,m,swift}'
  s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
  }
  s.tvos.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
  }
  s.osx.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
  }
  s.watchos.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) WEBP_USE_INTRINSICS=1',
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
  }

  s.dependency 'Kingfisher'
  s.subspec 'Kingfisher' do |ss|
        ss.source_files = ['Kingfisher/Sources/**/*.swift']
    end
  s.dependency 'libwebp', '>= 1.1.0'
end
