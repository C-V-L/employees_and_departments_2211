require './lib/employee'
require './lib/department'

RSpec.describe 'Department' do
  let(:customer_service) { Department.new("Customer Service") }
  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})  }

  describe '#initialize' do
    it 'exists' do
      expect(customer_service).to be_a(Department)
    end

    it 'has a name' do
      expect(customer_service.name).to eq("Customer Service")
      expect(customer_service.employees).to eq([])
    end
  end

  describe 'Department instance methods' do
    before(:each) do
    customer_service.hire(bobbi)
    customer_service.hire(aaron)    
    end

    describe '#hire' do
      it 'can add employees to the department' do
        expect(customer_service.employees).to contain_exactly(bobbi, aaron)
      end
    end

    describe '#expenses' do
      it 'starts with 0 and can add expenses' do
        expect(customer_service.expenses).to eq({})
        expect(customer_service.total_expenses).to eq(0)
        customer_service.expense(100, bobbi)
        customer_service.expense(25, aaron)
        expect(customer_service.expenses).to eq({ bobbi => 100, aaron => 25 })
        expect(customer_service.total_expenses).to eq(125)
      end
    end
  end
end