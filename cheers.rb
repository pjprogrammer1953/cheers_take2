#!/usr/bin/env ruby

require 'date'

args = ARGV

def exit_with_usage_instructions
  puts <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
  exit
end

#birthday calculation
def birthday_due_calculation(mmdd)
#  today = Time.new.yday
#  userBirth = Date.strftime(mmdd, "%m%d").yday
  today = Time.new
  tJulian = today.yday
  userBirth = DateTime.parse(mmdd, "%m%d").yday
  puts tJulian
  puts userBirth
  if userBirth >= tJulian
     puts "Hi, XXXX. There are " + (userBirth - tJulian).to_s + " until your birthday."
  else
     puts "Hi, YYYY. There are " + (365 - tJulian + userBirth).to_s + " until your birthday."
  end
end

exit_with_usage_instructions if ARGV.empty?

original_name = ARGV[0]
cheerable_name = original_name.upcase.gsub(/[^A-Z]/, "")

exit_with_usage_instructions if cheerable_name.empty?

exit_with_usage_instructions if ARGV.size < 2

exit_with_usage_instructions if ARGV[1].size > 5

if ARGV.size >= 2
  birthday_due_calculation(ARGV[2])
end

cheerable_name.each_char do |char|
  article = "n" if "HALFNORSEMIX".include? char
  puts "Give me a#{article}... #{char}"
end

puts "#{original_name}’s just GRAND!"
puts ""
puts "I would wish you a Happy Birthday, if I knew when that was!"