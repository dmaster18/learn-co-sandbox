
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "top_one_hundred_movies/version"

Gem::Specification.new do |spec|
  spec.name          = "top_one_hundred_movies"
  spec.version       = TopOneHundredMovies::VERSION
  spec.authors       = ["'David Strauch'"]
  spec.email         = ["'dmaster18@gmail.com'"]

  spec.summary       = %q{TopOneHundredMovies is a program that allows users to see IMDb's Top 100 Movies of All Time and to obtain details about movies they'd like to know more about.}
  spec.description   = %q{TopOneHundredMovies is a program that allows users to see IMDb's Top 100 Movies of All Time and to obtain details about movies they'd like to know more about. Users can find out basic information about one of these highly regarded movies such as the movie's title, director, year of release, rating, duration, and genres. If the user chooses, he or she can learn even more intricate details about the film such as its tagline, plot, famous quotes, trivia, and full cast.}
  spec.homepage      = "https://github.com/dmaster18/movie.rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/dmaster18/movie.rb"
    spec.metadata["changelog_uri"] = "https://github.com/dmaster18/movie.rb"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.10.7"
  spec.add_development_dependency "actionview", "~> 6.0.1"
  spec.add_development_dependency "builder", "~> 3.2.3"
  spec.add_development_dependency "activesupport", "~> 6.0.1"
  spec.add_development_dependency "erubi", "~> 1.9.0" 
  spec.add_development_dependency "rails-html-sanitizer", "~> 1.3.0" 
  spec.add_development_dependency "actionpack", "~> 6.0.1"
  spec.add_development_dependency "activemodel", "~> 6.0.1"  
end
