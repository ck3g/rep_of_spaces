class UpdateWordStatus
  def initialize(word, result)
    @word, @result = word, result
  end

  def call
    word.update_column :next_repetition_at, next_repetition_at
  end

  private

  attr_reader :word, :result

  def next_repetition_at
    result_time.from_now
  end

  def result_time
    if result == :successful_repetition
      1.hour
    else
      30.minutes
    end
  end
end
