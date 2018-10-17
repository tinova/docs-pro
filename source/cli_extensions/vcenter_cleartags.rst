.. _onezone_serversync:

================================================================================
onevcenter cleartags 
================================================================================

Overview
================================================================================

This command is designed to remove every OpenNebula's custom attribute on a VMware Virtual Machine. When OpenNebula imports a VMware's VM, it adds some attributes. In some operations, like re-importing a VM to OpenNebula, there might be a conflict and errors could appear. These are the attributes that will be removed:

* opennebula.vm.running
* opennebula.vm.id
* opennebula.disk.*

Usage
================================================================================

A use case example for this addon is for re-importing a VMware VM to OpenNebula. The workflow in such scenario would be like this:

* Use onevcenter cleartags on the VM that will be removed:

.. prompt:: bash $ auto

    $ onevcenter cleartags <vmid>

**vmid** is the id of the VM whose attributes will be cleared.

* Un-register VM
.. prompt:: bash $ auto

    $ onevm recover --delete-db <vmid>
* Re-import VM: on the next host's monitoring cycle you will find this VM under **Wilds** tab, and it can be safely imported.




