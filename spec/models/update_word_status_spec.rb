require 'rails_helper'

RSpec.describe UpdateWordStatus do
  describe "#call" do
    let!(:word) { create :word, practices_count: 1 }
    let(:result) { :successful_repetition }

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
        expect(word.next_repetition_at.to_s).to eq 30.minutes.from_now.to_s
      end
    end

    context "when result is successful_repetition" do
      it "moves next repetition 1 hour forward" do
        expect(word.next_repetition_at.to_s).to eq 1.hour.from_now.to_s
      end
    end
  end
end
