# running on truffleruby 20.1.0, like ruby 2.6.5, GraalVM CE Native [x86_64-linux]
# find expression of 4 4 4 4 4  to be equal 22
# bruteforce version

AMOUNT = 5
EXPECTED = 22

NUMBERS = %w(4 4 4 4 4)
OPEATORS=['', '+', '-', '/', '*', '**', '**0.5+', '**0.5-', '**0.5*', '**0.5/']
found=[]

OPEATORS.repeated_permutation(10).each do |a|
  expression = NUMBERS[0]+a.to_a[0]+NUMBERS[1]+a.to_a[1]+NUMBERS[2]+a.to_a[2]+NUMBERS[3]+a.to_a[3]+NUMBERS[4]
  # puts expression
  begin
    expresson_value = eval(expression) unless expression.include? "**44"
  rescue 
    expresson_value = nil
  end
  if expresson_value == EXPECTED
    found << expression
    puts "Found expression: #{expression}=#{EXPECTED}"  
    # exit
  end
end
found.uniq!
found.each do |exp|
  puts "Found expression: #{exp}=#{EXPECTED}"  
end
