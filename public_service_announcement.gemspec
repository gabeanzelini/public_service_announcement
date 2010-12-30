# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "public_service_announcement"
  s.summary = "Insert PublicServiceAnnouncement summary."
  s.description = "Insert PublicServiceAnnouncement description."
  s.files = `git ls-files`.split("\n")
  s.version = "0.0.1"
end