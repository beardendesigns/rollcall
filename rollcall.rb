require 'socket'
addr = ['<broadcast>', 33333]# broadcast address

SendingSock = UDPSocket.new
SendingSock.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, true)
data = 'roll call!'
SendingSock.send(data, 0, addr[0], addr[1])

addr = ['0.0.0.0', 33334]  # host, port
BasicSocket.do_not_reverse_lookup = true
#
# Create socket and bind to address
ReceivingSock = UDPSocket.new
ReceivingSock.bind(addr[0], addr[1])

server_info = {}

# listen for 5 seconds
loop do
  got_something_that_time = nil
  if IO.select([ReceivingSock], nil, nil, 2)
    data, addr = ReceivingSock.recvfrom(1024) #1024 = max packet size

    got_something_that_time = true
    hostname,num_cores = data.split
    server_info.store(hostname, num_cores)
    puts data
  end
 break unless got_something_that_time # stop receiving if we haven't seen any data in a while
end
ReceivingSock.close

SendingSock.close

puts "#{server_info.keys.count} machines with a total of #{server_info.values.map(&:to_i).reduce(:+)} cores responded."
