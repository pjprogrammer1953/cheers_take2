require 'minitest/autorun'
require 'rubygems'
require 'bundler/setup'
require 'cheers_integration'

class TestCheersIntegration < Minitest::Test

#Sample test
  def test_00_that_the_tests_run
    assert_equal false
  end

#Valid arguments
  def test_01_zero_args_help_message
    output = `./cheers`
    expected = <<EOS
Please enter your name and your birthday.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid date must accompany name
  def test_02_one_arg_with_valid_name
    output = `./cheers Bill`
    expected = <<EOS
Please enter a valid date to go with your name.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid name must accompany birthday
  def test_03_1_arg_w_birthday_and_no_name
  	output = `./cheers 04301960`
    expected = <<EOS
Please enter a valid name to go with your birthday.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments needed
  def test_04_1_arg_all_non_words
  	output = `***** ***** ********`
    expected = <<EOS
Please enter a valid name and birthday.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments must accompany run command of './cheers'
  def test_05_1_arg_.cheers_all_non_words
  	output = `./cheers 77777 ********`
    expected = <<EOS
Please enter a valid name and birthday.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Date validation
  def test_06_date_validation
  	output = `./cheers Bill 99999999`
    expected = <<EOS
Please enter a valid date in MM/DD/CCYY format.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_07_2_args_name_and_date_with_this_year
  	output = `./cheers Bill 04302015`
    expected = <<EOS
You cannot be that young! Enter a reasonable date.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_08_3_args_ignore_extra_args
    output = `./cheers Bill 04301960 Chattanooga`
    expected = "Hi, Bill. There are 9 days until your birthday."
    assert_equal expected, output
  end

#Valid arguments
  def test_09_2_args_invalid_invalid
    output = `./cheers 77777 99999999`
    expected = <<EOS
Please enter a valid name and birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_10_2_args_invalid_valid
  	output = `./cheers 777777 04301960`
    expected = <<EOS
Please enter a valid name to go with your date.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_11_2_args_valid_invalid
  	output = `./cheers Bill 99999999`
    expected = <<EOS
Please enter a valid date to go with your name.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments - produce message
  def test_12_2_args_valid_valid
  	expected = `./cheers Bill 04301960`
    output = "Hi, Bill. There are 9 days until your birthday."
    assert_equal expected, output
  end
end