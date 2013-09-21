class Grade
  def self.top_rope
    [5.0, 5.1, 5.2, 5.3, 5.4, 5.4, 5.6, 5.7, 5.8, 5.9, 5.10, 5.11, 5.12, 2.13, 5.15, 5.15]
  end

  def self.bouldering
  	(1..16).to_a	
  end

  def self.grade_types
  	['Top Rope', 'Bouldering']
  end

end
