require 'google/cloud/storage'
require 'pathname'

def doc_files
  Dir.glob('build/html/**/*').select { |f| File.file?(f) }
end

desc 'Upload the generated HTML files to the docs bucket'
task 'upload_generated_files' do
  bucket_name = ENV.fetch 'BUCKET_NAME'
  doc_files.each { |file_path| upload_file_to_bucket(file_path, bucket_name) }
end

def upload_file_to_bucket(file_path, bucket_name)
  @storage ||= Google::Cloud::Storage.new
  bucket = @storage.bucket bucket_name

  puts "Uploading #{file_path} to #{bucket_name}/#{file_path}"

  # create a google storage file
  bucket.create_file(file_path, file_path.gsub(/^build\/html\//, ''))
end

