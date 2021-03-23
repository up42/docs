#!/usr/bin/env ruby

require 'csv'
require 'fileutils'
require 'json'

csv = CSV.parse(File.read("content-inventory/Documentation Hub · Content Inventory - Current.csv"), headers: true)
json = {}

csv.reject { |row| (row['URL'].nil? || row['Redirect URL'].nil?) }.each do |row|
  source = "https://docs.up42.com#{row['URL']}"
  target = row['Redirect URL']

  json[row['URL']] = row['Redirect URL']
  files = `grep -rl "#{source}" content`.split(/\n+/)

  puts "Rewriting URL: #{source} → #{target}\n----------------------------------------"

  files.each do |file|
    content = File.read(file)
    content = content.gsub(source, target)

    File.open(file, 'w') {|file| file.puts(content) }

    puts file
  end

  puts "----------------------------------------\n\n"
end

puts "Creating Manifest\n----------------------------------------"

File.open('content/redirects.json', 'w') {|file| file.puts(JSON.pretty_generate(json)) }
puts 'content/redirects.json'

puts "----------------------------------------\n\n"
