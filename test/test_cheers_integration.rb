require 'minitest/autorun'
require 'rubygems'
require 'bundler/setup'

class TestCheersIntegration < Minitest::Test

#Sample test
  def test_00_that_the_tests_run
    assert_equal true, true
  end

#Valid arguments
  def test_01_zero_args_help_message
    output = `./cheers.rb`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid date must accompany name
  def test_02_one_arg_with_valid_name
    output = `./cheers.rb Bill`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid name must accompany birthday
  def test_03_1_arg_w_birthday_and_no_name
    output = `./cheers.rb 0430`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid arguments needed
  def test_04_1_arg_all_non_words
    output = `./cheers.rb @@@@@ @@@@`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid arguments must accompany run command of './cheers'
  def test_05_1_arg_cheers_all_non_words
    output = `./cheers.rb 77777 @@@@`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Date validation
  def test_06_date_validation
    output = `./cheers.rb Bill 9999`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_07_2_args_name_and_date_with_this_year
    output = `./cheers.rb Bill 0430`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_08_3_args_ignore_extra_args
    output = `./cheers.rb Bill 1129 Chattanooga`
    expected = <<EOS
Give me a... B
Give me an... I
Give me an... L
Give me an... L
Hi, Bill. There are 230 days until your birthday."
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_09_2_args_invalid_invalid
    output = `./cheers.rb 77777 9999`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_10_2_args_invalid_valid
    output = `./cheers.rb 777777 0430`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_11_2_args_valid_invalid
    output = `./cheers.rb Mike 9999`
    expected = <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

#Valid arguments - produce message
  def test_12_2_args_valid_valid
    expected = `./cheers.rb Mike 1129`
    output = "Hi, Mike. There are 210 days until your birthday."
    assert_equal expected, output
  end
end
