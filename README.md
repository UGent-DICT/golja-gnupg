# GnuPG puppet module

[![Build Status](https://travis-ci.com/UGent-DICT/golja-gnupg.svg?branch=master)](https://travis-ci.com/UGent-DICT/golja-gnupg)

#### Table of Contents

1. [Overview](##overview)
2. [Installation](##Installation)
3. [Usage - Configuration options and additional functionality](@#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](##reference)
5. [Limitations - OS compatibility, etc.](##limitations)
6. [Development - Guide for contributing to the module](##development)
7. [License](##license)

## Overview

Install GnuPG on Ubuntu/Debian/RedHat/CentOS/Amazon AMI and manage users public keys.

Tested with Tavis CI

NOTE: For puppet 2.7.x supported module please use version 0.X.X

[![Build Status](https://travis-ci.org/n1tr0g/golja-gnupg.png)](https://travis-ci.org/n1tr0g/golja-gnupg) [![Puppet Forge](http://img.shields.io/puppetforge/v/golja/gnupg.svg)](https://forge.puppetlabs.com/golja/gnupg)

## Installation

     $ puppet module install golja/gnupg

## Usage

#### Install GnuPG package

    include '::gnupg'

#### Add public key 20BC0A86 from PGP server from hkp://pgp.mit.edu/ to user root

```puppet
gnupg_key { 'hkp_server_20BC0A86':
  ensure     => present,
  key_id     => '20BC0A86',
  user       => 'root',
  key_server => 'hkp://pgp.mit.edu/',
  key_type   => public,
}
```

#### Add public key D50582E6 from standard http URI to user foo

```puppet
gnupg_key { 'jenkins_foo_key':
  ensure     => present,
  key_id     => 'D50582E6',
  user       => 'foo',
  key_source => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key',
  key_type   => public,
}
```

#### Add public key D50582E6 from puppet fileserver to user foo

```puppet
gnupg_key { 'jenkins_foo_key':
  ensure     => present,
  key_id     => 'D50582E6',
  user       => 'foo',
  key_source => 'puppet:///modules/gnupg/D50582E6.key',
  key_type   => public,
}
```

#### Add public key D50582E6 from puppet fileserver to user bar via a string value

```puppet
gnupg_key { 'jenkins_foo_key':
  ensure      => present,
  key_id      => 'D50582E6',
  user        => 'bar',
  key_content => '-----BEGIN BROKEN PUBLIC KEY BLOCK-----...',
  key_type    => public,
}
```
*Note*: You should use hiera lookup to get the key content

#### Remove public key 20BC0A86 from user root

```puppet
gnupg_key {'root_remove':
  ensure   => absent,
  key_id   => '20BC0A86',
  user     => 'root',
  key_type => public,
}
```

### Remove both private and public key 20BC0A66

```puppet
gnupg_key {'root_remove':
  ensure   => absent,
  key_id   => '20BC0A66',
  user     => 'root',
  key_type => both,
}
```

## Reference

See the [REFERENCE](REFERENCE.md)

### Tests

There are two types of tests distributed with the module. Unit tests with rspec-puppet and acceptance tests using puppet_litmus.

For unit testing, make sure you have:

* rake
* bundler

Install the necessary gems:

    bundle config set --local path 'vendor'
    bundle install

And then run the unit tests:

    bundle exec rake spec

If you want to run the system tests, make sure you also have:

* docker (default set)
* vagrant

Then run the tests using the default nodeset and puppet7:

    bundle exec rake 'litmus:provision_list[default]'
    bundle exec rake 'litmus:install_agent[puppet7]'
    bundle exec rake litmus:install_module

    bundle exec rake litmus:acceptance:parallel

Check the `provision.yaml` file for other sets you can use.

## Limitations

This module has been tested on:

* Debian 8/9/10
* Ubuntu 14+
* RedHat 6/7/8
* CentOS 6/7/8

Note: For an up-to-date list, please check the acceptance tests.

## Development

Please see CONTRIBUTING.md

## License

See LICENSE file

