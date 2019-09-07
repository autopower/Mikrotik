:local rmark "WAN2"
:local rmarkhelper "WAN2Helper"
:local count [/ip route print count-only where comment=$rmark]
# main code
:if ($bound = 1) do={
  :if ($count = 0) do={
        /ip route add gateway=$"gateway-address" comment=$rmark distance=2;
        /ip route add distance=1 dst-address=8.8.8.8/32 gateway=$"gateway-address" comment=$rmarkhelper routing-mark=$rmarkhelper; 
    } else={
      :if ($count = 1) do={
        :local test [/ip route find where comment=$rmark];
        :if ([/ip route get $test gateway] != $"gateway-address") do={
          /ip route set $test gateway=$"gateway-address";
          /ip route set [find comment=$rmarkhelper] gateway=$"gateway-address";
        }
      } else={
        :log error ">>> Multiple routes found";
      }
    }
} else={
  /ip route remove [find comment=$rmark];
  /ip route remove [find comment=$rmarkhelper];
}