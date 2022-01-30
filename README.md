# PwnKit Scanner

Check CVE-2021-4034 vulnerability

This test is not 100% reliable, but it helps with a quick scan.

## How to use (Linux Debian based systems):

	wget https://raw.githubusercontent.com/codiobert/pwnkit-scanner/main/pwnkit-scanner-debian.sh -q -O - |bash

## How to use (Linux Red Hat based systems):

	wget https://raw.githubusercontent.com/codiobert/pwnkit-scanner/main/pwnkit-scanner-redhat.sh -q -O - |bash


## Linux Distributions Affected
### Linux Distributions Affected By The Polkit Privilege Escalation Vulnerability (CVE-2021-4034)
The flaw is successfully tested on Ubuntu, Debian, Fedora, and CentOS with default configuration. Since Polkit is part of the default installation package in most of the Linux distributions and all Polkit versions from 2009 onwards are vulnerable., the whole Linux platform is considered vulnerable to the Polkit privilege escalation vulnerability.

## Patch vulnerability
If your operating system is vulnerable you should obtain and apply a patch as quickly as possible from your Linux distributor.
If no patches are available for your operating system, you can remove the SUID-bit from pkexec as a temporary mitigation:

	# chmod 0755 /usr/bin/pkexec
