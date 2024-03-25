########################
# Instantiate Modules 
########################
Import-Module ServerManager

###########################
# Declare Script Variables
###########################

# DHCP Service Configuration Variables 
$dhcpServer = "Server1" # The server where DHCP services is enabled
$scopeName = "Primary DHCP Scope" # Give a friendly name to the DHCP scope
$scopeStartIP = "192.168.57.20" # Start of scope
$scopeEndIP = "192.168.57.30" # End of scope
$subnetMask = "255.255.255.0" # Netmask
$defaultGateway = "192.168.57.1" # Default gateway that you want to hand to clients
$dnsServers = "192.168.57.10" # Separate multiple DNS servers with a comma
$leaseDuration = "8" # Lease duration in days


########################
# SETUP SERVICES
########################


# DHCP
#######

Add-WindowsFeature DHCP

# Create scope
netsh dhcp server \\$dhcpServer add scope $scopeStartIP $subnetMask $scopeName
netsh dhcp server \\$dhcpServer scope $scopeStartIP set state 1

# Configure scope options
netsh dhcp server \\$dhcpServer scope $scopeStartIP set optionvalue 3 IPADDRESS $defaultGateway
netsh dhcp server \\$dhcpServer scope $scopeStartIP set optionvalue 6 IPADDRESS $dnsServers
netsh dhcp server \\$dhcpServer scope $scopeStartIP set optionvalue 51 DWORD $leaseDuration

# Configure the IP address we want to hand out in the scope
netsh dhcp server \\$dhcpServer scope $scopeStartIP add iprange $scopeStartIP $scopeEndIP
