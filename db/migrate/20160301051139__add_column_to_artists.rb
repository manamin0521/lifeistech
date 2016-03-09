class AddColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :song1, :string
    add_column :artists, :song2, :string
    add_column :artists, :song3, :string
    add_column :artists, :song4, :string
    add_column :artists, :song5, :string
    add_column :artists, :songpr1, :string
    add_column :artists, :songpr2, :string
    add_column :artists, :songpr3, :string
    add_column :artists, :songpr4, :string
    add_column :artists, :songpr5, :string
    add_column :artists, :youtube1, :string
    add_column :artists, :youtube2, :string
    add_column :artists, :youtube3, :string
    add_column :artists, :youtube4, :string
    add_column :artists, :youtube5, :string
    add_column :artists, :album1, :string
    add_column :artists, :album2, :string
    add_column :artists, :album3, :string
    add_column :artists, :albumpr1, :string
    add_column :artists, :albumpr2, :string
    add_column :artists, :albumpr3, :string
  end
end
