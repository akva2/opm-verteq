OPM-verteq jenkins build scripts:
--------------------------------

[B]build-opm-verteq.sh[/B]:
This is a helper script which contains functions for building,
testing and cloning opm-verteq and its dependencies.

[B]build.sh[/B]:
This script will build dependencies, then build opm-verteq and execute its tests.
It is intended for post-merge builds of the master branch.

[B]build-pr.sh[/B]:
This script will build dependencies, then build opm-verteq and execute its tests.
It inspects the $ghbPrBuildComment environmental variable to obtain a pull request
to use for opm-common, opm-parser, opm-material and opm-core (defaults to master) and then builds $sha1 of opm-verteq.

It is intended for pre-merge builds of pull requests.

You can optionally specify a given pull request to use for opm-common, opm-parser, opm-material and opm-core through the trigger.
The trigger line needs to contain opm-common=<pull request number> and/or opm-parser=<pull request number> 
and/or opm-material=<pull request number> and/or opm-core=<pull request number>
