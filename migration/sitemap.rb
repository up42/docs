#!/usr/bin/env ruby

require 'csv'
require 'fileutils'

csv = CSV.parse(File.read("content-inventory/Documentation Hub · Content Inventory - New.csv"), headers: true)

csv.reject { |row| (row['Function'] == 'External' || row['Function'] == 'Section') }.map do |row|
  file = row['File']
  directory = File.dirname(file)
  FileUtils.mkpath(directory)

  File.open(file, 'w') { |f| f.write "---\nid: #{row['ID']}\ntitle: #{row['Title']}\ndescription: #{row['Description']}\nfunction: #{row['Function']}\n---\n" }
  puts "#{row['File']}\n----------------------------------------\nid: #{row['ID']}\ntitle: #{row['Title']}\ndescription: #{row['Description']}\nfunction: #{row['Function']}\n----------------------------------------\n\n"
end
