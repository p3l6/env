#! /usr/bin/env ruby

require 'yaml'

yaml_file = YAML.load_file('config/links.yaml')
repo_path = File.expand_path('..', __dir__)

yaml_file['links'].each do |link|
  new_link = File.join(Dir.home, link['home'])
  repo_file = File.join(repo_path, link['repo'])

  # skip if correct
  next if File.symlink?(new_link) && File.readlink(new_link) == repo_file

  # delete wrong links and plain files
  File.delete(new_link) if File.symlink?(new_link) || File.exist?(new_link)

  # use shell since Dir.mkdir isn't recursive
  system('mkdir', '-p', File.dirname(new_link)) unless Dir.exist?(File.dirname(new_link))

  File.symlink(repo_file, new_link)
  puts "-> Linked #{link['repo']}"
end
