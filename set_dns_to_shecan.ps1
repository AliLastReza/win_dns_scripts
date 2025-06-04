# Define the DNS server addresses
$dnsServers = "185.51.200.2", "178.22.122.100"

# Get all active Ethernet and Wi-Fi adapters
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

# Loop through each adapter and set the DNS servers
foreach ($adapter in $adapters) {
    Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses $dnsServers
    Write-Host "DNS for '$($adapter.Name)' set to $($dnsServers -join ', ')"
}

# Flush DNS cache
Clear-DnsClientCache
Write-Host "DNS cache flushed."
