#!/usr/bin/env ruby

require 'csv'
require 'fileutils'

csv = CSV.parse(File.read("content-inventory/Documentation Hub · Content Inventory - Current.csv"), headers: true)
path = '../build/html'

csv.reject { |row| (row['Migration ID'] == '✗') }.map do |row|
  source = path + row['URL']
  destination = row['Migration File']

  puts "Processing: #{row['ID']} #{row['Title']}\n----------------------------------------"
  puts "Checking Source #{source}: #{File.exist?(source)}"
  puts "Checking Destination #{destination}: #{File.exist?(destination)}"

  if File.exist?(source) and File.exist?(destination)
    puts "Converting reStructured Text to Markdown"
    system("pandoc --from html --to markdown_strict-raw_html+backtick_code_blocks --wrap none #{source} >> #{destination}")
  else
    puts "Missing source or destination file."
  end

  puts "----------------------------------------\n\n"
end
