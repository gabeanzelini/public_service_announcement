# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.author = "Gabe Anzelini"
  s.email = "me@gabeanzelini.com"
  s.homepage = "http://github.com/gabeanzelini/public_service_announcement"
  s.name = "public_service_announcement"
  s.summary = "Insert PublicServiceAnnouncement summary."
  s.description = "Rails Engine allowing centralized management of public alerts."
  s.add_dependency "rails", "3.0.3"
  s.add_dependency "inherited_resources"
  s.add_dependency "simple_form"        
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.version = "0.1.1"
end