# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lmpm/version'

Gem::Specification.new do |gem|
  gem.name          = "lmpm"
  gem.version       = Lmpm::VERSION
  gem.authors       = ["TheNotary"]
  gem.email         = ["no@mail.plz"]
  gem.description   = %q{This gem allows you to easily configure LinuxMint in pre-set configurations which are easy to share online via github.com}
	gem.summary       = %q{The purpose of this gem is really to make it more visable how people are chosing to configure their Linux Mint systems.  It's helpful for users to see what interesting ways LM can be configured.  It's also useful for Linux Mint commiters to see what people like and what people don't like when they're considering default Linux Mint behaviors. }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

	gem.add_dependency "thor"

	gem.add_development_dependency "rake"
	gem.add_development_dependency "pry"
	gem.add_development_dependency "rspec", '~> 2.5'
	gem.add_development_dependency "rdoc"
end