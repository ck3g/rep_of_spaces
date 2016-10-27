require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    expect(create :category).to be_valid
  end

  describe ".associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :word_categories }
    it { is_expected.to have_many :words }
  end

  describe ".validations" do
    context "when valid" do
      subject { create :category }
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to :user_id }
      it { is_expected.to validate_presence_of :user }
    end
  end
end
