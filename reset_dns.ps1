# Get all active network adapters
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

# Reset DNS to automatic for each adapter
foreach ($adapter in $adapters) {
    Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ResetServerAddresses
    Write-Host "DNS for '$($adapter.Name)' reset to automatic."
}

# Flush DNS cache
Clear-DnsClientCache
Write-Host "DNS cache flushed."
