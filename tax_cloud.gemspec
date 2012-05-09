$:.push File.expand_path("../lib", __FILE__)
require "tax_cloud/version"

Gem::Specification.new do |s|
  s.name        = "tax_cloud_matmon"
  s.version     = TaxCloud::VERSION
  s.date        = %q{2011-10-20}
  s.authors     = ["Drew Tempelmeyer", "George Murphy"]
  s.email       = ["drewtemp@gmail.com", "gfmurphy@gmail.com"]
  s.homepage    = "https://github.com/Matmon/tax_cloud"
  s.summary     = %q{Calculate sales tax using TaxCloud}
  s.description = %q{Calculate sales tax using the TaxCloud.net API}

  s.required_rubygems_version = '>= 1.3.6'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'savon', '0.9.6'
end
