require 'socket'
addr = ['<broadcast>', 33333]# broadcast address
#addr = ('255.255.255.255', 33333) # broadcast address explicitly [might not work ?]
#addr = ['127.0.0.255', 33333] # ??
SendingSock = UDPSocket.new
SendingSock.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, true)
data = 'roll call!'
SendingSock.send(data, 0, addr[0], addr[1])

addr = ['0.0.0.0', 33334]  # host, port
BasicSocket.do_not_reverse_lookup = true
# Create socket and bind to address
ReceivingSock = UDPSocket.new
ReceivingSock.bind(addr[0], addr[1])

# listen for 5 seconds
loop do
  got_something_that_time = nil
  if IO.select([ReceivingSock], nil, nil, 2)
    data, addr = ReceivingSock.recvfrom(1024) #1024 = max packet size

    got_something_that_time = true
    puts data
  end
 break unless got_something_that_time # stop receiving if we haven't seen any data in a while
end
ReceivingSock.close

SendingSock.close
