# frozen_string_literal: true

class CreateFlags < ActiveRecord::Migration[7.0]
  def change
    create_table :flags do |t|
      t.string :name, unique: true
      t.string :name_key, unique: true
      t.text :description
      t.boolean :notify_type, default: false, null: false
      t.boolean :auto_action_type, default: false, null: false
      t.boolean :custom_type, default: false, null: false
      t.string :applies_to, array: true, null: false
      t.integer :position, null: false
      t.boolean :enabled, default: true, null: false
      t.timestamps
    end
    DB.exec("SELECT setval('flags_id_seq', 1001, FALSE);")
  end
end
