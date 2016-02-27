class RepetitionCalculator
  def self.calculate(strength_level)
    {
      1 => 30.minutes,
      2 => 1.hour,
      3 => 1.hour
    }.fetch(strength_level, 30.minutes)
  end
end
