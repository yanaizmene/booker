class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code

      t.timestamps
    end

    Currency.create :name => 'Гривна',					:code => 'UAH'
    Currency.create :name => 'United States Dollar',	:code => 'USD'
    Currency.create :name => 'Euro',					:code => 'EUR'
  end
end
