# encoding: utf-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_home_page_features'
  s.version     = '2.2.0'
  s.summary     = 'Adds feature articles to the spree home page'
  s.description = 'Allows you to edit articles in the spree admin, which will be displayed on your homepage'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Robert Oles'
  s.email     = 'robertoles@me.com'
  s.homepage  = 'http://www.lockside.co.uk'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 2.2'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end
