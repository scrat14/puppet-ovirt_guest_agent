# ovirt_guest_agent

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ovirt_guest_agent](#setup)
    * [What ovirt_guest_agent affects](#what-ovirt_guest_agent-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ovirt_guest_agent](#beginning-with-ovirt_guest_agent)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs and configure ovirt-guest-agent.

## Module Description

ovirt-guest-agent is a daemon that resides within guest virtual machines and is 
required to supply information to the Virtualization Manager (such as oVirt-engine
or Red Hat Enterprise Virtualization Manager) that is required to properly manage
the virtual machines. 

This module installs ovirt-guest-agent-common (or rhevm-guest-agent-common), enables
and starts the ovirt-guest-agent daemon.

## Setup

### What ovirt_guest_agent affects

* Packages
    * ovirt-guest-agent-common
    * qemu-guest-agent
* Files
    * /etc/ovirt-guest-agent.conf
* Services
    * ovirt-guest-agent daemon

### Setup Requirements

This module doesn't enable (possibly) repositories due to the following reasons:
* Required repository may be already enabled (e.g. EPEL)
* Repositories aren't handled by yum directly (e.g. when using Red Hat Satellite,
Spacewalk, Katello,...)
* There are plenty of modules available for enabling repositories

The following repositories are required:
* CentOS 6/7:
    * EPEL (https://fedoraproject.org/wiki/EPEL)
* Red Hat Enterprise Linux 6/7 (ovirt-guest-agent):
    * EPEL (https://fedoraproject.org/wiki/EPEL)
* Red Hat Enterprise Linux 6 (rhevm-guest-agent):
    * rhel-6-server-rhev-agent-rpms (subscription-manager) or
    * rhel-x86_64-rhev-agent-6-server (RHN classic)
* Red Hat Enterprise Linux 7 (rhevm-guest-agent):
    * rhel-7-server-rh-common-rpms (subscription-manager)

### Beginning with ovirt_guest_agent

Install ovirt-guest-agent with default configuration file:

    class {'::ovirt_guest_agent': }

## Usage

Install rhevm-guest-agent with default configuration file:

    class {'::ovirt_guest_agent':
      service_name => 'rhevm-guest-agent'
      package_name => 'rhevm-guest-agent-common'
    }

## Reference

## Limitations

See operatingsystem_support.

## Development

Fork this module on Github and send a pull request.


