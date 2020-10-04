# Find at least one of any unique integer values of a,b,c,d for
# a**b == c**d AND b**a == d**a

n = [1,2,3,4,5,6,7,8,9,-1,-2,-3,-4,-5,-6,-7,-8,-9]

n.permutation(4).to_a.each do |a|
  if a[0]**a[1]==a[2]**a[3] && a[1]**a[0]==a[3]**a[2]
    print a
    puts
  end
end
