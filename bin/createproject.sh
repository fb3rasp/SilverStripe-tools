#!/bin/bash
echo $1

if [ -z "$1" ]
then
	echo "CreateProject V1.0"
	echo ""
	echo "Use this script to clone a SilverStripe project and switches to branch 2.4."
	echo ""
	echo "usage: createproject.sh projectname"
	echo ""	
	echo "The script creates a folder-structure and the creates the main project"
	echo "folder on your filesystem. Use projectname to define the project folder"
	echo "name."
	echo ""	
	exit 
fi
	
projectname=geovitest
echo "Setup SilverStripe project: "$projectname

echo "Clone core modules (read-only)"
git clone git://github.com/silverstripe/silverstripe-installer.git $projectname
git clone git://github.com/silverstripe/silverstripe-cms.git $projectname/cms
git clone git://github.com/silverstripe/sapphire.git $projectname/sapphire

echo "Delete default theme and replace is with blackcandy"
rm -rf $projectname/themes/
git clone git://github.com/silverstripe-themes/silverstripe-blackcandy.git $projectname/themes/

echo "Switch core branches to branch 2.4"
(cd $projectname;git checkout origin/2.4)
(cd $projectname/cms;git checkout origin/2.4)
(cd $projectname/sapphire;git checkout origin/2.4)
(cd $projectname/themes;git checkout origin/2.4)

echo "Clone SilverStripe ODI geoViewer module"
(cd $projectname/;git clone git@github.com:silverstripe-labs/silverstripe-commandpattern.git commends)
(cd $projectname/;git clone git@github.com:silverstripe-labs/silverstripe-geoviewer.git geoviewer)

echo "Project $projectname has been checked out"
echo ""