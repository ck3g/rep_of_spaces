class RepetitionCalculator
  def self.calculate(strength_level)
    {
      1 => 30.minutes,
      2 => 1.hour
    }.fetch(strength_level)
  end
end
