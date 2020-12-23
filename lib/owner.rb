require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def cats
    cats_array = []
    #self_test = self
    #binding.pry
    Cat.all.collect do |cat|
      cats_array << cat if cat.owner == self
    end
    #binding.pry
    cats_array
  end

  def dogs
    dogs_array = []
    #self_test = self
    #binding.pry
    Dog.all.collect do |dog|
      dogs_array << dog if dog.owner == self
    end
    #binding.pry
    dogs_array
  end

  def buy_cat(name)
    #binding.pry
    Cat.new(name,self)
    #binding.pry
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    dogs.each{|dog| dog.mood= "happy"}
  end

  def feed_cats
    cats.each{|pet| pet.mood= "happy"}
  end

  def sell_pets
    dogs.each do |pet|
      pet.mood= "nervous"
      pet.owner = nil
    end
    cats.each do |pet|
      pet.mood= "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end
  
  def self.count
    all.length
  end

  def self.reset_all
    @@all = []
  end

end