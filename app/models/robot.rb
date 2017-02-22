class Robot < ApplicationRecord

  belongs_to :inventor 

  def greet
    self.friendly ? 'Hello' : 'Kill!'
  end 

  def attack
    self.friendly ? false : true 
  end 


end
