require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age']
  end


  def save()
    sql= "INSERT INTO students (first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run(sql, values)
    @id = student.first['id'].to_i
    # why!????!!
  end

  def name()
    return "#{@first_name} #{@last_name}"
  end


    def self.delete_all()
      sql = "DELETE FROM students;"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM students
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.all()
      sql = "SELECT * FROM students"
      students = SqlRunner.run( sql )
      result = students.map { |student| Student.new( student ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM students WHERE id = $1"
      values = [id]
      student = SqlRunner.run( sql, values )
      result = Student.new( student.first )
      return result
    end

    def house()
      sql = "SELECT * FROM houses WHERE houses.id = $1"
      values = [@house_id]
      house = SqlRunner.run( sql, values )
      result = house.map{ |house| House.new(house)}
      return result[0]
    end

#     def house_name()
#   sql = "SELECT * FROM houses WHERE id = $1"
#   values = [@house_id]
#   house = SqlRunner.run(sql, values)[0[1]]
#   return House.new(house)
# end

     # def house_logo()
     #   logo = @student.house()
     #   logo[2]
     # end



#     def customers()
#   sql = "SELECT houses.* FROM students
#   LEFT JOIN houses
#   WHERE film_id = $1"
#   values = [@id]
#   customers = SqlRunner.run(sql, values)
#   result = customers.map{ |customer| Customer.new(customer)}
#   return result
# end

  end
