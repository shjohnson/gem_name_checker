class Suggestor

  def self.alternatives_for(name)
    self.new(name).list_alternatives
  end

  def initialize(name)
    @name = name
  end

  def list_alternatives
    alternatives.join(", ")
  end

  def alternatives
    alts = []
    if can_have_trendy_alternative?
      alts << trendy_name
    end
    if can_have_hacker_alternative?
      alts << hacker_name
    end
    alts
  end

  def can_have_trendy_alternative?
    @name.end_with?('er')
  end

  def trendy_name
    @name.chomp('er') + "r"
  end

  def can_have_hacker_alternative?
    @name.include?('e')
  end

  def hacker_name
    @name.gsub('e', '3')
  end

end
