#!/usr/bin/env ruby -w

def make_map(keys, vals)
  keys.zip(vals).inject({}) do |acc, val|
    acc[val.first] = val.last
    acc
  end
end

digit_names = %w[one two three four five six seven eight nine]
teen_names = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
ten_names = %w[twenty thirty forty fifty sixty seventy eighty ninety]

$digits = make_map((1..9), digit_names)
$teens = make_map((10..19), teen_names)
$teens[0] = ""
$tens = make_map((20..90).step(10), ten_names)
$tens[0] = ""

def thousands_words(n)
  n / 1000 == 1 ? "onethousand" : ""
end

def hundreds_words(n)
  div100 = n / 100
  str = div100 > 0 && div100 < 10 ? "#{$digits[n / 100]}hundred" : ""
  str += div100 > 0 && div100 < 10 && n % 100 != 0 ? "and" : ""
  str
end

def tens_words(n)
  v = (n % 100) / 10
  case v
  when 1
    $teens[n % 100]
  else
    n % 10 != 0 ? $tens[n % 100 / 10 * 10] + $digits[n % 10] : $tens[n % 100 / 10 * 10]
  end
end

def to_words(n)
  thousands_words(n) + hundreds_words(n) + tens_words(n)
end

str = ""
(1..1000).each do |x|
  str += to_words(x) + "\n"
end

puts str
puts str.gsub("\n", "").length

