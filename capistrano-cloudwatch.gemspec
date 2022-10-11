# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-cloudwatch'
  spec.version       = '1.0.0'
  spec.authors       = ['lloydwatkin']
  spec.email         = ['lloyd@evilprofessor.co.uk']
  spec.summary       = %q{Publish successful deployment metric to AWS Cloudwatch}
  spec.description   = %q{Publish successful deployment metric to AWS Cloudwatch}
  spec.homepage      = 'https://github.com/olioex/capistrano-cloudwatch'
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'capistrano', '>= 2.3.0'
  spec.add_runtime_dependency 'aws-sdk-cloudwatch'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end