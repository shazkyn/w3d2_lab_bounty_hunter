require('pg')

class Bounty
  attr_accessor :name, :last_known_location, :homeworld, :bounty_value
  # attr_reader :id

  def initialize(properties)
    @id = properties['id'].to_i
      if properties ['id']
      end
    @name = properties['name']
    @last_known_location = properties['last_known_location']
    @homeworld = properties['homeworld']
    @bounty_value = properties['bounty_value'].to_i
  end


  def save()
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = "INSERT INTO bounties
          (name, last_known_location, homeworld, bounty_value)
          VALUES
          ($1, $2, $3, $4) RETURNING *"
    values = [@name, @last_known_location, @homeworld, @bounty_value]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def update()
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = "UPDATE bounties
    SET
    (
      name, last_known_location, homeworld, bounty_value
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@name, @last_known_location, @homeworld, @bounty_value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end


  def delete()
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = "DELETE FROM bounties WHERE name = $1"
    values = [@name]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end




  def Bounty.all()
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = "SELECT * FROM bounties"
    db.prepare("all", sql)
    bounties = db.exec_prepared("all")
    db.close()
    return bounties.map { |bounty| Bounty.new(bounty)}
  end


  def Bounty.find_by_name(name)
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = "SELECT * FROM bounties WHERE name = $1"
    values = [name]
    db.prepare("find_by_name", sql)
    bounties = db.exec_prepared("find_by_name", values)
    db.close()
    if bounties.count == 0
      return nil
    end
    return  Bounty.new(bounties[0])
  end

  def Bounty.find(id)
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = "SELECT * FROM bounties WHERE id = $1"
    values = [id]
    db.prepare("find", sql)
    bounties = db.exec_prepared("find", values)
    db.close()
    if bounties.count == 0
      return nil
    end
    return  Bounty.new(bounties[0])
  end





end
