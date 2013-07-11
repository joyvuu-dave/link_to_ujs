# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'link_to_ujs/version'

Gem::Specification.new do |spec|
  spec.name          = 'link_to_ujs'
  spec.version       = LinkToUjs::VERSION
  spec.authors       = ['gagoar']
  spec.email         = ['xeroice@gmail.com']
  spec.description   = %q{link_to_function with ujs magic}
  spec.summary       = %q{link_to_function its the past , long live to link_to_ujs}
  spec.homepage      = ""
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
