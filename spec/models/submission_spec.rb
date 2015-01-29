require 'rails_helper'

describe Submission do
  let(:submission) { Submission.create }

  it 'validates the presence of a cause' do
    expect(submission.errors[:cause]).to be_present
  end

  it 'validates the presence of an exercise' do
    expect(submission.errors[:exercise_id]).to be_present
  end

  it 'validates the presence of a user' do
    expect(submission.errors[:user_id]).to be_present
    expect(submission.errors[:user_type]).to be_present
  end

  %w[download render run test].each do |action|
    describe "##{action}_url" do
      let(:submission) { FactoryGirl.create(:submission) }
      let(:url) { submission.send(:"#{action}_url") }

      it "starts like the #{action} path" do
        filename = File.basename(__FILE__)
        expect(url).to start_with(Rails.application.routes.url_helpers.send(:"#{action}_submission_path", submission, filename).sub(filename, ''))
      end

      it 'ends with a placeholder' do
        expect(url).to end_with(Submission::FILENAME_URL_PLACEHOLDER)
      end
    end
  end
end