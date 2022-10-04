#!/usr/bin/env ruby

require 'net/http'
require 'date'

class Parada
  def initialize
    @latitude = ""
    @longitude = ""
    @idStation = ""
    @addressnew = ""
  end
  
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :idStation
  attr_accessor :addressnew
end

$array = Array.new

server = "www.bizizaragoza.com"
web_file = "/localizaciones/station_map.php?TU5fTE9DQUxJWkFDSU9ORVM%3D&MQ%3D%3D"


def parse

 # Linea a linea 
 # Cada objeto construido se coloca en array 
 
 open("temp.html", "r") { |file|
   file.each_line { |line|
    
      if line.match(/.*icon.image.*/)
        $parada = Parada.new
      end
      
      if line.match(/.*map.addOverlay.*/)
        $array.push($parada)
      end
      
      if line.match(/.*point = new GLatL.*/)
        result = line.match(/GLatLng\((.*),(.*)\)/)
        
        unless $parada.nil?
          $parada.latitude = $1
          $parada.longitude = $2        
        end
      end
      
      if line.match(/.*data:"idStation=".*/)
        result = line.match(/data:"idStation="\+(.*)\+"&addressnew=(.*)"\+"&s_id_idio/)
        
        unless $parada.nil?
          $parada.idStation = $1
          $parada.addressnew = $2        
        end
      end
      
      
     }
  }
 
end

#Net::HTTP.start(server) { |http|
#  resp = http.get(web_file)
 # if resp.code == "200"
 # open("temp.html", "wb") { |file|
 #   file.write(resp.body)
 #  }
  parse()
#end
# }


puts '<?xml version="1.0" encoding="UTF-8"?>'
puts '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
puts '<plist version="1.0">'
puts '<dict>'
puts '	<key>created_at</key>' 
date = DateTime.now
puts "	<date>#{date} FIX THIS: must end with Z in UTC</date>"
puts '	<key>stations</key>'
puts '	<array>'
$array.each {|obj|
puts '  	<dict>'
puts "			<key>longitude</key>"
puts "			<string>#{obj.longitude}</string>"
puts "			<key>latitude</key>"
puts "			<string>#{obj.latitude}</string>"
puts "			<key>idStation</key>"
puts "			<string>#{obj.idStation}</string>"
puts "			<key>addressnew</key>"
puts "			<string>#{obj.addressnew}</string>"
puts "		</dict>"

  }
puts '	</array>'
puts '</dict>'
puts '</plist>'