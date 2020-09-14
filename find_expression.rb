# running on truffleruby 20.1.0, like ruby 2.6.5, GraalVM CE Native [x86_64-linux]
# find expression of 4 4 4 4 4  to be equal 22

OPEATORS=['', '', '', '+', '-', '/', '*', '**']
NUMBER = '4'
AMOUNT = 5
EXPECTED = 22

expresson_value = nil

while expresson_value != EXPECTED
  expression = ''
  AMOUNT.times do |i|
    expression = expression + NUMBER + (i < AMOUNT-1 ? OPEATORS[rand(8)] : '')
  end
  puts expression
  begin
    expresson_value = eval(expression)
  rescue 
    expresson_value = nil
  end
end
puts "Found expression: #{expression}=#{EXPECTED}"
