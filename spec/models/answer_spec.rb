require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title: "How Do I?", body: "Did I Do It Right?", resolved: false)}
  let(:answer) {Answer.create!(body: "You Did Not!", question: question)}

  describe "attributes" do
    it "has a body attribute" do
      expect(answer).to have_attributes(body: "You Did Not!")
    end
  end

end
