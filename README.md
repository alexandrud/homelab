# Quick start
## Setup

Install [tenv](https://github.com/tofuutils/tenv).

Technically, once you have `tenv` everything should work. But I haven't tested it. So...
```bash
tenv tofu list-remote
tenv tofu install 1.9.0
tenv tg list-remote
tenv tg install 0.73.11
```

## Running the shit
### Edit credentials
Edit `secrets.auto.tfvars` to connect to the unifi. 

For later: This is very wrong and you should use some secret manager like [Hashicorp Vault](https://www.vaultproject.io/)

# Run the code

```bash
cd tofu/network
terragrunt plan # See what is going to be applied
terragrunt apply # Apply shit. Don't do it just yet
```

You will want to import what you have. Each terraform/tofu provider has documentation here: https://registry.terraform.io.

Each resource has the form "\<provider\>_\<resource\>". For example:
```
resource "unifi_network" "main" {  # Provider: unifi, Resource: network
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
```
This uses the provider `unifi` and creates the resource `network`.

# Import the shit
In the resource documentation (e.g. https://registry.terraform.io/providers/ubiquiti-community/unifi/latest/docs/resources/network) at the end you have the import command. Everything you already did by hand you can import.

```bash
terragrunt import unifi_network.main name=\<name you get from your unifi equipment\>
```

When you run a `terragrunt plan` you will find the cannonical name for the resource. It is the path in the state file, a `.json` file. https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/JSON

# How everything is structured
`terraform` is awesome, but it doesn't scale. Also, it's under a dubious licensing model nowadays. 

Fuck terraform, we're using [tofu](https://opentofu.org/). But `tofu` doesn't scale either. So... `tofu` will create the infrastructure, but we'll use [terragrunt](https://terragrunt.gruntwork.io/) as a wrapper to make it scallable.

```bash
├── azure
├── local
├── network
│   ├── dhcp-reservations.tf
│   ├── gw.tf
│   ├── networks.tf
│   ├── secrets.auto.tfvars
│   ├── terragrunt.hcl
│   ├── variables.tf
│   └── wlan.tf
├── terraform.lock.hcl
└── terragrunt.hcl
```
Terragrunt's main purpose is to help you not repeat yourself (DRY = do not repeaty yourself). 

In the root folder you have a `terragrunt.hcl` that will be inherited by all other stacks. It contains common bits of code like providers, state, local variables needed by all other stacks.

Then you have your infrastructure structure organized by folders (equivalent to stacks). It's specific to to you.

In every stack you have your bootstraping `terragrunt.hcl` that inherits the common settings from the root `terragrunt.hcl`. See `network/terragrunt.hcl` (see terragrunt documentation for more details).

