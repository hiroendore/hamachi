class CreateSentences < ActiveRecord::Migration[8.0]
  def change
    create_table :sentences do |t|
      t.text :content

      t.timestamps
    end
  end
end
