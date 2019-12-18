.. _install:

============
Installation
============

Distribution of the OneScape is via the operating system packages for the :ref:`supported platforms <platform>`. First, you need to configure your machine to have access to dedicated authenticated customer repositories, then you can install or update OneScape packages.

Setup Repository
================

Access to the repositories is authenticated by the customer's user name and token. Repository definitions below contain the placeholders ``${AUTH}`` where customer's credentials should be put. To simplify the process and to avoid dealing with the repository configurations manually, export your credentials following way before running the next commands.

.. prompt:: bash # auto

    # export AUTH='user:token'

CentOS and RHEL
---------------

To add OneScape repository execute the following as root:

**CentOS/RHEL 7**

.. prompt:: bash # auto

    # cat << EOT > /etc/yum.repos.d/onescape.repo
    [onescape]
    name=onescape
    baseurl=https://${AUTH}@downloads.opennebula.systems/onescape/repo/latest/CentOS/7/\$basearch
    enabled=1
    gpgkey=https://downloads.opennebula.org/repo/repo.key
    gpgcheck=1
    repo_gpgcheck=1
    EOT

**CentOS/RHEL 8**

.. prompt:: bash # auto

    # cat << EOT > /etc/yum.repos.d/onescape.repo
    [onescape]
    name=onescape
    baseurl=https://${AUTH}@downloads.opennebula.systems/onescape/repo/latest/CentOS/8/\$basearch
    enabled=1
    gpgkey=https://downloads.opennebula.org/repo/repo.key
    gpgcheck=1
    repo_gpgcheck=1
    EOT

Debian and Ubuntu
-----------------

To add OneScape repository on Debian/Ubuntu execute as root:

.. prompt:: bash # auto

    # wget -q -O- https://downloads.opennebula.org/repo/repo.key | apt-key add -

**Debian 9**

.. prompt:: bash # auto

    # echo "deb https://${AUTH}@downloads.opennebula.systems/onescape/repo/latest/Debian/9 stable onescape" > /etc/apt/sources.list.d/onescape.list

**Debian 10**

.. prompt:: bash # auto

    # echo "deb https://${AUTH}@downloads.opennebula.systems/onescape/repo/latest/Debian/10 stable onescape" > /etc/apt/sources.list.d/onescape.list

**Ubuntu 16.04**

.. prompt:: bash # auto

    # echo "deb https://${AUTH}@downloads.opennebula.systems/onescape/repo/latest/Ubuntu/16.04 stable onescape" > /etc/apt/sources.list.d/onescape.list

**Ubuntu 18.04**

.. prompt:: bash # auto

    # echo "deb https://${AUTH}@downloads.opennebula.systems/onescape/repo/latest/Ubuntu/18.04 stable onescape" > /etc/apt/sources.list.d/onescape.list

Install
=======

To install OneScape, execute one of the following commands below based on your operating system.

CentOS and RHEL
---------------

.. prompt:: bash $ auto

   $ sudo yum install onescape

Debian and Ubuntu
-----------------

.. prompt:: bash $ auto

   $ sudo apt-get install onescape

Update (existing installation)
==============================

To update existing OneScape installation, execute one of the following commands below based on your operating system.

CentOS and RHEL
---------------

.. prompt:: bash $ auto

   $ sudo yum update onescape

Debian and Ubuntu
-----------------

.. prompt:: bash $ auto

   $ sudo apt-get install onescape
