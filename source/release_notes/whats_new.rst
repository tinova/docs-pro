==================
What's New in 5.10
==================

OneScape 5.10 is the very first release of the component and focuses on improving the OpenNebula **upgrade experience of the configuration files**.

Configuration Module
====================

OpenNebula upgrade process was always recognized as much easier when compared to similar products. Software components are upgraded by standard operating system package managers (``yum`` or ``apt``), and the cloud state is easily migrated by OpenNebula database management tool (``onedb``). The only step which required special attention and expertise was the migration of custom changes in the configuration files to the new version. Responsible Cloud Infrastructure Administrator had to keep track of custom changes (or be able to identify them) and correctly migrate them to the new version of configuration files. From all the required upgrade steps, the migration of changes in configuration files was the most unpopular one as it was heavily (and usually) manual process.

OneScape introduces the new command-line tool ``onecfg`` for the **automatic upgrade of configuration files** for new OpenNebula versions while preserving the customizations. Supported upgrade paths are from OpenNebula 5.4.x, 5.6.x or 5.8.x directly to 5.10.2 (or newer).

Read more in the :ref:`Configuration Module <mod_config>`.

Support Module
==============

Tools to easily generate support diagnostic bundles for the support cases are part of a new :ref:`Support Module <mod_support>`.
