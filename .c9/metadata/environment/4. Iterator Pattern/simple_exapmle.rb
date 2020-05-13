{"filter":false,"title":"simple_exapmle.rb","tooltip":"/4. Iterator Pattern/simple_exapmle.rb","undoManager":{"mark":0,"position":0,"stack":[[{"start":{"row":0,"column":0},"end":{"row":35,"column":13},"action":"insert","lines":["def make_generator(n)","  Enumerator.new do |yielder|","    yielder << n","    n += 1","    yielder << n","    n += 10","    yielder << n","  end","end","","def pow2(n)","  Enumerator.new do |yielder|","    n.times do |i|","      yielder << 2 ** i","    end","  end","end","","def pow2_infinity","  Enumerator.new do |yielder|","    n = 1","    loop do","      yielder << n","      n *= 2","    end","  end","end","","g1 = make_generator(5)","p g1.to_a","","g2 = pow2(5)","p g2.to_a","","g3 = pow2_infinity","p g3.take(10)"],"id":1}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":35,"column":13},"end":{"row":35,"column":13},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1585694558632,"hash":"4ab457153950307b93a115c5169323b645f39e46"}