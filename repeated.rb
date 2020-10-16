# line1 = 9 11 13 15 17.. n=2020
# line2 = 3 8 13 18 23.. n=2020
# repeated n =? in both lines

m1=[]
m2=[]
(1..2020).each do |n|
  m1 << 9+n+n-2
  m2 << 3+5*(n-1)
end

m3 = m2-m1
puts m1.last
puts m2.last
print "repeated n="
puts 2020-m3.count
