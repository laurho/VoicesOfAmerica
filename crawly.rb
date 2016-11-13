require 'nokogiri'
require 'open-uri'

#sample words for matching
#if words match, will be counted as a violent incident
#need a way to grab locations and compare to a location library in ruby
#need array of locations to send to an csv file for map upload
#run after python creepy.py 


mystuff = [ /prejudice/i, /racism/i, /racist/i, /pepper-spray/i, /violence/i, /white-supremacy/i, /whitelash/i, /oppression/i, /beat/i, /bite/i, /attack/i , /protesters/i ]

bin=[]


f = File.open("listy123.txt") or die "wrongfile"
 	linky=[]  
	f.each_line {|line|
		linky.push line
  }

	for i in linky
		j="#{i}"
	begin
		puts i
		x=URI.encode(i)
		doc = Nokogiri(open(x))
		if doc.scan(Regexp.union(mystuff))
			puts "yes"
			bin.push("1")
		else
			puts "no"
		end
	rescue SocketError, StandardError => se
		puts "Error: #{j} - #{se}"
	end


end
