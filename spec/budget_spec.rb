require './lib/budget'
require './lib/employee'
require './lib/department'

RSpec.describe '' do
  let(:colorado) { Budget.new('State of Colorado', 2022) }
  let(:customer_service) { Department.new("Customer Service") }
  let(:tax_service) { Department.new("Tax Service") } 
  let(:dmv) { Department.new("DMV") }
  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})  }
  let(:james) { Employee.new({name: "James G", age: "36", salary: "150000"}) }
  let(:juan) { Employee.new({name: "Juan Romero", age: "28", salary: "190000"})  }
  let(:kelly) { Employee.new({name: "Kelly Clarkson", age: "30", salary: "105000"}) }
  let(:emily) { Employee.new({name: "Emily Hinteregger", age: "33", salary: "130000"})  }

  describe '#initialize' do
    it 'exists' do
      expect(colorado).to be_a(Budget)
    end

    it 'has a name, a year, and starts with no departments' do
      expect(colorado.name).to eq("State of Colorado")
      expect(colorado.year).to eq(2022)
      expect(colorado.departments).to eq([])
    end
  end

  describe 'instance methods' do
    before(:each) do
      customer_service.hire(bobbi)
      customer_service.hire(aaron)    
      tax_service.hire(emily)
      tax_service.hire(james) 
      tax_service.hire(juan)
      dmv.hire(kelly) 
      colorado.add_department(customer_service)
      colorado.add_department(dmv)
      colorado.add_department(tax_service)
    end

    describe '#add_department' do
      it 'adds a department' do
        expect(colorado.departments).to contain_exactly(dmv, customer_service, tax_service)
      end  
    end
    
    describe '#department_expenses_less_than_500' do
      it 'can list all departments with expenses greater than 500' do
        expect(colorado.department_expenses_less_than_500).to contain_exactly(dmv, customer_service, tax_service)
        dmv.expense(501)
        tax_service.expense(499)
        expect(colorado.department_expenses_less_than_500).to contain_exactly(customer_service, tax_service)
        tax_service.expense(1001)
        expect(colorado.department_expenses_less_than_500).to contain_exactly(customer_service)
      end
    end

    describe '#employee_salaries' do
      it 'returns a hash of all employees as keys and their salary as values' do
        expect(colorado.employee_salaries).to eq( { bobbi => 100000, 
                                                    aaron => 90000, 
                                                    emily => 130000, 
                                                    james => 150000, 
                                                    juan => 190000, 
                                                    kelly => 105000 } )
      end
    end
  end

end