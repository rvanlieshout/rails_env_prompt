lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_env_prompt/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_env_prompt'
  spec.version       = RailsEnvPrompt::VERSION
  spec.authors       = ['Rene van Lieshout']
  spec.email         = ['rene@lico.nl']
  spec.licenses      = ['MIT']

  spec.summary       = 'Adds current Rails env and Apartment tenant to prompt'
  spec.description   = 'Adds current Rails env and Apartment tenant to prompt'
  spec.homepage      = 'https://github.com/rvanlieshout/rails_env_prompt'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  # spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 13.0'
end
