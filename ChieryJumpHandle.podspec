Pod::Spec.new do |s|


  s.name         = "ChieryJumpHandle"
  s.version      = "0.0.9"
  s.summary      = "ChieryJumpHandle"

  s.description  = <<-DESC
                  ChieryJumpHandle
                  ChieryJumpHandle
                  ChieryJumpHandle
                   DESC

  s.homepage     = "https://github.com/chieryd/ChieryJumpHandle"

  s.license      = { :type => 'MIT', :text => <<-LICENSE
                    Copyright 2012
                    Permission is granted to...
                  LICENSE
                }

  s.author             = { "chiery" => "chieryw@163.com" }

  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/chieryd/ChieryJumpHandle.git", :tag => "#{s.version}" }

  s.source_files  = "ChieryJumpHandle.h", "ChieryJumpHandle/**/*.{h,m}"
  s.public_header_files = "ChieryJumpHandle/*.h","ChieryJumpHandle.h","ChieryJumpHandlePrt.h","ChieryJumpHandleResponsePrt.h"
  s.resources = "ChieryJumpHandle/**/*.plist"
  s.requires_arc = true

end
