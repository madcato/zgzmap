#!/usr/bin/env ruby

require "rubygems"
require "json/pure"
require 'net/http'

# http://maps.googleapis.com/maps/api/geocode/output?parameters

# Sample
#  http://maps.googleapis.com/maps/api/geocode/json?address=SAN JORGE , 3 50001&sensor=false


# Input sample
# <tr><td>QUIOSCO </td><td>COMANDANTE REPOLLES , 18</td><td>50001 </td></tr>

# Output sample
# <dict>
#	<key>name</key>
#	<string>Quiosco</string>
#	<key>longitude</key>
#	<string>-0.8909238402828931</string>
#	<key>latitude</key>
#	<string>41.671947877501744</string>
#	<key>address</key>
#	<string>Calle de San Jorge, 3, 50001 Saragossa, Spain</string>
#</dict>

File.open("untitled.txt") { |file|
  
  file.each { |line|
     result = /<tr><td>(.*)<\/td><td>(.*)<\/td><td>(.*)<\/td><\/tr>/.match(line)
     
#     puts result[1] + " -- " + result[2] + " -- " + result[3]

      Net::HTTP.start("maps.googleapis.com") { |http|
        resp = http.get(URI.escape("/maps/api/geocode/json?address=#{result[2]} #{result[3]} ZARAGOZA&sensor=false"))
        if resp.code == "200"
          jsonResponse = JSON.parse(resp.body)

          puts "<dict>"
          puts "<key>name</key>"
          puts "<string>#{result[1]}</string>"
          puts "<key>longitude</key>"
          puts "<string>#{jsonResponse["results"][0]["geometry"]["location"]["lng"]}</string>"
          puts "<key>latitude</key>"
          puts "<string>#{jsonResponse["results"][0]["geometry"]["location"]["lat"]}</string>"
          puts "<key>address</key>"
          puts "<string>#{jsonResponse["results"][0]["formatted_address"]}</string>"
          puts "</dict>"
        end
      }
    }
}