require 'rails_helper'

describe Error do
  let(:error) { Error.create }

  it 'validates the presence of an execution environment' do
    expect(error.errors[:execution_environment_id]).to be_present
  end

  it 'validates the presence of a message' do
    expect(error.errors[:message]).to be_present
  end
end