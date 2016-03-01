a = Array.new(100) { |i| i+1}
a.delete(1)
a.delete(3)
print a
puts

i=0

while a[i]==i+1 do i+=1 end
puts i+1

while a[i]==i+2 do i+=1 end
puts i+2	