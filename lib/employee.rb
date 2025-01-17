class Employee
  attr_reader :name, :age, :salary
  def initialize(info)
    @name = info[:name]
    @age = info[:age].to_i
    @salary = info[:salary].gsub(/[$]/, '').to_i
  end

  def give_raise(amount)
    @salary += amount
  end
end