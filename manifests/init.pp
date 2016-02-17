# Class: ovirt_guest_agent
# ===========================
#
# This is the main class for ovirt-guest-agent puppet module.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ovirt_guest_agent':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Rene Koch <rkoch@rk-it.at>
#
# Copyright
# ---------
#
# Copyright 2016 Rene Koch
#

class ovirt_guest_agent (

  $service_name    = $ovirt_guest_agent::params::service_name,
  $service_ensure  = $ovirt_guest_agent::params::service_ensure,
  $service_enabled = $ovirt_guest_agent::params::service_enable,
  $package_name    = $ovirt_guest_agent::params::package_name,
  $package_ensure  = $ovirt_guest_agent::params::package_ensure

)inherits ovirt_guest_agent::params {

  validate_string($service_name)
  validate_string($service_ensure)
  validate_bool($service_enabled)
  validate_string($package_name)
  validate_string($package_ensure)

  if $::manufacturer == 'oVirt' {
    anchor { 'ovirt_guest_agent::begin': } ->
    class { '::ovirt_guest_agent::package': } ->
    class { '::ovirt_guest_agent::service': } ->
    anchor { 'ovirt_guest_agent::end': }
  }else{
    notice ('This system doesn\'t seem to run on oVirt - skipping installation')
  }
  
}
