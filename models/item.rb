ActiveRecord::Base.establish_connection(
  ENV['DATABASE_URL']||'sqlite3:db/development.db')

class Artist < ActiveRecord::Base
    belongs_to :user
end

class User < ActiveRecord::Base
    has_many :artists
    has_secure_password
    validates :email,
    presence: true,
    format: {with:/.+@.+/}
    validates :password,
    length: {in: 5..10}
end
