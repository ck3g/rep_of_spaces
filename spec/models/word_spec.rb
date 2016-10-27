require 'rails_helper'

RSpec.describe Word, type: :model do
  it "has a valid factory" do
    expect(create :word).to be_valid
  end

  describe ".associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :categories }
    it { is_expected.to have_many :word_categories }
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
    let!(:very_weak_word) { create :word, next_repetition_at: 1.hour.ago }

    subject { Word.weak }

    it "returns only weak words for practice" do
      is_expected.to eq [new_word, very_weak_word, weak_word]
    end
  end

  describe "#available_hints" do
    subject { word.available_hints }

    context "when excerpt is exists" do
      let(:word) { build :word, excerpt: "Ich trinke Wasser" }
      it { is_expected.to eq excerpt: "Ich trinke Wasser" }
    end

    context "when excerpt does not exist" do
      let(:word) { build :word, excerpt: "" }
      it { is_expected.to eq({}) }
    end
  end
end
