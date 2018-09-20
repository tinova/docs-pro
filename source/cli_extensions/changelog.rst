Resolved Issues in 5.6.1
--------------------------------------------------------------------------------

The following features has been added in 5.6.1

- `Update Host hook triggers to include all possible states <https://github.com/OpenNebula/one/issues/2356>`__.
- `Add debug information to vCenter drivers (stacktrace) <https://github.com/OpenNebula/one/issues/2341>`__.
- `Revamp VM update dialog <https://github.com/OpenNebula/one/issues/2328>`__.
- `Cloud View Admin Panels revamp <https://github.com/OpenNebula/one/issues/2327>`__.
- `EC2 driver support for oneprovision <https://github.com/OpenNebula/one/issues/2291>`__.
- `Re-evaluate the actions that can be supported by a Virtual Router. <https://github.com/OpenNebula/one/issues/2260>`__.
- `New Quota - RUNNING_MEMORY <https://github.com/OpenNebula/one/issues/2228>`__.
- `Achieved a paginated view in all cli “list” operations. <https://github.com/OpenNebula/one/issues/2183>`__.
- `Option to append IP from caller in logs <https://github.com/OpenNebula/one/issues/2150>`__.
- `vCenter importer: Wilds integration  <https://github.com/OpenNebula/one/issues/2140>`__.
- `Support for addons on the CLI <https://github.com/OpenNebula/one/issues/2127>`__.
- `Keep BOOT state for managed VMs until the running state is confirmed <https://github.com/OpenNebula/one/issues/994>`__.

The following bugs has been solved in 5.6.1

- `SSH TM disk-saveas doesn't respect snapshot ID <https://github.com/OpenNebula/one/issues/2435>`__.
- `Ceph disk-saveas doesn't respect snapshot ID <https://github.com/OpenNebula/one/issues/2429>`__.
- `Unable to update the Running Memory quota <https://github.com/OpenNebula/one/issues/2428>`__.
- `OPENNEBULA_MANAGED deleted when updating a VM Template <https://github.com/OpenNebula/one/issues/2423>`__.
- `Errors with restricted attributes when instantiate a VM using Java API <https://github.com/OpenNebula/one/issues/2402>`__.
- `Onehost sync should ignore vCenter hosts <https://github.com/OpenNebula/one/issues/2398>`__.
- `Improve the dialog when attach nic or instanciated vm in network tab. <https://github.com/OpenNebula/one/issues/2394>`__.
- `Slow monitoring of the live migrating VMs on destination host <https://github.com/OpenNebula/one/issues/2388>`__.
- `Start script base64 enconding fails when using non utf8 characters <https://github.com/OpenNebula/one/issues/2384>`__.
- `Not checks restricted attributes when try to attach a new disk <https://github.com/OpenNebula/one/issues/2374>`__.
- `Syntax error in ldap_auth.rb <https://github.com/OpenNebula/one/issues/2372>`__.
- `Unable to query VMs with non ASCII characters <https://github.com/OpenNebula/one/issues/2355>`__.
- `"Error parsing JSON: Wrong resource type" error when creating a virtual network from Sunstone using advanced mode <https://github.com/OpenNebula/one/issues/2348>`__.
- `vCenter Cant Import templates with ISOS <https://github.com/OpenNebula/one/issues/2329>`__.
- `Quotas assignment error <https://github.com/OpenNebula/one/issues/2284>`__.
- `[vCenter] Remove CDROM from imported template  <https://github.com/OpenNebula/one/issues/2274>`__.
- `(vCenter) wait poweron/off to be performed <https://github.com/OpenNebula/one/issues/2262>`__.
- `spurios syntax help on onehost delete  <https://github.com/OpenNebula/one/issues/2254>`__.
- `vCenter driver migrate feedback (core) <https://github.com/OpenNebula/one/issues/2230>`__.
- `VNC on ESXi Can Break Firewall <https://github.com/OpenNebula/one/issues/1728>`__.
- `vCenter importer lock file stale and clash <https://github.com/OpenNebula/one/issues/1626>`__.
