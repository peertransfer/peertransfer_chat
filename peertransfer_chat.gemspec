# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peertransfer_chat/version'

Gem::Specification.new do |spec|
  spec.name          = 'peertransfer_chat'
  spec.version       = PeertransferChat::VERSION
  spec.authors       = ['peerTransfer tech']
  spec.email         = ['tech@peertransfer.com']
  spec.summary       = %q{A common interface to our chat system}
  spec.description   = %q{A common interface to our chat system}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'slackr', '0.0.6'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rspec'
end
