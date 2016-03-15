require_relative "../../app/presenters/word_presenter"

RSpec.describe WordPresenter do
  describe "#excerpt" do
    subject { described_class.new(word).excerpt }

    let(:word) { double excerpt: "Ich trinke Wasser", content: "Wasser" }

    it { is_expected.to eq "Ich trinke <strong>Wasser</strong>" }
  end
end
