require 'json'
require 'date'

busJson = JSON.parse( IO.read('poste.json.txt') )

puts '<?xml version="1.0" encoding="UTF-8"?>'
puts '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
puts '<plist version="1.0">'
puts '<dict>'
puts '	<key>created_at</key>' 
date = DateTime.now
puts "	<date>#{date} FIX THIS: must end with Z in UTC</date>"
puts '	<key>busstops</key>'
puts '	<array>'
busJson.each {|obj|
puts '  	<dict>'
puts "			<key>name</key>"
puts "			<string>#{obj['title']}</string>"
puts "			<key>longitude</key>"
puts "			<string>#{obj['geometry']['coordinates'][0]}</string>"
puts "			<key>latitude</key>"
puts "			<string>#{obj['geometry']['coordinates'][1]}</string>"
puts "			<key>url</key>"
puts "			<string>#{obj['link']}</string>"
puts "		</dict>"

  }
puts '	</array>'
puts '</dict>'
puts '</plist>'