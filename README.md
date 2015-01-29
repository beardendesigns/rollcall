# rollcall
Two ruby scripts that can ask anyone that's listening for their hostname and number of cores.

Computers running "server_info.rb" listen on port 33333 for someone to request their stats, then respond on port 33334.

Computers that run "rollcall.rb" listen broadcast to port 33333 to solicit information, then listen for responses for 2 seconds on port 33334.

Based on super handy code examples on betterlogic.com
Specifically this one: http://betterlogic.com/roger/2009/06/ruby-udp-broadcast-simple-example/
And this one: http://betterlogic.com/roger/2010/03/ruby-udp-socket-example/
