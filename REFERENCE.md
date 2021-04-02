# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`gnupg`](#gnupg): == Class: gnupg  Manage gnupg and public key entries  === Parameters  [*package_ensure*]   Remove or install the s3tools package. Possible va
* [`gnupg::install`](#gnupginstall)
* [`gnupg::params`](#gnupgparams): PRIVATE CLASS: do not use directly

### Resource types

* [`gnupg_key`](#gnupg_key): Manage PGP public keys with GnuPG

## Classes

### <a name="gnupg"></a>`gnupg`

== Class: gnupg

Manage gnupg and public key entries

=== Parameters

[*package_ensure*]
  Remove or install the s3tools package. Possible values
  present or absent, however most of modern Linux distros relays on
  gnupg so you shouldn't remove the package

[*package_name*]
  name of the package usually gnupg/gnupg2 depends of the distro

=== Examples

 include gnupg

=== Authors

Dejan Golja <dejan@golja.org>

#### Parameters

The following parameters are available in the `gnupg` class:

* [`package_ensure`](#package_ensure)
* [`package_name`](#package_name)

##### <a name="package_ensure"></a>`package_ensure`

Data type: `Any`



Default value: `$gnupg::params::package_ensure`

##### <a name="package_name"></a>`package_name`

Data type: `Any`



Default value: `$gnupg::params::package_name`

### <a name="gnupginstall"></a>`gnupg::install`

The gnupg::install class.

### <a name="gnupgparams"></a>`gnupg::params`

PRIVATE CLASS: do not use directly

## Resource types

### <a name="gnupg_key"></a>`gnupg_key`

Manage PGP public keys with GnuPG

#### Properties

The following properties are available in the `gnupg_key` type.

##### `ensure`

Valid values: `present`, `absent`

The basic property that the resource should be in.

Default value: `present`

#### Parameters

The following parameters are available in the `gnupg_key` type.

* [`gnupg_home`](#gnupg_home)
* [`key_content`](#key_content)
* [`key_id`](#key_id)
* [`key_server`](#key_server)
* [`key_source`](#key_source)
* [`key_type`](#key_type)
* [`name`](#name)
* [`provider`](#provider)
* [`proxy`](#proxy)
* [`user`](#user)

##### <a name="gnupg_home"></a>`gnupg_home`

The gnupg home directory. Overrides the default user's homedir.

Default value: ``false``

##### <a name="key_content"></a>`key_content`

Key content. The result of exporting the key using ASCII armor.
Can be either a public or private key.

##### <a name="key_id"></a>`key_id`

Key ID. Usually the traditional 8-character key ID. Also accepted the
long more accurate (but  less  convenient) 16-character key ID.

##### <a name="key_server"></a>`key_server`

PGP key server from where to retrieve the public key

##### <a name="key_source"></a>`key_source`

A source file containing PGP key. Values can be URIs pointing to remote files,
or fully qualified paths to files available on the local system.

The available URI schemes are *puppet*, *https*, *http* and *file*. *Puppet*
URIs will retrieve files from Puppet's built-in file server, and are
usually formatted as:

`puppet:///modules/name_of_module/filename`

##### <a name="key_type"></a>`key_type`

Valid values: `public`, `private`, `both`

The type of the key(s) being managed.

Default value: `public`

##### <a name="name"></a>`name`

namevar

This attribute is currently used as a
system-wide primary key - namevar and therefore has to be unique.

##### <a name="provider"></a>`provider`

The specific backend to use for this `gnupg_key` resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.

##### <a name="proxy"></a>`proxy`

Set the proxy to use for HTTP and HKP keyservers.

##### <a name="user"></a>`user`

The user account in which the PGP public key should be installed.
Usually it's stored in HOME/.gnupg/ dir
