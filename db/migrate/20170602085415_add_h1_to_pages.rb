class AddH1ToPages < ActiveRecord::Migration
  def change
    add_column :pages, :h1_text, :string
    add_column :page_translations, :h1_text, :string
  end
end
