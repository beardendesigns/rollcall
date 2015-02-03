require 'rollcall'

roll = RollCall.call_roll
p roll
puts "#{roll.keys.count} machines with a total of #{roll.values.map{|info| info[:cores]}.reduce(:+)} cores responded."
