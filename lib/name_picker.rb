require './lib/checker'
require './lib/suggestor'

class NamePicker

  def initialize(name)
    @name = name
  end

  def response
    checker = Checker.new(@name)
    if checker.available?
      "That name is available."
    else
      "That name is not available: why not try #{Suggestor.alternatives_for(@name)}"
    end
  end

end
