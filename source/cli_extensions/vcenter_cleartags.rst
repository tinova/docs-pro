.. _onezone_serversync:

================================================================================
OneVcenter Cleartags 
================================================================================

Overview
================================================================================

This command is designed to remove some VMWare Virtual Machine attributes that will conflict with some operations (like re-importing a VM).
These are the attributes that will be removed:
-opennebula.vm.running
-opennebula.vm.id
-opennebula.disk.*

This addon needs to be used from your OpenNebula server. It expects to have an OpenNebula service listening on your localhost and credentials will be taken from ***/var/lib/one/.one/one_auth***.

Usage
================================================================================

.. prompt:: bash $ auto

    $ onevcenter cleartags <vmid>

**vmid** is the id of the VM whose attributes will be cleared.



