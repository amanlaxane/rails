class AddAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column:articles, :Author , :string
  end
end
