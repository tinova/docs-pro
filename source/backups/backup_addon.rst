.. _backup_addon:

================================================================================
Turnkey Linux Images Marketplace
================================================================================

Overview
================================================================================

This addon enables users to easily create backups for their Virtual Machine's virtual disks and store them inside a marketplace.

Usage
================================================================================

Taking a backup
----------------

To use this marketplace, you need to install first **OpenNebula Backups Addon**, see: :ref:`addon_backup_install_guide`. Next, a marketplace for the backups must be created. An HTTP marketplace is recommended. You can follow `the official documentation <http://docs.opennebula.org/5.8/advanced_components/marketplace/market_http.html#http-marketplace>`_. 

Restoring a backup
-------------------

Once a backup has been made, a new appliance on the selected marketplace will appear. This appliance consists only on the saved virtual disk. To restore it, it will only need to be downloaded to any datastore. After, it can be used on any template, by creating a new one, replacing a virtual disk on an existing template, or adding the virtual disk to an existing template.

