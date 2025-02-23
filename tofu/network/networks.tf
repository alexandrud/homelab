resource "unifi_network" "main" {
  name    = "main"
  purpose = "corporate"

  subnet       = "10.255.0.1/24"
  vlan_id      = 0
  dhcp_start   = "10.255.0.16"
  dhcp_stop    = "10.255.0.254"
  dhcp_enabled = true
  domain_name                            = "localdomain"
  intra_network_access_enabled           = true
  ipv6_interface_type                    = "pd"
  ipv6_pd_interface                      = "wan"
  ipv6_pd_start                          = "::2"
  ipv6_pd_stop                           = "::7d1"
  ipv6_ra_enable                         = true
  ipv6_ra_priority                       = "high"
  ipv6_ra_valid_lifetime                 = 86400
  multicast_dns                          = true
}

resource "unifi_network" "work" {
  name    = "work"
  purpose = "corporate"

  subnet       = "10.255.1.1/24"
  vlan_id      = 4
  dhcp_start   = "10.255.1.16"
  dhcp_stop    = "10.255.1.254"
  dhcp_enabled = true
  dhcp_v6_start                          = "::2"
  dhcp_v6_stop                           = "::7d1"
  ipv6_pd_interface                      = "wan"
  ipv6_pd_start                          = "::2"
  ipv6_pd_stop                           = "::7d1"
  ipv6_ra_priority                       = "high"
  domain_name                            = "localdomain"
  intra_network_access_enabled           = false
  ipv6_interface_type                    = "none"
  multicast_dns                          = false
}

resource "unifi_network" "vpn" {
  name    = "vpn"
  purpose = "corporate"

  subnet       = "10.255.2.1/24"
  vlan_id      = 3
  dhcp_start   = "10.255.2.16"
  dhcp_stop    = "10.255.2.254"
  dhcp_enabled = true
  dhcp_v6_start                          = "::2"
  dhcp_v6_stop                           = "::7d1"
  domain_name                            = "vpn.localdomain"
  intra_network_access_enabled           = false
  ipv6_interface_type                    = "pd"
  ipv6_pd_interface                      = "wan"
  ipv6_pd_start                          = "::2"
  ipv6_pd_stop                           = "::7d1"
  ipv6_ra_enable                         = true
  ipv6_ra_priority                       = "high"
  ipv6_ra_valid_lifetime                 = 86400
  multicast_dns                          = false
}

resource "unifi_network" "mgmt" {
  name    = "mgmt"
  purpose = "corporate"

  subnet       = "10.255.3.1/24"
  vlan_id      = 2
  dhcp_start   = "10.255.3.16"
  dhcp_stop    = "10.255.3.254"
  dhcp_enabled = true
  dhcp_v6_start                          = "::2"
  dhcp_v6_stop                           = "::7d1"
  domain_name                            = "mgmt.localdomain"
  intra_network_access_enabled           = true
  ipv6_interface_type                    = "pd"
  ipv6_pd_interface                      = "wan"
  ipv6_pd_start                          = "::2"
  ipv6_pd_stop                           = "::7d1"
  ipv6_ra_enable                         = true
  ipv6_ra_priority                       = "high"
  ipv6_ra_valid_lifetime                 = 86400
  multicast_dns                          = false
}

resource "unifi_network" "guest" {
  name    = "guest"
  purpose = "guest"

  subnet       = "10.255.4.1/24"
  vlan_id      = 5
  dhcp_start   = "10.255.4.16"
  dhcp_stop    = "10.255.4.254"
  dhcp_enabled = true
  domain_name                            = "guest.localdomain"
  intra_network_access_enabled           = false
  ipv6_interface_type                    = "pd"
  ipv6_pd_interface                      = "wan"
  ipv6_pd_start                          = "::2"
  ipv6_pd_stop                           = "::7d1"
  ipv6_ra_enable                         = true
  ipv6_ra_priority                       = "high"
  ipv6_ra_valid_lifetime                 = 86400
  multicast_dns                          = false
}

resource "unifi_network" "lab" {
  name    = "lab"
  purpose = "corporate"

  subnet       = "10.255.5.1/24"
  vlan_id      = 6
  dhcp_start   = "10.255.5.16"
  dhcp_stop    = "10.255.5.254"
  dhcp_enabled = true
  domain_name                            = "lab.localdomain"
  intra_network_access_enabled           = false
  ipv6_interface_type                    = "pd"
  ipv6_pd_interface                      = "wan"
  ipv6_pd_start                          = "::2"
  ipv6_pd_stop                           = "::7d1"
  ipv6_ra_enable                         = true
  ipv6_ra_priority                       = "high"
  ipv6_ra_valid_lifetime                 = 86400
  multicast_dns                          = true
}