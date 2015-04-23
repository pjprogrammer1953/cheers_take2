#!/usr/bin/env ruby

require 'date'

args = ARGV


# set the args
name = args[0]
birthday = args[1]


# Helper string for grammer
$an_letters = "AEFHILMNORSX"


############################################
# method to print help message
############################################
def print_help
  puts "I'd cheer for you, if only I knew who you were :(\nTry again with `./cheers [Name] [mm/dd Birthday]`"
end

###########################################
# method to cheer
###########################################
def cheer (name, nameModified)
  nameModified.each_char do |letter|
    if $an_letters.include?(letter.upcase)
      puts "Give me an... " +  letter.upcase + "!"
    else
      puts "Give me a... " + letter.upcase + "!"
    end
  end
  puts name + "\'s just GRAND!"
end

#############################################
# method to find birthday countdown
#############################################
def birthday_countdown(birthday)
  # 1. need to get current day (TODAY)
  todayYDay = Time.new.yday
  # 2. need user's yday conversion
  begin
    userYDay = Date.strptime(birthday, "%m/%d").yday
    if userYDay  >= todayYDay
      puts "Awesome! Your birthday is in " + (userYDay-todayYDay).to_s + " days! Happy Birthday in advance!"
    else
      puts "Awesome! Your birthday is in " + ((365-todayYDay) + userYDay).to_s + " days! Happy Birthday in advance!"
    end
  rescue
    puts "I couldn't understand that. Could you give that to me in the mm/dd format next time?"
  end
end

############################################
# main logic
############################################
if name.nil? or name.empty?
  print_help
else
  nameModified = name.gsub(/[\d\W]/, "")
  if nameModified.empty?
    print_help
  else
    cheer(name, nameModified)

    if birthday.nil? or birthday.empty?
      puts "I would wish you a happy birthday, if I knew when that was!"
    else
      birthday_countdown(birthday)
    end
  end
end