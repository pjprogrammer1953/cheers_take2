require 'minitest/autorun'

class TestCheersIntegration < Minitest::Test

#Sample test
  def test_00_that_the_tests_run
    assert_equal true, false
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
    output = `./cheers`
    expected = <<EOS
Please enter a valid date to go with your name.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid name must accompany birthday
  def test_03_1_arg_w_birthday_and_no_name
  	output = `./cheers`
    expected = <<EOS
Please enter a valid name to go with your birthday.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments needed
  def test_04_1_arg_all_non_words
  	output = `./cheers`
    expected = <<EOS
Please enter a valid name and birthday.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments must accompany run command of './cheers'
  def test_05_1_arg_.cheers_all_non_words
  	output = `./cheers`
    expected = <<EOS
Please enter a valid name and birthday.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Date validation
  def test_06_date_validation
  	output = `./cheers`
    expected = <<EOS
Please enter a valid date in MM/DD/CCYY format.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_07_2_args_name_and_date_with_this_year
  	output = `./cheers`
    expected = <<EOS
You cannot be that young! Enter a reasonable date.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_08_3_args_ignore_extra_args
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_09_2_args_invalid_invalid
    output = `./cheers`
    expected = <<EOS
Please enter a valid name and birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_10_2_args_invalid_valid
  	output = `./cheers`
    expected = <<EOS
Please enter a valid name to go with your date.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_11_2_args_valid_invalid
  	output = `./cheers`
    expected = <<EOS
Please enter a valid date to go with your name.
Try again: `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

#Valid arguments - produce message
  def test_12_2_args_valid_valid
  	expected = "Bill", "04/30"
    output = "Hi, Bill. There are ", 9, " days until your birthday."
    assert_equal expected, output
  end
end