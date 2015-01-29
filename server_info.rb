require 'socket'
addr = ['0.0.0.0', 33333]  # host, port
BasicSocket.do_not_reverse_lookup = true
#
# Create socket and bind to address
ReceivingSock = UDPSocket.new
ReceivingSock.bind(addr[0], addr[1])
loop do
  data, addr = ReceivingSock.recvfrom(1024) # 1024 is the max size of the packet

  if data == "roll call!"
    num_cores = `cat /proc/cpuinfo | grep "^processor" | wc -l` # count cores

    hostname = `hostname` # check hostname

    # calling .chomp to get rid of the newline
    sending_data = "#{hostname.chomp}.local #{num_cores.chomp}" # send info in the format hostname<space>num_cores
    send_to_ip = addr.last
    sock = UDPSocket.new
    sock.send(sending_data, 0, send_to_ip, 33334)
    sock.close
  end
end
ReceivingSock.close
