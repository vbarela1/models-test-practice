class Country < ApplicationRecord
  validates_presence_of :name, :population, :language
  validates_uniqueness_of :name 

  def name_language
    "#{name} has a primary language of: #{language}"
  end 

  def country_size
    formatted_population = population.to_i
    if(formatted_pop >= 1000000)
      "Large"
    elsif (formatted_pop > 500000)
      "Medium"
    else 
      "Small"
    end 
  end 
end
