#
# class: package
#
# This puppet class is responsible for installing ovirt-guest-agent
# package (rpm/deb/...). There's no need to run it directly as it is
# required by class service.
#

class ovirt_guest_agent::package (

  $package_name   = $::ovirt_guest_agent::params::package_name,
  $package_ensure = $::ovirt_guest_agent::params::package_ensure,

)inherits ovirt_guest_agent::params {

  package { $package_name:
    ensure	  => $package_ensure,
  }

}
