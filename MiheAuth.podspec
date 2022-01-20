Pod::Spec.new do |s|
#项目名
  s.name         = "MiheAuth"
#版本号，需要与你git打的tag一致
  s.version      = "1.0.1"
#项目的一个摘要或简介
  s.summary      = "米合授权调用"
#项目支持的最低iOS系统
  s.ios.deployment_target = '10.0'
#项目的具体描述
  s.description  = "no commit"
#项目在github上的地址
  s.homepage     = "https://github.com/yl172326/MiheAuthorize.git"
#项目的许可证说明，在igithub上创建的时候勾选上的license
  s.license      = { :type => "MIT", :file => "LICENSE" }
#作者的信息
  s.author             = { "liu" => "308991136@qq.com" }
#项目代码地址
  s.source       = { :git => "https://github.com/yl172326/MiheAuthorize.git", :tag => "#{s.version}" }
#项目库中需要包含的源文件
  s.source_files  = 'MiheAuth/**/*.{h,m}'
#公开的头文件
  s.public_header_files = "MiheAuth/MiheAuth/**/*.h"


  s.frameworks   = 'UIKit','Foundation'

  s.ios.vendored_frameworks = 'MiheAuth/Products/MiheAuth/MiheAuth.framework'

end
