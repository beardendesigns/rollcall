# rollcall
Two ruby scripts that can ask anyone that's listening for their hostname and number of cores.

`ruby server_info_control.rb start`: listen on port 33333 for someone to request their stats, then respond on port 33334. "I am an available server to test on".

`ruby server_info_control.rb stop`: stop listening/responding. "..."

```ruby
require 'rollcall'
test_server_info = Rollcall.call_roll
```

Broadcast to port 33333 to solicit information, then listen for responses for 2 seconds on port 33334.
```ruby
p test_server_info
=> { "new-test-machine-<uuid>.local" => {cores: 8, role: :test_0}, "new-test-machine-<other-uuid>.local" => {cores: 16, role: :test_1}}
```

Based on super handy code examples on betterlogic.com

Specifically this one: <http://betterlogic.com/roger/2009/06/ruby-udp-broadcast-simple-example/>

And this one: <http://betterlogic.com/roger/2010/03/ruby-udp-socket-example/>
