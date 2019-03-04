lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord-records_on_load/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-records_on_load'
  spec.version       = Activerecord::RecordsOnLoad::VERSION
  spec.authors       = ['Jun0kada']
  spec.email         = ['jun.0kada.dev@gmail.com']

  spec.summary       = 'Add hook on activerecord records loaded'
  spec.description   = 'Add hook on activerecord records loaded'
  spec.homepage      = 'https://github.com/Jun0kada/activerecord-records_on_load'
  spec.license       = 'MIT'

  spec.require_paths = ['lib']
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
     f.match(%r{^(test|spec|features)/})
   end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
end
