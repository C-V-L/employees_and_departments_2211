class Department
  attr_reader :name, :employees, :expenses
  def initialize(name)
    @name = name
    @employees = []
    @expenses = {}
  end

  def hire(employee)
    @employees << employee
  end

  def expense(amount, employee)
    @expenses[employee] = amount
  end
  
  def total_expenses
    @expenses.values.sum
  end
end