require 'pry'

credit_card = 5541808923795240

def format_cc(cc_num)
  cc_num.to_s.reverse.chars.map { |element| element.to_i }
end

def even_index(cc_num)
  format_cc(cc_num).select.with_index { |_, index| index.even? }
end

def odd_single_digit(cc_num)
  odd_index_doubled = format_cc(cc_num).map.with_index { | num, index| num * 2 if index.odd? }.compact

  odd_index_doubled.map do |num|
    num > 9 ? num.digits.sum : num
  end
end

def odd_even_sum(arr_odd_single_digit, arr_even)
  arr_odd_single_digit.sum + arr_even.sum
end

def cc_validity(sum_num)
  sum_num % 10 == 0
end

def luhn_alg(cc)
  format_cc(cc)
  odd_even_sum = odd_even_sum(even_index(cc), odd_single_digit(cc))
  validity = cc_validity(odd_even_sum)
  if validity == true
    puts "The number #{cc} is valid!"
  elsif validity == false
    puts "The number #{cc} is invalid!"
  end
end

# luhn_alg(credit_card)
# Valid numbers:
luhn_alg(5541808923795240)
luhn_alg(4024007136512380)
luhn_alg(6011797668867828)

# Inalid numbers:
puts "---------------------"
luhn_alg(5541801923795240)
luhn_alg(4024007106512380)
luhn_alg(6011797668868728)