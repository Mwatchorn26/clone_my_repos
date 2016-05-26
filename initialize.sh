#! /bin/bash
echo "Run in interactive mode?(y/n)"
read interactive
if [ interactive="y" ] 
then
  set -x
  trap read debug
else
  echo ""
  echo "Proceeding with without further interaction."
  sleep 1
fi
#install Bazaar, where some of the files still reside
#Bazaar should already be installed by the odoo install script.
#sudo apt-get install bzr

#switch to the Odoo user for the rest of the commands
#if [ $USER -eq "odoo" ] 
printf "\n\nSwitching to user: odoo.\n\nPlease enter your password."
#sudo su - odoo -s /bin/bash
su -c "clone_all.sh" -m "odoo" 
#fi

if [ interactive="y" ] 
then
  su -c "./clone_all.sh interactive" -m "odoo" 
else
  echo "Proceeding with without further interaction."
  sleep 1
  su -c "./clone_all.sh" -m "odoo" 
fi


exit
