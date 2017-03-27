RSpec.describe User do
  it 'is valid when required attributes are present' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  context 'is invalid' do
    specify 'when name is blank' do
      expect(FactoryGirl.build(:user, name: '')).not_to be_valid
    end
    specify 'when city is blank' do
      expect(FactoryGirl.build(:user, city: '')).not_to be_valid
    end
  end
end