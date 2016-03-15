class RepetitionCalculator
  def self.calculate(strength_level)
    {
      0 => 5.minute,
      1 => 20.minutes,
      2 => 8.hours,
      3 => 24.hours,
      4 => 32.hours,
      5 => 3.days,
      6 => 7.days,
      7 => 2.weeks,
      8 => 1.month,
      9 => 3.months
    }.fetch(strength_level, 3.months)
  end
end
