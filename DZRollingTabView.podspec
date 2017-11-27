Pod::Spec.new do |s|
s.name         = 'DZRollingTabView'
s.version      = '1.0.1'
s.summary      = 'rolling tab view'
s.homepage     = 'https://github.com/DongZhiChen/DZRollingTabViewDome.git'
s.license= { :type => "MIT", :file => "LICENSE" }
s.authors      = {'ChenDongZhi' => '644495218@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/DongZhiChen/DZRollingTabViewDome.git', :tag => s.version}
s.source_files ='DZRollingTabView/*.{h,m}'
s.requires_arc = true
s.framework  = 'UIKit'
s.dependency 'Masonry'
end
