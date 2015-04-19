#!/usr/bin/env ruby
require "open-uri"
require 'json'
class Search
  def initialize(keyword)
    @keyword = keyword
  end

  def searching
  	puts @keyword
  	puts '************************************************'
	puts ' ......searching < '<<@keyword.chomp<<' > .......'
	puts '************************************************'
	#http://search.maven.org/solrsearch/select?q=fresco&rows=20&wt=json
	uri = 'http://search.maven.org/solrsearch/select?q='<<@keyword.chomp<<'&rows=20&wt=json'
	# puts uri
	html_response = nil
	open(uri) do |http|
	  html_response = http.read
	end
	if(html_response.length == 0)
  		return
	end
	# puts html_response
	# puts result
	json_obj = JSON.parse(html_response)
	docs = json_obj['response']['docs']
	if(docs.length == 0)
  		puts '*** not found ***'
  		return
	end  
	firstGradleConfig = nil
	firstMavenConfig = nil
	puts ''
	puts '************'
	puts 'result:::::::::'
	puts '--------------------------------------'
	docs.each do |item|
  		p item["id"] << ":" << item['latestVersion']
  		if firstGradleConfig == nil
  			firstGradleConfig = item["id"] << ":" << item['latestVersion']
  		end
  		if firstMavenConfig == nil
  			firstMavenConfig = item
  		end
	end  
	puts '--------------------------------------'  

    puts '----GradleConfig'
	puts '************* copy this to your project gradle config  file *************' 
	puts '' 
	puts 'dependencies
			 {
			 	compile '<<firstGradleConfig<<"'"<<
			 '}'
	puts ''
	puts '************* ------- searching gradle end -------------- *************'
	puts ''

    puts '----MavenConfig'
	puts '************* copy this to your project maven config file *************' 
	puts '' 
	puts '<dependency>
			<groupId>'<<firstMavenConfig['g']<<'</groupId> 
			<artifactId>'<<firstMavenConfig['a']<<'</artifactId>
			<version>'<<firstMavenConfig['latestVersion']<<'</version>
			<type>aar</type>
		 </dependency>'
	puts ''
	puts '************* ------- searching maven end -------------- *************'
	puts ''


  end
end