class UpdateWordStatus
  def initialize(word, result, repetition_calculator: RepetitionCalculator)
    @word, @result = word, result
    @repetition_calculator = repetition_calculator
  end

  def call
    word.update_columns(
      next_repetition_at: next_repetition_at,
      practices_count: word.practices_count + 1,
      last_practiced_at: Time.current
    )
  end

  private

  attr_reader :word, :result, :repetition_calculator

  def next_repetition_at
    repetition_calculator.calculate(strength_level).from_now
  end

  def strength_level
    result == :successful_repetition ? 2 : 1
  end
end
