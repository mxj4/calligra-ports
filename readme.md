MacPorts Fork for Building Calligra Suite Installer on Mac OS X
===============================================================

Repo Structure
--------------

* ports dir contains the forked ports
* utils dir contains useful scripts for maintaining, building, and packaging those ports

Macports Configuration
----------------------

1. install MacPorts with ${prefix}=/opt/calligra
2. edit ${prefix}/etc/macports/macports.conf, set ${applications_dir} to "/Applications/Calligra\ Suite"
3. edit ${prefix}/etc/macports/variants.conf as "-x11 +no_x11 -gtk2 +no_gtk2 +minimal -gnome +no_gnome -gtk -docs +qt4 +quartz -universal"
4. edit ${prefix}/etc/macports/sources.conf, to set software source to the ports dir

Build Packages
--------------

1. run `build_pkg.sh calligra output_dir` to get pkg installers
3. [todo] generate distribution definition file "distribution.xml"
refer to this tutorial http://stackoverflow.com/questions/11487596/making-os-x-installer-packages-like-a-pro-xcode4-developer-id-mountain-lion-re
4. [todo] generate "Install Calligra Suite.pkg"
5. generate "Calligra Suite x.y.z.dmg" using disk utility
refer to this tutorial http://www.wikihow.com/Make-a-DMG-File-on-a-Mac

Notes
-----

* `port echo leaves` helps remove build dependencies
* perl and python actually provided by OSX, it's ok to remove these packages
