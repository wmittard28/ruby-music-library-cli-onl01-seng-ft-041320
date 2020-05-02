module Concerns
  module Findable
  attr_accessor :name
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @@all << self 
  end
  
  def self.all
    @@all
  end
  
  def self.find_by_name(name)
   @@all.detect {|find| find.name == name}
    end 
    
    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end 
end 
end 
