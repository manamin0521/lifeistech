class AddArtistIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :artist_id, :integer
  end
end
