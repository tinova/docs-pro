.. _onezone_serversync:

================================================================================
OneZone ServerSync extension
================================================================================

This addon is designed to help administrators to sync OpenNebula's configurations across different federated and High Availability zones. It will first check for inconsistencies between local and remote configuration files inside **/etc/one/** directory. In case they exist, the local version will be replaced by the remote version and only the affected service will be restarted. Whole configuration files will be replaced with the only exception of **/etc/one/oned.conf**. In this case, the local **FEDERATION** configuration will be maintained, but the rest of the content will be overwritten. A backup will be made inside **/etc/one/** before replacing any file.

This script can also be used to replace your local database with a remote version. Useful if your HA node ----- was left behind.

This is the list of files that will be checked and replaced:

* Individual files:

    * /etc/one/az_driver.conf
    * /etc/one/az_driver.default
    * /etc/one/ec2_driver.conf
    * /etc/one/ec2_driver.default
    * /etc/one/econe.conf
    * /etc/one/oneflow-server.conf
    * /etc/one/onegate-server.conf
    * /etc/one/sched.conf
    * /etc/one/sunstone-logos.yaml
    * /etc/one/sunstone-serer.conf
    * /etc/one/vcenter_driver.default

* Folders:

    * /etc/one/sunstone-views
    * /etc/one/auth
    * /etc/one/ec2query_templates
    * /etc/one/hm
    * /etc/one/sunstone-views
    * /etc/one/vmm_exec

.. note::
    Any file inside previous folders that doesn't exist on the remote server (like backups) will **not** be removed.


Usage
================================================================================

.. prompt:: bash $ auto

    $ onezone serversync <remote_opennebula_server> [--db]

**remote_opennebula_server** is the server that will be used to fetch configuration files from.

If **--db** option is used, local database will be synced with the one located on **remote_opennebula_server**.



