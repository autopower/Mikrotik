{
:global wannum
:global docount
:global failcount
:global pingsite
:local rmark ("WAN" . $wannum)
:local rmarkhelper ($rmark . "Helper")
:local iface ("ether" . $wannum)
:local dist1 ($wannum)
:local dist10 ($wannum * 10)
:local result [:global iface;/ping $pingsite interface=$iface count=$docount routing-table=$rmarkhelper]
:local iproute [/ip route get [find comment=$rmark] distance]
:local sendmail do={:global emailserver;:global sendto;/tool e-mail send to=$sendto server=$emailserver subject="$[/system identity get name] $mark $way" body="$[/system clock get date] $mark connectivity $way"}
:log info "(iface $iface) $rmark ping (via $rmarkhelper) result $result"
:if ($result < $failcount) do={
  :if ($iproute != $dist10) do={
    /ip route set [find comment=$rmark] distance=$dist10
    :log info "$rmark weight adjusted to $dist10"
    $sendmail way="lost" mark=$rmark
  }
} else={
  :if ($iproute = $dist10) do={
    /ip route set [find comment=$rmark] distance=$dist1
    :log info "$rmark weight adjusted to $dist1"
    $sendmail way="restored" mark=$rmark
  }
}
}
