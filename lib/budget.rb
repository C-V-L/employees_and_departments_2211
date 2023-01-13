class Budget
  attr_reader :name, :year, :departments
  def initialize(name, year)
    @name = name
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def department_expenses_less_than_500
    @departments.find_all { |department| department.total_expenses < 500 }
  end

  def employee_salaries
    employee_hash = {}
    @departments.each do |department|
      department.employees.each do |employee|
        employee_hash[employee] = employee.salary
      end
    end
    employee_hash
  end

  def expenses_by_employee
    expenses_hash = {}
    @departments.each do |department|
      department.expenses.each do |expense|
        expenses_hash[expense[0]] = expense[1]
      end
    end
    expenses_hash
  end
end