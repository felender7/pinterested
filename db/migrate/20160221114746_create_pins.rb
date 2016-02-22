class CreatePins < ActiveRecord::Migration
    def up
        create_table :pins do |t|
          t.string :description
          t.timestamps
        end
    end

    def down
    end
end
