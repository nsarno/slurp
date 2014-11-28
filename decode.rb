#!/usr/bin/env ruby

require 'json'
require 'data_uri'
require './image_ids'

def decode imageIds
  imageIds.each do |id|
    open("images/#{id}.jpg", 'wb') do |file|
      puts "* decoding: jsons/#{id}.json >> images/#{id}.jpg ..."
      json = JSON.parse(open("jsons/#{id}.json").read)
      uri = URI::Data.new(json['dataUri'])
      file << uri.data
    end
  end
end

if __FILE__ == $0
  decode $imageIds
end
