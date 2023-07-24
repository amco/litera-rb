# frozen_string_literal: true

class CreateLiteraMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :litera_messages do |t|
      t.jsonb :body, default: {}
      t.jsonb :metadata, default: {}
      t.string :service
      t.string :external_id
      t.datetime :published_at

      t.timestamps
    end

    add_index :litera_messages, :published_at
  end
end
