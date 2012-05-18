#!/bin/sh
#
# Creates a clone of the SilverStripe CMS with the core components
#
if [ $# -eq 0 ]
then
	echo "CreateProject SilverStripe 3.0 V1.0"
	echo ""
	echo "Use this script to clone a SilverStripe project and switches to branch 3.0."
	echo ""
	echo "usage: createproject_3.0.sh projectname"
	echo ""	
	echo "The script creates a folder-structure and the creates the main project"
	echo "folder on your filesystem. Use projectname to define the project folder"
	echo "name."
	echo ""	
	echo "$0 : You must give/supply the project name"
	exit 1
fi

if [ -d "$1" ]; then
	echo "Project creation failed!"
	echo "------------------------"
	echo "The directoy already exists."
	echo "Please chose a different project name."
	exit 1;
fi

echo ""
echo "Create Project $1"
echo ""

numsteps=5
step=1

echo ""
echo " ($step/$numsteps) Deploy SilverStripe installer to $1"
echo ""
step=$(($step+1))
git clone git://github.com/silverstripe/silverstripe-installer.git $1

echo ""
echo " ($step/$numsteps) Deploy SilverStripe Framework to $1/framework"
echo ""
step=$(($step+1))
(cd $1; git clone git://github.com/silverstripe/sapphire.git framework)

echo ""
echo " ($step/$numsteps) Deploy SilverStripe CMS to $1/cms"
echo ""
step=$(($step+1))
(cd $1; git clone git://github.com/silverstripe/silverstripe-cms.git cms)

echo ""
echo " ($step/$numsteps) Deploy SilverStripe blackcandy theme to $1/themes"
echo ""
step=$(($step+1))
(cd $1; rm -rf themes; git clone git://github.com/silverstripe-themes/silverstripe-blackcandy.git themes)

echo ""
echo " ($step/$numsteps) Deploy SilverStripe PostgreSQL module to $1/postgresql"
echo ""
step=$(($step+1))
(cd $1; git clone https://github.com/silverstripe/silverstripe-postgresql.git postgresql)

echo "Deployment done."
echo ""
echo "Next Steps to do:"
echo ""
echo "(1) Copy the _sample_config.php file into the mysite folder of your project if you"
echo "like to use PostgreSQL."
echo ""
echo "(2) Please copy the _sample_ss_environment.php file into the document root folder"
echo "and alter the configuration changes (database related) as required.)"
echo ""
echo "(3) delete the install.php file in the project folder."
echo ""


# silverstripe-googlesitemaps
# silverstripe-googleanalytics
# silverstripe-geoviewer
# silverstripe-geocatalogue
# silverstripe-commandpattern
# silverstripe-sqlite3
# silverstripe-newsletter
