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

  def departments_less_than_500
    @departments.find_all { |department| department.expenses < 500 }
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
end