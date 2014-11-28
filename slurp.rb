#!/usr/bin/env ruby

require 'json'
require 'open-uri'
require 'data_uri'
require './image_ids'

def import baseURL, imageId
  puts "* downloading #{baseURL}/#{imageId}.json (jsons/#{imageId}.json) ..."
  content = open("#{baseURL}/#{imageId}.json").read
  open("jsons/#{imageId}.json", 'wb') do |file|
    file << content
  end
  JSON.parse(content)
end

def decode json, imageId, ext='jpg', key='dataUri'
  puts "* creating images/#{imageId}.jpg ..."
  open("images/#{imageId}.#{ext}", 'wb') do |file|
    json = JSON.parse(open("jsons/#{imageId}.json").read)
    uri = URI::Data.new(json[key])
    file << uri.data
  end
end

# Import json with base64 image data (with default key 'dataUri') and decode it.
# The json file and the image are respectively stored in 'jsons' and 'images' directory
# Default image extension is .jpg
def slurp baseURL, imageIds
  imageIds.each do |imageId|
    decode import(baseURL, imageId), imageId
  end
end

if __FILE__ == $0
  slurp "https://www.gstatic.com/prettyearth", $imageIds
end
