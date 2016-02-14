require 'rails_helper'

RSpec.describe Word, type: :model do
  it "has a valid factory" do
    expect(create :word).to be_valid
  end

  describe ".associations" do
    it { is_expected.to belong_to :user }
  end

  describe ".validations" do
    context "when valid" do
      subject { create :word }
      it { is_expected.to validate_presence_of :user }
      it { is_expected.to validate_presence_of :content }
    end
  end
end
