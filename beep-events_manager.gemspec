# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beep/events_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "beep-events_manager"
  spec.version       = Beep::EventsManager::VERSION
  spec.authors       = ["Iuri Menescal"]
  spec.email         = ["iuri@beepsaude.com.br"]
  spec.summary       = %q{Gem para armazenar os eventos dos micros serviços}  
  spec.homepage      = "https://github.com/beep-saude/beep-events-manager"  

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pg", "~> 0.21.0"
end
