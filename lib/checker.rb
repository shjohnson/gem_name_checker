require 'httparty'
require 'json'

class Checker

  def initialize(name)
    @name = name
  end

  def available?
    rubygems_search.empty?
  end

  def rubygems_search
    url = "https://rubygems.org/api/v1/search.json?query=#{@name}"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end


end
