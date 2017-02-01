#!/usr/bin/env ruby

require 'socket'

all = TCPServer.open(25)
addr = all.addr
addr.shift

while true
  Thread.start(all.accept) do |s|
    filename = Time.now.strftime("%Y%m%d_%H%M%S_%N.eml")
    f = File.open(filename, "w+")
    s.write("220 OK\n")
    flg = false
    while s.gets
      line = $_.chomp
      f.write(line + "\n")
      if flg == true
        if /^\.$/ =~ line
          f.write("QUIT\n")
          f.close
          s.write("250 OK\n")
          s.close
          flg = false
        end
      else
        case line
        when /^DATA$/i
          flg = true
          s.write("354 OK\n")
        when /^RCPT TO:/i
          s.write("250 OK\n")
        when /^QUIT$/i
          s.write("221 OK\n")
          f.close
          s.close
        else
          s.write("250 OK\n")
        end
      end
    end
  end
end
