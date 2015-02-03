require 'rollcall'

roll = RollCall.call_roll
puts "#{roll.keys.count} machines with a total of #{roll.values.map(&:to_i).reduce(:+)} cores responded."
