#
# class: params
#
# This puppet class sets default values to configure ovirt-guest-agent.
# All values can be overriden if required.
#

class ovirt_guest_agent::params {

  # default values: running and enabled
  $package_ensure  = 'installed'
  $service_ensure  = 'running'
  $service_enabled = true
  
  # package and service names may vary on different operating systems
  $os = $::operatingsystem
  
  case $os {
    'Redhat', 'CentOS', 'Scientific': {
      $service_name = 'ovirt-guest-agent'
      $package_name = 'ovirt-guest-agent-common'
    }
    default: {
      fail("Unsupported guest operating system: ${os}")
    }
  }

}