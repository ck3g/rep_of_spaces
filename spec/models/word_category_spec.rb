require 'rails_helper'

RSpec.describe WordCategory, type: :model do
  it "has a valid factory" do
    expect(create :word_category).to be_valid
  end

  describe ".associations" do
    it { is_expected.to belong_to :word }
    it { is_expected.to belong_to :category }
  end

  describe ".validations" do
    context "when valid" do
      subject { create :word_category }
      it { is_expected.to validate_presence_of :word }
      it { is_expected.to validate_presence_of :category }
    end
  end
end
