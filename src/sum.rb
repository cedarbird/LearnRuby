#!/bin/env ruby

begin
  result = Hash.new
  result.default = 0
  while gets
    items = $_.chomp.split(",")
    result[items[0]] += items[1].to_i
   end
  result.each { |k, v| puts "#{k},#{v}" }
rescue => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
  puts e.backtrace
end
