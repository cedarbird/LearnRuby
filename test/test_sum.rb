#!/usr/bin/env ruby

require 'minitest'
require 'stringio'

MiniTest::Unit.autorun

class TestSum < MiniTest::Unit::TestCase

  def setup
  end
  # teardown はあまり使わない
  def teardown
  end

  def test_sum

    #input data
    input = <<_END_
16:46:38,4
16:46:38,2
16:46:38,3
16:46:38,2
16:46:38,4
16:46:39,5
16:46:39,5
16:46:39,5
16:46:39,5
16:46:39,5
16:46:40,6
16:46:40,6
16:46:40,6
16:46:41,7
16:46:41,7
16:46:42,8
_END_

    #expied data
    expired_result = <<_END_
16:46:38,15
16:46:39,25
16:46:40,18
16:46:41,14
16:46:42,8
_END_

    #puts Dir.pwd
    $stdin = (StringIO.new(input))
    $stdout = StringIO.new
    load './src/sum.rb'
    assert_equal expired_result, $stdout.string
  end
end
