def pow2(x)
            Enumerator.new do |yielder|
             n = 1
             while x >= 1
                         yielder << n
                         n *= 2
                         x = x-1

             end

 end
end

def pow2_infinity()
 Enumerator.new do |yielder|
             n= 1
             while true
                         yielder << n
                         n *= 2

             end

 end
end


g = pow2(4)
p g.to_a

h = pow2_infinity
p h.take(20).to_a




