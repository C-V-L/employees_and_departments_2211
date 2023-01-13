require './lib/budget'
require './lib/employee'
require './lib/department'

RSpec.describe '' do
let(:colorado) { Budget.new('State of Colorado', 2022) }
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
end