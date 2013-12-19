#!/usr/bin/env ruby
# -*- ruby -*-

require 'rake/clean'
require 'rake/testtask'

task :default => :test

task :test do
  ruby 'test_date_parser.rb'
end
