#!/usr/bin/env ruby

require 'fileutils'

files = `find content -type f -name '*.mdx'`.split(/\n+/)

files.each do |file|
  puts "Formatting: #{file.gsub('content/', '')}\n----------------------------------------"

  content = File.read(file)

  # Remove blockquotes.
  content = content.gsub(/^> */, '')
  
  # Convert indented to fenced code blocks.
  # content = content.gsub(/( {4,}[^-].*(\n+ {4,}.+)*)/, "```json\n" + '\1' + "\n```")
  content = content.gsub(/( {4,}[^-].*(\n+ {4,}.+)*)/) do |match|
    if match.start_with?(/ {4,}({|\[)/)
      "```json\n#{match}\n```"
    else
      "```shell\n#{match}\n```"
    end
  end

  # Remove indentation.
  content = content.gsub(/^ {4}/, '')

  # Format tips, notes, and warnings.
  content = content.gsub(/^Tip\n\n(.+)/, "<Alert type=\"tip\">\n\n" + '\1' + "\n\n</Alert>")
  content = content.gsub(/^Note\n\n(.+)/, "<Alert type=\"info\">\n\n" + '\1' + "\n\n</Alert>")
  content = content.gsub(/^Warning\n\n(.+)/, "<Alert type=\"warning\">\n\n" + '\1' + "\n\n</Alert>")

  File.open(file, 'w') {|file| file.puts(content) }

  puts "----------------------------------------\n\n"
end
