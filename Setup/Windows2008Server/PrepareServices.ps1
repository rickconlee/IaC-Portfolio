########################
# Instantiate Modules 
########################
Import-Module ServerManager

###########################
# Declare Script Variables
###########################

# DHCP Service Configuration Variables 
$dhcpServer = "LOCALHOST" # The server where DHCP services is enabled
$scopeName = "Primary DHCP Scope" # Give a friendly name to the DHCP scope
$scopeStartIP = "10.230.10.20" # Start of scope
$scopeEndIP = "10.230.10.30" # End of scope
$subnetMask = "255.255.255.0" # Netmask
$defaultGateway = "10.230.10.1" # Default gateway that you want to hand to clients
$dnsServers = "10.230.10.10" # Separate multiple DNS servers with a comma
$leaseDuration = "8" # Lease duration in days


########################
# SETUP SERVICES
########################


# DHCP
#######

Add-WindowsFeature DHCP
Start-Service -Name DHCPServer
Get-Service -Name DHCPServer

# Create scope
& netsh dhcp server \\$dhcpServer add scope $scopeStartIP $subnetMask "$scopeName"
& netsh dhcp server \\$dhcpServer scope $scopeStartIP set state 1

# Configure scope options
& netsh dhcp server \\$dhcpServer scope $scopeStartIP set optionvalue 3 IPADDRESS $defaultGateway
& netsh dhcp server \\$dhcpServer scope $scopeStartIP set optionvalue 6 IPADDRESS $dnsServers
& netsh dhcp server \\$dhcpServer scope $scopeStartIP set optionvalue 51 DWORD $leaseDuration

# Configure the IP address range for the DHCP scope
& netsh dhcp server \\$dhcpServer scope $scopeStartIP add iprange $scopeStartIP $scopeEndIP

