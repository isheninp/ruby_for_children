# get summ all 3-digits numbers in 4 number system
s=0
(1..1000).each do |n|
  if n.to_s(4).length == 3
    puts n.to_s(4)
    s+=n
  end
end
puts s # => 1896
