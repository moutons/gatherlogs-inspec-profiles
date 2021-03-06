lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'gatherlogs_reporter'
  spec.version       = File.read('VERSION')
  spec.authors       = ['Will Fisher']
  spec.email         = ['wfisher@chef.io']
  spec.license       = 'Apache-2.0'
  spec.summary       = 'Generate reports gather-logs bundles'
  spec.description   = 'Inspec profiles used to generate reports for gather-logs bundles from Chef products'
  spec.homepage      = 'https://github.com/teknofire/gatherlogs-inspec-profiles'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = %w[ VERSION README.md Rakefile LICENSE gatherlogs_reporter.gemspec
                   Gemfile Gemfile.lock] + Dir.glob(
                     '{bin,lib,etc,profiles,completions}/**/*', File::FNM_DOTMATCH
                   ).reject { |f| File.directory?(f) || f.match?('inspec.lock') }
  if ENV['BUILD_GEM']
    spec.bindir        = 'bin'
    spec.executables   = %w[gatherlogs_report check_logs]
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bump'
  spec.add_development_dependency 'bundler', '>= 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_dependency 'clamp', '~> 1.3'
  spec.add_dependency 'mixlib-shellout', '~> 2.4'
  spec.add_dependency 'paint', '~> 2.0'
end
