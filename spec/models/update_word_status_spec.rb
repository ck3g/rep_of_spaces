require 'rails_helper'

RSpec.describe UpdateWordStatus do
  describe "#call" do
    let!(:word) do
      create :word, practices_count: 1, strength_level: strength_level
    end
    let(:result) { :successful_repetition }
    let(:strength_level) { 2 }

    before do
      described_class.new(word, result).call
    end

    it "updates practices_count" do
      expect(word.practices_count).to eq 2
    end

    it "updates last_practiced_at" do
      expect(word.last_practiced_at.to_s).to eq Time.current.to_s
    end

    context "when result is failed_repetition" do
      let(:result) { :failed_repetition }

      it "moves next repetition 30 minutes forward" do
        expect(word.next_repetition_at.to_s).to eq 20.minutes.from_now.to_s
      end

      context "when strength_level is 2" do
        it "decreases strenght level" do
          expect(word.strength_level).to eq 1
        end
      end

      context "when strength_level is 0" do
        let(:strength_level) { 0 }

        it "does not changes the level" do
          expect(word.strength_level).to eq 0
        end
      end
    end

    context "when result is successful_repetition" do
      it "moves next repetition 1 hour forward" do
        expect(word.next_repetition_at.to_s).to eq 24.hours.from_now.to_s
      end

      it "increases strength_level" do
        expect(word.strength_level).to eq 3
      end
    end
  end
end
