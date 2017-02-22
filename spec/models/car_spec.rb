require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:old_car) { Car.create(age: 50) }
  let(:new_car) { Car.create(age: 2) }
  
  describe 'attributes' do

    it { should respond_to :make }
    it { should respond_to :model }
    it { should respond_to :age }
    it { should respond_to :price }
    it { should respond_to :mileage }
    it { should respond_to :color }
    it { should respond_to :interior }
    it { should respond_to :warranty }
    it { should have_many :parts }

  end

  describe 'class methods' do
    before(:each) do
      @car1 = Car.create(make: 'Buick', model: 'Boom', price: 20000)
      @car2 = Car.create(make: 'Alpha', model: 'A', price: 5000)
      @car3 = Car.create(make: 'Zebra', model: 'Zoom', price: 100000)
    end

    it 'orders cars by model' do
      cars = Car.by_model;
      expect(cars).to eq([@car2, @car1, @car3])
    end

    it 'orders cars by make' do
      cars = Car.by_make
      expect(cars).to eq([@car2, @car1, @car3])
    end

    it 'orders cars by price ascending' do
      cars = Car.by_price
      expect(cars).to eq([@car2, @car1, @car3])
    end

    it 'orders cars by price descending' do
      cars = Car.by_price(true)
      expect(cars).to eq([@car3, @car1, @car2])
    end

  end

  describe 'instance methods' do

    it 'changes the cars color' do
      color = 'pink'
      car = Car.create(color: 'green')
      car.paint(color)
      expect(car.color).to eq(color)
    end

    it 'returns cars attributes as JSON' do
      json = {
        'make' => 'Chevy',
        'model' => 'Silverado',
        'price' => 15000.0,
        'color' => 'White',
        'mileage' => 100000,
        'interior' => 'leather',
        'age' => 5,
        'warranty' => true
      }

      car = Car.create(json)

      expect(car.info).to eq(json) 
    end

    it 'honks loudly if car.age <= 5' do
      expect(new_car.honk).to eq('BEEEEEEEEEP')
    end

    it 'has a faint horn if car.age > 5' do
      expect(Car.all.count).to eq(0)
      expect(old_car.honk).to eq('boop')
      expect(Car.all.count).to eq(1)
      expect(old_car.age).to eq(50)
      expect(Car.all.count).to eq(1)
    end

  end

end
