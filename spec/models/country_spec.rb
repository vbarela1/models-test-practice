require 'rails_helper'

RSpec.describe Country, type: :model do

 let (:country) { FactoryGirl.create(:country) }
 
  describe 'attributes' do

    it { should respond_to :name }
    it { should respond_to :population }
    it { should respond_to :language }
  end 

  describe 'class methods' do
    before(:each) do
      @country = Country.create(name: 'Greece', population: 10000, language: 'French')
      @country = Country.create(name: 'France', population: 2000, language: 'Arabic')
      @country = Country.create(name: 'England', population: 2000000, language: 'English')
    end
  
  
end

