class UpdateWordStatus
  def initialize(word, result, repetition_calculator: RepetitionCalculator)
    @word, @result = word, result
    @repetition_calculator = repetition_calculator
  end

  def call
    word.update_columns(
      next_repetition_at: next_repetition_at,
      practices_count: word.practices_count + 1,
      last_practiced_at: Time.current,
      strength_level: strength_level
    )
  end

  private

  attr_reader :word, :result, :repetition_calculator

  def next_repetition_at
    repetition_calculator.calculate(strength_level).from_now
  end

  def strength_level
    [word.strength_level + strength_delta, 0].max
  end

  def strength_delta
    result == :successful_repetition ? 1 : -1
  end
end
