# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "email_format_validator/version"

Gem::Specification.new do |s|
  s.name        = "email_format_validator"
  s.version     = "0.0.1"
  s.authors     = ["Axel Vergult"]
  s.email       = ["axel.vergult@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A Rails 3 email format validator following the RFC 822}
  s.description = %q{A Rails 3 email format validator following the RFC 822}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("activemodel", ">= 0")
end
