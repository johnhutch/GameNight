# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "formalize-rails"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Iain Hecker"]
  s.date = "2012-06-25"
  s.description = "This gem provides the assets for the formalize form styling, for easy usage with the Rails 3.1 asset pipeline."
  s.email = ["iain@iain.nl"]
  s.homepage = "https://github.com/iain/formalize-rails"
  s.require_paths = ["lib"]
  s.rubyforge_project = "formalize-rails"
  s.rubygems_version = "1.8.24"
  s.summary = "Use Formalize with the asset pipeline"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["~> 3.1"])
    else
      s.add_dependency(%q<railties>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<railties>, ["~> 3.1"])
  end
end
