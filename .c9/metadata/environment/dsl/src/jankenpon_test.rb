{"filter":false,"title":"jankenpon_test.rb","tooltip":"/dsl/src/jankenpon_test.rb","undoManager":{"mark":96,"position":96,"stack":[[{"start":{"row":0,"column":0},"end":{"row":4,"column":34},"action":"insert","lines":["# Domain-Specific Language Pattern","# Date: 27-Apr-2020","# Authors:","#          A00456654 Thursday Rubinstein ","#          A01160611 Anthony Stark"],"id":1}],[{"start":{"row":2,"column":0},"end":{"row":4,"column":34},"action":"remove","lines":["# Authors:","#          A00456654 Thursday Rubinstein ","#          A01160611 Anthony Stark"],"id":2},{"start":{"row":2,"column":0},"end":{"row":4,"column":41},"action":"insert","lines":["# Authors:","#          A01378916 Rafael Moreno Cañas","#          A01379896 Erick Bautista Perez"]}],[{"start":{"row":4,"column":41},"end":{"row":5,"column":0},"action":"insert","lines":["",""],"id":3},{"start":{"row":5,"column":0},"end":{"row":6,"column":0},"action":"insert","lines":["",""]}],[{"start":{"row":6,"column":0},"end":{"row":181,"column":3},"action":"insert","lines":["# File: jankenpon_test.rb","","require 'minitest/autorun'","require 'stringio'","require 'jankenpon'","","class JakenponTest < Minitest::Test","","  def setup","    @old_stdout = $stdout","    @out = $stdout = StringIO.new","  end","","  def teardown","    $stdout = @old_stdout","  end","","  def test_simple_cases_plus","    assert_equal Scissors, (Scissors + Paper)","    assert_equal Scissors, (Paper + Scissors)","    assert_equal Paper,    (Paper + Rock)","    assert_equal Paper,    (Rock + Paper)","    assert_equal Rock,     (Rock + Lizard)","    assert_equal Rock,     (Lizard + Rock)","    assert_equal Lizard,   (Lizard + Spock)","    assert_equal Lizard,   (Spock + Lizard)","    assert_equal Spock,    (Spock + Scissors)","    assert_equal Spock,    (Scissors + Spock)","    assert_equal Scissors, (Scissors + Lizard)","    assert_equal Scissors, (Lizard + Scissors)","    assert_equal Lizard,   (Lizard + Paper)","    assert_equal Lizard,   (Paper + Lizard)","    assert_equal Paper,    (Paper + Spock)","    assert_equal Paper,    (Spock + Paper)","    assert_equal Spock,    (Spock + Rock)","    assert_equal Spock,    (Rock + Spock)","    assert_equal Rock,     (Rock + Scissors)","    assert_equal Rock,     (Scissors + Rock)","    assert_equal Scissors, (Scissors + Scissors)","    assert_equal Paper,    (Paper + Paper)","    assert_equal Rock,     (Rock + Rock)","    assert_equal Lizard,   (Lizard + Lizard)","    assert_equal Spock,    (Spock + Spock)","  end","","  def test_simple_cases_minus","    assert_equal Paper,    (Scissors - Paper)","    assert_equal Paper,    (Paper - Scissors)","    assert_equal Rock,     (Paper - Rock)","    assert_equal Rock,     (Rock - Paper)","    assert_equal Lizard,   (Rock - Lizard)","    assert_equal Lizard,   (Lizard - Rock)","    assert_equal Spock,    (Lizard - Spock)","    assert_equal Spock,    (Spock - Lizard)","    assert_equal Scissors, (Spock - Scissors)","    assert_equal Scissors, (Scissors - Spock)","    assert_equal Lizard,   (Scissors - Lizard)","    assert_equal Lizard,   (Lizard - Scissors)","    assert_equal Paper,    (Lizard - Paper)","    assert_equal Paper,    (Paper - Lizard)","    assert_equal Spock,    (Paper - Spock)","    assert_equal Spock,    (Spock - Paper)","    assert_equal Rock,     (Spock - Rock)","    assert_equal Rock,     (Rock - Spock)","    assert_equal Scissors, (Rock - Scissors)","    assert_equal Scissors, (Scissors - Rock)","    assert_equal Scissors, (Scissors - Scissors)","    assert_equal Paper,    (Paper - Paper)","    assert_equal Rock,     (Rock - Rock)","    assert_equal Lizard,   (Lizard - Lizard)","    assert_equal Spock,    (Spock - Spock)","  end","","  def test_dsl_1","    #---------","    show Spock","    #---------","    assert_equal \\","      \"Result = Spock\\n\", @out.string","  end","","  def test_dsl_2","    #------------------","    show Spock + Lizard","    #------------------","    assert_equal \\","      \"Lizard poisons Spock (winner Lizard)\\n\" \\","      \"Result = Lizard\\n\", \\","      @out.string","  end","","  def test_dsl_3","    #------------------","    show Spock - Lizard","    #------------------","    assert_equal \\","      \"Lizard poisons Spock (loser Spock)\\n\" \\","      \"Result = Spock\\n\", \\","      @out.string","  end","","  def test_dsl_4","    #-------------------------","    show Spock + Lizard + Rock","    #-------------------------","    assert_equal \\","      \"Lizard poisons Spock (winner Lizard)\\n\" \\","      \"Rock crushes Lizard (winner Rock)\\n\" \\","      \"Result = Rock\\n\", \\","      @out.string","  end","","  def test_dsl_5","    #---------------------------","    show Spock + (Lizard + Rock)","    #---------------------------","    assert_equal \\","      \"Rock crushes Lizard (winner Rock)\\n\" \\","      \"Spock vaporizes Rock (winner Spock)\\n\" \\","      \"Result = Spock\\n\", \\","      @out.string","  end","","  def test_dsl_6","    #--------------------------------------------","    show Rock + Paper + Scissors + Lizard + Spock","    #--------------------------------------------","    assert_equal \\","      \"Paper covers Rock (winner Paper)\\n\" \\","      \"Scissors cut Paper (winner Scissors)\\n\" \\","      \"Scissors decapitate Lizard (winner Scissors)\\n\" \\","      \"Spock smashes Scissors (winner Spock)\\n\" \\","      \"Result = Spock\\n\", \\","      @out.string","  end","","  def test_dsl_7","    #--------------------------------------------","    show Rock - Paper - Scissors - Lizard - Spock","    #--------------------------------------------","    assert_equal \\","      \"Paper covers Rock (loser Rock)\\n\" \\","      \"Rock crushes Scissors (loser Scissors)\\n\" \\","      \"Scissors decapitate Lizard (loser Lizard)\\n\" \\","      \"Lizard poisons Spock (loser Spock)\\n\" \\","      \"Result = Spock\\n\", \\","      @out.string","  end","","  def test_dsl_8","    #-------------------------------------------------","    show((Rock + Paper) - (Scissors + Lizard) + Spock)","    #-------------------------------------------------","    assert_equal \\","      \"Paper covers Rock (winner Paper)\\n\" \\","      \"Scissors decapitate Lizard (winner Scissors)\\n\" \\","      \"Scissors cut Paper (loser Paper)\\n\" \\","      \"Paper disproves Spock (winner Paper)\\n\" \\","      \"Result = Paper\\n\", \\","      @out.string","  end","","  def test_dsl_9","    #---------------------------------------------","    show Paper + ((Spock + Paper) - Lizard + Rock)","    #---------------------------------------------","    assert_equal \\","      \"Paper disproves Spock (winner Paper)\\n\" \\","      \"Lizard eats Paper (loser Paper)\\n\" \\","      \"Paper covers Rock (winner Paper)\\n\" \\","      \"Paper tie (winner Paper)\\n\" \\","      \"Result = Paper\\n\", \\","      @out.string","  end","","end"],"id":4}],[{"start":{"row":78,"column":0},"end":{"row":79,"column":0},"action":"insert","lines":["",""],"id":5}],[{"start":{"row":78,"column":0},"end":{"row":79,"column":0},"action":"remove","lines":["",""],"id":6}],[{"start":{"row":78,"column":0},"end":{"row":78,"column":12},"action":"insert","lines":["            "],"id":7}],[{"start":{"row":78,"column":0},"end":{"row":78,"column":12},"action":"remove","lines":["            "],"id":8}],[{"start":{"row":78,"column":0},"end":{"row":78,"column":1},"action":"insert","lines":[" "],"id":9},{"start":{"row":78,"column":1},"end":{"row":78,"column":2},"action":"insert","lines":[" "]},{"start":{"row":78,"column":2},"end":{"row":78,"column":3},"action":"insert","lines":["#"]}],[{"start":{"row":78,"column":3},"end":{"row":78,"column":4},"action":"insert","lines":["t"],"id":10},{"start":{"row":78,"column":4},"end":{"row":78,"column":5},"action":"insert","lines":["e"]},{"start":{"row":78,"column":5},"end":{"row":78,"column":6},"action":"insert","lines":["s"]},{"start":{"row":78,"column":6},"end":{"row":78,"column":7},"action":"insert","lines":["t"]}],[{"start":{"row":78,"column":7},"end":{"row":78,"column":8},"action":"insert","lines":[" "],"id":11}],[{"start":{"row":78,"column":7},"end":{"row":78,"column":8},"action":"remove","lines":[" "],"id":12},{"start":{"row":78,"column":6},"end":{"row":78,"column":7},"action":"remove","lines":["t"]},{"start":{"row":78,"column":5},"end":{"row":78,"column":6},"action":"remove","lines":["s"]},{"start":{"row":78,"column":4},"end":{"row":78,"column":5},"action":"remove","lines":["e"]},{"start":{"row":78,"column":3},"end":{"row":78,"column":4},"action":"remove","lines":["t"]}],[{"start":{"row":78,"column":3},"end":{"row":78,"column":4},"action":"insert","lines":["F"],"id":13},{"start":{"row":78,"column":4},"end":{"row":78,"column":5},"action":"insert","lines":["u"]},{"start":{"row":78,"column":5},"end":{"row":78,"column":6},"action":"insert","lines":["n"]},{"start":{"row":78,"column":6},"end":{"row":78,"column":7},"action":"insert","lines":["c"]},{"start":{"row":78,"column":7},"end":{"row":78,"column":8},"action":"insert","lines":["t"]},{"start":{"row":78,"column":8},"end":{"row":78,"column":9},"action":"insert","lines":["i"]},{"start":{"row":78,"column":9},"end":{"row":78,"column":10},"action":"insert","lines":["o"]},{"start":{"row":78,"column":10},"end":{"row":78,"column":11},"action":"insert","lines":["n"]}],[{"start":{"row":78,"column":11},"end":{"row":78,"column":12},"action":"insert","lines":[" "],"id":14},{"start":{"row":78,"column":12},"end":{"row":78,"column":13},"action":"insert","lines":["t"]},{"start":{"row":78,"column":13},"end":{"row":78,"column":14},"action":"insert","lines":["h"]},{"start":{"row":78,"column":14},"end":{"row":78,"column":15},"action":"insert","lines":["a"]},{"start":{"row":78,"column":15},"end":{"row":78,"column":16},"action":"insert","lines":["t"]}],[{"start":{"row":78,"column":16},"end":{"row":78,"column":17},"action":"insert","lines":[" "],"id":15},{"start":{"row":78,"column":17},"end":{"row":78,"column":18},"action":"insert","lines":["e"]},{"start":{"row":78,"column":18},"end":{"row":78,"column":19},"action":"insert","lines":["t"]},{"start":{"row":78,"column":19},"end":{"row":78,"column":20},"action":"insert","lines":["s"]},{"start":{"row":78,"column":20},"end":{"row":78,"column":21},"action":"insert","lines":["t"]}],[{"start":{"row":78,"column":21},"end":{"row":78,"column":22},"action":"insert","lines":[" "],"id":16}],[{"start":{"row":78,"column":21},"end":{"row":78,"column":22},"action":"remove","lines":[" "],"id":17},{"start":{"row":78,"column":20},"end":{"row":78,"column":21},"action":"remove","lines":["t"]},{"start":{"row":78,"column":19},"end":{"row":78,"column":20},"action":"remove","lines":["s"]},{"start":{"row":78,"column":18},"end":{"row":78,"column":19},"action":"remove","lines":["t"]},{"start":{"row":78,"column":17},"end":{"row":78,"column":18},"action":"remove","lines":["e"]}],[{"start":{"row":78,"column":17},"end":{"row":78,"column":18},"action":"insert","lines":["t"],"id":18},{"start":{"row":78,"column":18},"end":{"row":78,"column":19},"action":"insert","lines":["e"]},{"start":{"row":78,"column":19},"end":{"row":78,"column":20},"action":"insert","lines":["s"]},{"start":{"row":78,"column":20},"end":{"row":78,"column":21},"action":"insert","lines":["t"]}],[{"start":{"row":78,"column":21},"end":{"row":78,"column":22},"action":"insert","lines":[" "],"id":19},{"start":{"row":78,"column":22},"end":{"row":78,"column":23},"action":"insert","lines":["c"]},{"start":{"row":78,"column":23},"end":{"row":78,"column":24},"action":"insert","lines":["a"]},{"start":{"row":78,"column":24},"end":{"row":78,"column":25},"action":"insert","lines":["s"]},{"start":{"row":78,"column":25},"end":{"row":78,"column":26},"action":"insert","lines":["e"]}],[{"start":{"row":78,"column":26},"end":{"row":78,"column":27},"action":"insert","lines":["#"],"id":20},{"start":{"row":78,"column":27},"end":{"row":78,"column":28},"action":"insert","lines":["1"]}],[{"start":{"row":77,"column":5},"end":{"row":78,"column":0},"action":"insert","lines":["",""],"id":21},{"start":{"row":78,"column":0},"end":{"row":78,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":87,"column":0},"end":{"row":87,"column":12},"action":"insert","lines":["            "],"id":22}],[{"start":{"row":87,"column":0},"end":{"row":87,"column":12},"action":"remove","lines":["            "],"id":23}],[{"start":{"row":87,"column":0},"end":{"row":87,"column":1},"action":"insert","lines":[" "],"id":24},{"start":{"row":87,"column":1},"end":{"row":87,"column":2},"action":"insert","lines":[" "]}],[{"start":{"row":87,"column":2},"end":{"row":87,"column":29},"action":"insert","lines":[" #Function that test case#1"],"id":25}],[{"start":{"row":87,"column":28},"end":{"row":87,"column":29},"action":"remove","lines":["1"],"id":26}],[{"start":{"row":87,"column":28},"end":{"row":87,"column":29},"action":"insert","lines":["2"],"id":27}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":12},"action":"insert","lines":["            "],"id":28}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":4},"action":"remove","lines":["    "],"id":29}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":4},"action":"remove","lines":["    "],"id":30}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":1},"action":"insert","lines":[" "],"id":31}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":1},"action":"remove","lines":[" "],"id":32}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":4},"action":"insert","lines":["    "],"id":33}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":4},"action":"remove","lines":["    "],"id":34}],[{"start":{"row":97,"column":0},"end":{"row":97,"column":2},"action":"insert","lines":["  "],"id":35}],[{"start":{"row":97,"column":2},"end":{"row":98,"column":0},"action":"insert","lines":["",""],"id":36},{"start":{"row":98,"column":0},"end":{"row":98,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":98,"column":2},"end":{"row":98,"column":29},"action":"insert","lines":[" #Function that test case#1"],"id":37}],[{"start":{"row":98,"column":28},"end":{"row":98,"column":29},"action":"remove","lines":["1"],"id":38}],[{"start":{"row":98,"column":28},"end":{"row":98,"column":29},"action":"insert","lines":["3"],"id":39}],[{"start":{"row":108,"column":0},"end":{"row":108,"column":2},"action":"insert","lines":["  "],"id":40}],[{"start":{"row":108,"column":2},"end":{"row":108,"column":29},"action":"insert","lines":[" #Function that test case#1"],"id":41}],[{"start":{"row":108,"column":28},"end":{"row":108,"column":29},"action":"remove","lines":["1"],"id":42}],[{"start":{"row":108,"column":28},"end":{"row":108,"column":29},"action":"insert","lines":["4"],"id":43}],[{"start":{"row":107,"column":5},"end":{"row":108,"column":0},"action":"insert","lines":["",""],"id":44},{"start":{"row":108,"column":0},"end":{"row":108,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":120,"column":0},"end":{"row":121,"column":0},"action":"insert","lines":["",""],"id":45}],[{"start":{"row":121,"column":0},"end":{"row":121,"column":2},"action":"insert","lines":["  "],"id":46}],[{"start":{"row":121,"column":2},"end":{"row":121,"column":29},"action":"insert","lines":[" #Function that test case#1"],"id":47}],[{"start":{"row":121,"column":28},"end":{"row":121,"column":29},"action":"remove","lines":["1"],"id":48}],[{"start":{"row":121,"column":28},"end":{"row":121,"column":29},"action":"insert","lines":["5"],"id":49}],[{"start":{"row":132,"column":0},"end":{"row":133,"column":0},"action":"insert","lines":["",""],"id":50}],[{"start":{"row":133,"column":0},"end":{"row":133,"column":2},"action":"insert","lines":["  "],"id":51}],[{"start":{"row":133,"column":2},"end":{"row":133,"column":29},"action":"insert","lines":[" #Function that test case#1"],"id":52}],[{"start":{"row":133,"column":28},"end":{"row":133,"column":29},"action":"remove","lines":["1"],"id":53}],[{"start":{"row":133,"column":28},"end":{"row":133,"column":29},"action":"insert","lines":["6"],"id":54}],[{"start":{"row":146,"column":0},"end":{"row":147,"column":0},"action":"insert","lines":["",""],"id":55}],[{"start":{"row":147,"column":0},"end":{"row":147,"column":2},"action":"insert","lines":["  "],"id":56}],[{"start":{"row":147,"column":2},"end":{"row":147,"column":29},"action":"insert","lines":[" #Function that test case#1"],"id":57}],[{"start":{"row":147,"column":28},"end":{"row":147,"column":29},"action":"remove","lines":["1"],"id":58}],[{"start":{"row":147,"column":28},"end":{"row":147,"column":29},"action":"insert","lines":["7"],"id":59}],[{"start":{"row":160,"column":0},"end":{"row":161,"column":0},"action":"insert","lines":["",""],"id":60}],[{"start":{"row":161,"column":0},"end":{"row":161,"column":27},"action":"insert","lines":[" #Function that test case#1"],"id":61}],[{"start":{"row":161,"column":26},"end":{"row":161,"column":27},"action":"remove","lines":["1"],"id":62}],[{"start":{"row":161,"column":26},"end":{"row":161,"column":27},"action":"insert","lines":["8"],"id":63}],[{"start":{"row":161,"column":1},"end":{"row":161,"column":2},"action":"insert","lines":[" "],"id":64}],[{"start":{"row":174,"column":0},"end":{"row":174,"column":2},"action":"insert","lines":["  "],"id":65}],[{"start":{"row":174,"column":2},"end":{"row":175,"column":0},"action":"insert","lines":["",""],"id":66},{"start":{"row":175,"column":0},"end":{"row":175,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":175,"column":2},"end":{"row":175,"column":29},"action":"insert","lines":[" #Function that test case#1"],"id":67}],[{"start":{"row":175,"column":28},"end":{"row":175,"column":29},"action":"remove","lines":["1"],"id":68}],[{"start":{"row":175,"column":28},"end":{"row":175,"column":29},"action":"insert","lines":["9"],"id":69}],[{"start":{"row":11,"column":0},"end":{"row":12,"column":0},"action":"insert","lines":["",""],"id":70}],[{"start":{"row":12,"column":0},"end":{"row":12,"column":32},"action":"insert","lines":["#unit class for the coffee test."],"id":71}],[{"start":{"row":12,"column":20},"end":{"row":12,"column":26},"action":"remove","lines":["coffee"],"id":72},{"start":{"row":12,"column":20},"end":{"row":12,"column":21},"action":"insert","lines":["j"]},{"start":{"row":12,"column":21},"end":{"row":12,"column":22},"action":"insert","lines":["a"]},{"start":{"row":12,"column":22},"end":{"row":12,"column":23},"action":"insert","lines":["n"]},{"start":{"row":12,"column":23},"end":{"row":12,"column":24},"action":"insert","lines":["k"]},{"start":{"row":12,"column":24},"end":{"row":12,"column":25},"action":"insert","lines":["e"]},{"start":{"row":12,"column":25},"end":{"row":12,"column":26},"action":"insert","lines":["n"]},{"start":{"row":12,"column":26},"end":{"row":12,"column":27},"action":"insert","lines":["p"]}],[{"start":{"row":12,"column":27},"end":{"row":12,"column":28},"action":"insert","lines":["o"],"id":73},{"start":{"row":12,"column":28},"end":{"row":12,"column":29},"action":"insert","lines":["n"]}],[{"start":{"row":23,"column":0},"end":{"row":24,"column":0},"action":"insert","lines":["",""],"id":74}],[{"start":{"row":24,"column":0},"end":{"row":24,"column":2},"action":"insert","lines":["  "],"id":75}],[{"start":{"row":24,"column":2},"end":{"row":24,"column":3},"action":"insert","lines":["#"],"id":76},{"start":{"row":24,"column":3},"end":{"row":24,"column":4},"action":"insert","lines":["F"]},{"start":{"row":24,"column":4},"end":{"row":24,"column":5},"action":"insert","lines":["u"]},{"start":{"row":24,"column":5},"end":{"row":24,"column":6},"action":"insert","lines":["n"]},{"start":{"row":24,"column":6},"end":{"row":24,"column":7},"action":"insert","lines":["c"]},{"start":{"row":24,"column":7},"end":{"row":24,"column":8},"action":"insert","lines":["t"]},{"start":{"row":24,"column":8},"end":{"row":24,"column":9},"action":"insert","lines":["i"]},{"start":{"row":24,"column":9},"end":{"row":24,"column":10},"action":"insert","lines":["o"]},{"start":{"row":24,"column":10},"end":{"row":24,"column":11},"action":"insert","lines":["n"]}],[{"start":{"row":24,"column":11},"end":{"row":24,"column":12},"action":"insert","lines":[" "],"id":77},{"start":{"row":24,"column":12},"end":{"row":24,"column":13},"action":"insert","lines":["w"]},{"start":{"row":24,"column":13},"end":{"row":24,"column":14},"action":"insert","lines":["i"]},{"start":{"row":24,"column":14},"end":{"row":24,"column":15},"action":"insert","lines":["t"]},{"start":{"row":24,"column":15},"end":{"row":24,"column":16},"action":"insert","lines":["h"]}],[{"start":{"row":24,"column":16},"end":{"row":24,"column":17},"action":"insert","lines":[" "],"id":78},{"start":{"row":24,"column":17},"end":{"row":24,"column":18},"action":"insert","lines":["r"]}],[{"start":{"row":24,"column":17},"end":{"row":24,"column":18},"action":"remove","lines":["r"],"id":79}],[{"start":{"row":24,"column":17},"end":{"row":24,"column":18},"action":"insert","lines":["t"],"id":80},{"start":{"row":24,"column":18},"end":{"row":24,"column":19},"action":"insert","lines":["h"]},{"start":{"row":24,"column":19},"end":{"row":24,"column":20},"action":"insert","lines":["e"]}],[{"start":{"row":24,"column":20},"end":{"row":24,"column":21},"action":"insert","lines":[" "],"id":81}],[{"start":{"row":24,"column":21},"end":{"row":24,"column":22},"action":"insert","lines":["s"],"id":82},{"start":{"row":24,"column":22},"end":{"row":24,"column":23},"action":"insert","lines":["i"]},{"start":{"row":24,"column":23},"end":{"row":24,"column":24},"action":"insert","lines":["m"]},{"start":{"row":24,"column":24},"end":{"row":24,"column":25},"action":"insert","lines":["p"]},{"start":{"row":24,"column":25},"end":{"row":24,"column":26},"action":"insert","lines":["l"]},{"start":{"row":24,"column":26},"end":{"row":24,"column":27},"action":"insert","lines":["e"]}],[{"start":{"row":24,"column":27},"end":{"row":24,"column":28},"action":"insert","lines":[" "],"id":83},{"start":{"row":24,"column":28},"end":{"row":24,"column":29},"action":"insert","lines":["c"]},{"start":{"row":24,"column":29},"end":{"row":24,"column":30},"action":"insert","lines":["a"]},{"start":{"row":24,"column":30},"end":{"row":24,"column":31},"action":"insert","lines":["s"]},{"start":{"row":24,"column":31},"end":{"row":24,"column":32},"action":"insert","lines":["e"]},{"start":{"row":24,"column":32},"end":{"row":24,"column":33},"action":"insert","lines":["s"]}],[{"start":{"row":24,"column":33},"end":{"row":24,"column":34},"action":"insert","lines":[" "],"id":84},{"start":{"row":24,"column":34},"end":{"row":24,"column":35},"action":"insert","lines":["t"]},{"start":{"row":24,"column":35},"end":{"row":24,"column":36},"action":"insert","lines":["e"]},{"start":{"row":24,"column":36},"end":{"row":24,"column":37},"action":"insert","lines":["s"]},{"start":{"row":24,"column":37},"end":{"row":24,"column":38},"action":"insert","lines":["t"]}],[{"start":{"row":51,"column":5},"end":{"row":52,"column":0},"action":"remove","lines":["",""],"id":85}],[{"start":{"row":51,"column":5},"end":{"row":52,"column":0},"action":"insert","lines":["",""],"id":86},{"start":{"row":52,"column":0},"end":{"row":52,"column":2},"action":"insert","lines":["  "]},{"start":{"row":52,"column":2},"end":{"row":53,"column":0},"action":"insert","lines":["",""]},{"start":{"row":53,"column":0},"end":{"row":53,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":53,"column":2},"end":{"row":53,"column":38},"action":"insert","lines":["#Function with the simple cases test"],"id":87}],[{"start":{"row":24,"column":34},"end":{"row":24,"column":35},"action":"insert","lines":["p"],"id":88},{"start":{"row":24,"column":35},"end":{"row":24,"column":36},"action":"insert","lines":["l"]},{"start":{"row":24,"column":36},"end":{"row":24,"column":37},"action":"insert","lines":["u"]}],[{"start":{"row":24,"column":37},"end":{"row":24,"column":38},"action":"insert","lines":[" "],"id":89}],[{"start":{"row":53,"column":34},"end":{"row":53,"column":35},"action":"insert","lines":["m"],"id":90},{"start":{"row":53,"column":35},"end":{"row":53,"column":36},"action":"insert","lines":["i"]},{"start":{"row":53,"column":36},"end":{"row":53,"column":37},"action":"insert","lines":["n"]},{"start":{"row":53,"column":37},"end":{"row":53,"column":38},"action":"insert","lines":["u"]},{"start":{"row":53,"column":38},"end":{"row":53,"column":39},"action":"insert","lines":["s"]}],[{"start":{"row":53,"column":39},"end":{"row":53,"column":40},"action":"insert","lines":[" "],"id":91}],[{"start":{"row":14,"column":0},"end":{"row":14,"column":2},"action":"insert","lines":["  "],"id":92}],[{"start":{"row":14,"column":2},"end":{"row":15,"column":0},"action":"insert","lines":["",""],"id":93},{"start":{"row":15,"column":0},"end":{"row":15,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":15,"column":2},"end":{"row":15,"column":50},"action":"insert","lines":["#Method that setup variables for every print out"],"id":94}],[{"start":{"row":20,"column":0},"end":{"row":20,"column":2},"action":"insert","lines":["  "],"id":95}],[{"start":{"row":20,"column":2},"end":{"row":21,"column":0},"action":"insert","lines":["",""],"id":96},{"start":{"row":21,"column":0},"end":{"row":21,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":21,"column":2},"end":{"row":21,"column":54},"action":"insert","lines":[" #Method that teardown variables for every print out"],"id":97}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":176,"column":16},"end":{"row":176,"column":21},"isBackwards":true},"options":{"tabSize":2,"useSoftTabs":true,"guessTabSize":false,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1587934606282,"hash":"6684a5d6a1721018233d1c793a2faff43f24ea22"}