class Part < ApplicationRecord
  belongs_to :car

  def recycle
    self.destroy
  end 
end
