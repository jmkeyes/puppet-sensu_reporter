# Puppet Sensu Reporter Module

[![Puppet Forge](http://img.shields.io/puppetforge/v/jmkeyes/sensu_reporter.svg)](https://forge.puppetlabs.com/jmkeyes/sensu_reporter)
[![Build Status](https://travis-ci.org/jmkeyes/puppet-sensu_reporter.svg?branch=master)](https://travis-ci.org/jmkeyes/puppet-sensu_reporter)

#### Table of Contents

 1. [Overview](#overview)
 2. [Example](#example)
 3. [Todo](#todo)

## Overview

Send Puppet reports to a local Sensu client.

## Example

 1. Set `reports` in `puppet.conf` to include `sensu`.
 2. Ensure a Sensu client is running, then run Puppet.
 3. Receive vague message about success/failure in Sensu.

### Todo

 + All the things. Patches Welcome™.

