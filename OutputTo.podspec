Pod::Spec.new do |s|
  s.name                = "OutputTo"
  s.version             = "0.1.0"
  s.summary             = "Capture NSLog or printf output"
  s.description         = <<-DESC
Returns string containing output captured during execution of a block.
Typical use to assert log output made by code under the test.
Could be used in production code.
Works with printf(), NSLog() and other loggers.
Can capture output to stdout or stderr streams.
                             DESC
  s.homepage            = "https://github.com/paulz/OutputTo"
  s.license             = 'MIT'
  s.author              = { "Paul Zabelin" => "paulz@users.noreply.github.com" }
  s.source              = { :git => "https://github.com/paulz/OutputTo.git", :tag => s.version.to_s }
  s.social_media_url    = 'https://twitter.com/iospaulz'
  s.platform            = :ios, '7.0'
  s.requires_arc        = true
  s.source_files        = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/OutputTo.h'
  s.frameworks          = 'Foundation'
end
