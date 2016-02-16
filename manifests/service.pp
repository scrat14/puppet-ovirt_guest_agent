#
# class: service
#
# This puppet class makes sure that ovirt-guest-agent is started during
# boot and always running unless configured otherwise. Furthermore it
# requires class package to make sure that ovirt-guest-agent is installed.
#

class ovirt_guest_agent::service (

  $service_name   = $::ovirt_guest_agent::params::service_name,
  $package_name   = $::ovirt_guest_agent::params::package_name,
  $service_enable = $::ovirt_guest_agent::params::service_enable,
  $service_ensure = $::ovirt_guest_agent::params::service_ensure,

)inherits ovirt_guest_agent::params {

  require ovirt_guest_agent::package


  service { $service_name:
    ensure	  => $service_ensure,
    enable	  => $serice_enable,
    hasstatus => true,
    require	  => Package[$package_name],
  }

}
