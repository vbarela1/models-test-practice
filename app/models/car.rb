class Car < ApplicationRecord
  has_many :parts

  #Car.by_model
  #Car.by_make
  #Car.by_price

  def self.by_model
    order(:model)
  end

  def self.by_make
    order(:make)
  end

  def self.by_price(high = false)
    direction = high ? :desc : :asc
    order(price: direction)
  end

  #@car.paint('red')
  #@car.info
  #@car.honk

  def paint(color)
    self.color = color
    self.save  
  end

  def info
    self.attributes.reject { |a| a == "id" || a == "created_at" || a == "updated_at" }
  end

  def honk
    self.age <= 5 ? 'BEEEEEEEEEP' : 'boop'
  end

end