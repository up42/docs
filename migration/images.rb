#!/usr/bin/env ruby

require 'fileutils'

path = '../build/html/_images'
urls = `grep -ro '\([./]*images\/[-_.[:alnum:]]*\)' content`.split(/\n+/)

# urls = urls.collect do |url|
#   url.gsub(/[\w-]+\.mdx:\((images\/\S+)\)/, '\1')
# end
# 
# urls = urls.collect do |url|
#   url.gsub(/[\w-]+\/[\w-]+\.mdx:\(\.\.\/(images\/\S+)\)/, '\1')
# end

urls = urls.collect do |url|
  url[/\([\.\.\/]*(images\/\S+)\)/, 1]
end

urls.each do |url|
  filename = File.basename(url)
  dirname = 'content/images'
  source = File.join(path, filename)
  destination = File.join(dirname, filename)
  
  puts "Copying: #{filename}\n----------------------------------------"

  if File.exist?(source)
    puts "File Exists: 🟢"
    FileUtils.mkpath(dirname)
    FileUtils.copy(source, destination)
    # puts `/Applications/ImageOptim.app/Contents/MacOS/ImageOptim #{destination}`
  else
    puts "File Exists: 🔴" 
  end

  puts "----------------------------------------\n\n"
end
