require 'pry'

class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  # db  = SQLite3::Database.new('/Users/michael/catalog.db')
  # ins = db.prepare('insert into catalog (column_name) values (?)')
  # string.each { |s| ins.execute(s) }

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db)
  end 
end
#end of Pokemon class
