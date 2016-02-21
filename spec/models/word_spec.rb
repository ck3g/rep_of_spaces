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

  describe ".weak" do
    let!(:strong_word) { create :word, :strong }
    let!(:weak_word) { create :word, :weak }
    let!(:new_word) { create :word }

    subject { Word.weak }

    it "returns only weak words for practice" do
      is_expected.to contain_exactly(weak_word, new_word)
    end
  end
end
