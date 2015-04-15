# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'mericope/version'
  
Gem::Specification.new do |s|
  s.name         = "mericope"
  s.version      = Mericope::VERSION
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Bob Lail", "Duane Johnson"]
  s.email        = ["bob.lailfamily@gmail.com", "duane.johnson@gmail.com"]
  s.homepage     = "http://github.com/wordtreefoundation/mericope"
  s.summary      = "Mericope is a gem for parsing Book of Mormon references."
  s.description  = "It recognizes common abbreviations of the books of the Book of Mormon and a variety of ways of denoting ranges of chapters and verses. Based on Pericope."
                   
  s.add_dependency "activesupport", "~> 4.0"
  
  s.add_development_dependency "rake", "~> 10.4"
  s.add_development_dependency "turn", "~> 0.9"
  s.add_development_dependency "pry",  "~> 0.10"
                           
  s.files        = Dir.glob("{bin,data,lib}/**/*") + %w(README.mdown)
  s.executables  = ['mericope']
  s.default_executable = 'mericope'
  s.require_path = 'lib'
end
