# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'ct'

Gem::Specification.new do |s|
	s.name		= 'ct'
	s.version	= Ct::VERSION
	s.date		= '2013-06-06'
	s.summary	= 'A quick way to count files'
	s.license	= 'GPL-3'
	s.platform	= Gem::Platform::RUBY
	s.description	= 'A command-line tool to count the number of file and/or diretories in a given directory'
	s.authors	= ['Hans-Nikolai Viessmann']
	s.email		= 'hans@viessmann.co'
	s.files		= Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md)
	s.require_path	= 'lib'
	s.executables	= ['ct']
	s.homepage	= 'https://github.com/hv15/ct'
end
