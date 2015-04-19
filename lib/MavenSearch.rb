#!/usr/bin/env ruby
class MavenSearch
  def self.search(keyword = :gson)
    searchTask = Search.new(keyword)
    searchTask.searching
  end
end

require 'search'


