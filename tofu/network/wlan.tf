data "unifi_user_group" "default" {
}

resource "unifi_wlan" "wakko" {
  name       = "wakko"
  passphrase = "muiepsd"
  security   = "wpapsk"

  # enable WPA2/WPA3 support
  wpa3_support    = true
  wpa3_transition = true
  pmf_mode        = "optional"

  network_id    = unifi_network.main.id
  user_group_id = data.unifi_user_group.default.id
}