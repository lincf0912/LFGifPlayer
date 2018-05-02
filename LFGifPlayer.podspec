Pod::Spec.new do |s|
s.name         = 'LFGifPlayer'
s.version      = '1.0.0'
s.summary      = 'Gif player.'
s.homepage     = 'https://github.com/lincf0912/LFGifPlayer'
s.license      = 'MIT'
s.author       = { 'lincf0912' => 'dayflyking@163.com' }
s.platform     = :ios
s.ios.deployment_target = '7.0'
s.source       = { :git => 'https://github.com/lincf0912/LFGifPlayer.git', :tag => s.version, :submodules => true }
s.requires_arc = true
s.source_files = 'LFGifPlayer/class/*.{h,m}'
s.public_header_files = 'LFGifPlayer/class/*.h'

end
