resource "unifi_user" "tache" {
  mac  = "58:47:ca:7a:57:eb"
  name = "tache"
  fixed_ip   = "10.255.3.11"
  local_dns_record = "tache.mgmt.localdomain"
  network_id = unifi_network.mgmt.id
}

resource "unifi_user" "ianke" {
  mac  = "58:47:ca:79:77:3b"
  name = "ianke"
  fixed_ip   = "10.255.3.12"
  local_dns_record = "ianke.mgmt.localdomain"
  network_id = unifi_network.mgmt.id
}

resource "unifi_user" "cadar" {
  mac  = "58:47:ca:7a:56:f7"
  name = "cadar"
  fixed_ip   = "10.255.3.13"
  local_dns_record = "cadar.mgmt.localdomain"
  network_id = unifi_network.mgmt.id
}

resource "unifi_user" "pdu" {
  mac  = "02:81:ec:40:f3:6a"
  name = "pdu"
  fixed_ip   = "10.255.3.20"
  local_dns_record = "pdu.mgmt.localdomain"
  network_id = unifi_network.mgmt.id
}

resource "unifi_user" "eldes" {
  mac  = "70:b3:d5:8b:63:45"
  name = "eldes"
  fixed_ip   = "10.255.3.21"
  local_dns_record = "eldes.mgmt.localdomain"
  network_id = unifi_network.mgmt.id
}
