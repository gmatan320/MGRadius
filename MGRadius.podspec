Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "MGRadius"
s.summary = "MGRadius let you choose radius to drive"
s.requires_arc = true

# 2
s.version = "1.0.4"

# 3
s.license = { :type => 'MIT', :text => <<-LICENSE
MIT License

Copyright (c) 2018 Matan Genezia

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

LICENSE
}

# 4 - Replace with your name and e-mail address
s.author = { "Matan" => "gmatan.320@gmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/gmatan320/MGRadius"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/gmatan320/MGRadius.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"
# s.dependency 'Alamofire', '~> 2.0'
# s.dependency 'MBProgressHUD', '~> 0.9.0'

# 8
s.source_files = "MGRadius/**/*.{h,m}"

# 9
# s.resources = "MGRadius/**/*.{png,xib,jpg,jpeg,storyboard}"
end
