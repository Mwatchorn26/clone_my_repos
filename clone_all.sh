#! /bin/bash

#install Bazaar, where some of the files still reside
#sudo apt-get install bzr

#switch to the Odoo user for the rest of the commands
#sudo su - odoo
if [ -d /opt/odoo/addons/ ]; then
  #PROD and TEST servers:
  if [ -d /opt/odoo/addons/custom ]; then
    echo "'custom'folder exists"
  else
    echo "creating custom folder"
    mkdir /opt/odoo/addons/custom
    cd /opt/odoo/addons/custom
  fi
else #Dev server install:
  cd /opt/odoo/custom/addons/
fi

echo "Cloning TEI Custom modules..."
git clone https://github.com/Mwatchorn26/auth_ldaps.git
git clone https://github.com/Mwatchorn26/mrp_shopfloor_terminal.git
git clone https://github.com/Mwatchorn26/project_issue_service.git
git clone https://github.com/Mwatchorn26/project_serial_numbers.git
git clone https://github.com/Mwatchorn26/crm_eto.git
git clone https://github.com/Mwatchorn26/sale_editable_tree_view.git
echo ""
echo "Cloning Additional Required modules..."
echo ""
echo "Cloning Web List View Fixed Table Header"
git clone -b 8.0 https://github.com/Elghard/Odoo-App
echo "Hide 'Login Manage Databases' Link"
git clone -b 8.0 https://github.com/thinkopensolutions/tkobr-addons.git
echo "Get Canadian Provinces"
git clone -b 8.0 https://github.com/OCA/l10n-canada.git

echo "NOW YOU NEED TO PRESS 'Update Modules List'"

exit

#These are other Modules of Interest:

#Employee Time Clock Web App
git clone -b 8.0 https://github.com/marcok/odoo_modules
bzr branch lp:~margin-analysis-core-editors/margin-analysis/7.0 #???
bzr branch lp:~julius-network-solutions/julius-openobject-addons/7.0 #mrp_partially_ready (You can start the production order even if you only have part of the components)
bzr branch lp:~openerp-community/openobject-addons/elico-7.0 #mrp_move_direct (Add or Cancel Raw Material in Manufacturing Orders)
                                                             #mrp_change_rm   (Add or Cancel the Raw Material moves in MO)
                                                             #cron_watcher    (Send notification when cron job has not run for X minutes)
bzr branch lp:~hr-core-editors/hr-timesheet/7.0              #timesheet_task  (replace task work items linked to task with timesheet lines.
