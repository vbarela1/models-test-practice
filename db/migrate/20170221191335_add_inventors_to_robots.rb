class AddInventorsToRobots < ActiveRecord::Migration[5.0]
  def change
    add_reference :robots, :inventor, foreign_key: true
  end
end
