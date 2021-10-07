# frozen_string_literal: true

require File.expand_path(
  File.join("..", "lib", "omniauth", "webex", "version"),
  __FILE__
)

Gem::Specification.new do |s|
  s.name        = "omniauth-webex"
  s.version     = OmniAuth::Webex::VERSION
  s.authors     = ["Jamie Wright"]
  s.email       = ["jamie@brilliantfantastic.com"]
  s.homepage    = "https://github.com/jwright/omniauth-webex"
  s.description = %(A Webex OAuth strategy for OmniAuth)
  s.summary     = %(A Webex OAuth strategy for OmniAuth. This allows you to add login with Webex to your Ruby apps.)
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2")

  s.add_dependency "omniauth-oauth2", "~> 1.7"

  s.add_development_dependency "rake", "> 10.0.0"
end
