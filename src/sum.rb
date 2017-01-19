#!/bin/env ruby

begin
  result = Hash.new
  while line = STDIN.gets
    line.chomp
    items = line.split(",")
    if result.has_key?(items[0])
      result[items[0]] += items[1].to_i
    else
      result[items[0]] = items[1].to_i
    end
  end
  result.each do |key, value|
    puts "#{key},#{value}"
  end
rescue => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
  puts e.backtrace
end
