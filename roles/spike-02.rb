name "spike-02"
description "Master role applied to spike-02"

default_attributes(
  :networking => {
    :interfaces => {
      :internal_ipv4 => {
        :interface => "bond0",
        :role => :internal,
        :family => :inet,
        :address => "10.0.64.4",
        :bond => {
          :mode => "802.3ad",
          :lacprate => "fast",
          :xmithashpolicy => "layer3+4",
          :slaves => %w[eno1 eno2 eno3 eno4 eno49 eno50]
        }
      },
      :external_ipv4 => {
        :interface => "bond0.101",
        :role => :external,
        :family => :inet,
        :address => "184.104.226.100"
      },
      :external_ipv6 => {
        :interface => "bond0.101",
        :role => :external,
        :family => :inet6,
        :address => "2001:470:1:b3b::4"
      }
    }
  }
)

run_list(
  "role[equinix-dub]",
  "role[hp-g9]",
  "role[web-frontend]"
)
