require 'socket'

s = TCPServer.new(8888)

puts "app listening on http://localhost:8888"

loop do
  c = s.accept

  method, path, protocol = c.gets.split()

  puts "receive request! #{method} #{path}"

  message = "Your location is #{path}.\n"

  c.puts "HTTP/1.1 200 OK"
  c.puts "Content-Type: text/plain; charset=utf8"
  c.puts "Content-Length: #{message.bytesize}"
  c.puts
  c.print message

  c.close
end
