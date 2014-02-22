class InitialMigration < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term
      t.text   :description
      t.belongs_to :deck
      t.timestamps
    end

    create_table :rounds do |t|
      t.belongs_to :deck
      t.integer    :number
      t.timestamps
    end

    create_table :decks do |t|
      t.string   :name
      t.timestamps
    end

    create_table :guesses do |t|
      t.belongs_to :round
      t.belongs_to :card
      t.boolean    :correct
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :user_password
      t.timestamps
    end

  end
end
