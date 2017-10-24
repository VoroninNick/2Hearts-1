class AddH1ToPages < ActiveRecord::Migration
  def up
    add_column :pages, :h1_text, :string if !column_exists?(:pages, :h1_text)
    add_column :page_translations, :h1_text, :string if !column_exists?(:page_translations, :h1_text)
  end

  def down
    remove_column :pages, :h1_text
    remove_column :page_translations, :h1_text
  end
end
