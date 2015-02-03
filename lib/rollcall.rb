require 'socket'

class RollCall
  def self.call_roll
    addr = ['<broadcast>', 33333]# broadcast address

    sending_sock = UDPSocket.new
    sending_sock.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, true)
    data = 'roll call!'
    sending_sock.send(data, 0, addr[0], addr[1])

    addr = ['0.0.0.0', 33334]  # host, port
    BasicSocket.do_not_reverse_lookup = true
    #
    # Create socket and bind to address
    receiving_sock = UDPSocket.new
    receiving_sock.bind(addr[0], addr[1])

    server_info = {}

    # listen for 2 seconds
    loop do
      got_something_that_time = nil
      if IO.select([receiving_sock], nil, nil, 2) # 2 seconds
        data, addr = receiving_sock.recvfrom(1024) #1024 = max packet size

        got_something_that_time = true
        hostname,num_cores = data.split
        server_info.store(hostname, num_cores)
      end
     break unless got_something_that_time # stop receiving if we haven't seen any data in a while
    end
    receiving_sock.close

    sending_sock.close
    server_info
  end
end
