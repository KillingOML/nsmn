



Pod::Spec.new do |s|
    s.name         = 'nsmn'
    s.version      = '0.0.1'
    s.summary      = 'An easy way to use pull-to-refresh'
    s.homepage     = 'https://github.com/KillingOML/nsmn'
    s.license      = 'MIT'
    s.authors      = { "苏松" => "song.su@corp.elong.com" }
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/KillingOML/nsmn.git', :tag => s.version}
    s.source_files = 'nsmn/**/*.{h,m}'
   # s.resource     = 'MJRefresh/MJRefresh.bundle'
    s.requires_arc = true
end
