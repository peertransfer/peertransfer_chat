# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peertransfer_chat/version'

Gem::Specification.new do |spec|
  spec.name          = 'peertransfer_chat'
  spec.version       = PeertransferChat::VERSION
  spec.authors       = ['Flywire Engineering']
  spec.email         = ['engineering@flywire.com']
  spec.summary       = %q{A common interface to our chat system}
  spec.description   = %q{A common interface to our chat system}

  files = Dir['lib/*.rb'] + Dir['lib/**/*.rb']
  rootfiles = ['Gemfile', 'peertransfer_chat.gemspec', 'README.md']
  dotfiles = ['.gitignore']

  spec.files = files + rootfiles + dotfiles
  spec.test_files = Dir['spec/*.rb'] + Dir['spec/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'slack-ruby-client', '~> 0.14'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'coveralls',  '~> 0.8'
end
