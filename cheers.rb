#!/usr/bin/env ruby

def exit_with_usage_instructions
  puts <<EOS
Please enter your name and your birthday.
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
  exit
end

exit_with_usage_instructions if ARGV.empty?

original_name = ARGV[0]
cheerable_name = original_name.upcase.gsub(/[^A-Z]/, "")

exit_with_usage_instructions if cheerable_name.empty?

exit_with_usage_instructions if ARGV.size < 2

exit_with_usage_instructions if ARGV[1].size > 5

cheerable_name.each_char do |char|
  article = "n" if "HALFNORSEMIX".include? char
  puts "Give me a#{article}... #{char}"
end

puts "#{original_name}’s just GRAND!"
puts ""
puts "I would wish you a Happy Birthday, if I knew when that was!"