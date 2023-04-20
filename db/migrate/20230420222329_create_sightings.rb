class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|

      t.timestamps
    end
  end
end
