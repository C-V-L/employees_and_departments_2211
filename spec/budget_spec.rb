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

  before(:each) do
    customer_service.hire(bobbi)
    customer_service.hire(aaron)    
  end

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
      colorado.add_department(customer_service)
      colorado.add_department(dmv)
      colorado.add_department(tax_service)
    end

    describe '#add_department' do
      it 'adds a department' do
        expect(colorado.departments).to contain_exactly(dmv, customer_service, tax_service)
      end  
    end
    
    xdescribe '#departments_less_than_500' do
      it 'can list all departments with expenses greater than 500' do
        expect(colorado.departments_less_than_500).to eq([])
      end
    end
  end

end