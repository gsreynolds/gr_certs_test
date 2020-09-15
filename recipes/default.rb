#
# Cookbook:: gr_certs_test
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

puts Chef::Config[:trusted_certs_dir]

remote_file ::File.join(Chef::Config[:file_cache_path], 'index.html') do
  source 'https://self-signed.badssl.com/index.html'
end

require 'open-uri'

open('https://self-signed.badssl.com/index.html') do |image|
  File.open('./index.html', 'wb') do |file|
    puts image.read
    file.write(image.read)
  end
end
