#!/usr/bin/env ruby

require 'open-uri'
require './image_ids'

def import baseURL, imageIds
  imageIds.each do |id|
    puts "* downloading #{id}.json (#{baseURL}/#{id}.json) ..."
    open("jsons/#{id}.json", 'wb') do |file|
      file << open("#{baseURL}/#{id}.json").read
    end
  end
end

if __FILE__ == $0
  import "https://www.gstatic.com/prettyearth", $imageIds
end
