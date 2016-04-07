#! /bin/bash

#install Bazaar, where some of the files still reside
sudo apt-get install bzr

#switch to the Odoo user for the rest of the commands
#sudo su - odoo
if [ -d /opt/odoo/addons/ ]; then
  cd /opt/odoo/addons/custom/
else
  cd /opt/odoo/custom/addons/
#  cd /opt/odoo/$2addons/
fi

pwd

exit
echo "Cloning TEI Custom modules..."
clone https://github.com/Mwatchorn26/auth_ldaps.git
clone https://github.com/Mwatchorn26/mrp_shopfloor_terminal.git
clone https://github.com/Mwatchorn26/project_issue_service.git
clone https://github.com/Mwatchorn26/project_serial_numbers.git
clone https://github.com/Mwatchorn26/crm_eto.git
clone https://github.com/Mwatchorn26/sale_editable_tree_view.git
echo ""
echo "Cloning Additional Required modules..."
echo ""
echo "Cloning Web List View Fixed Table Header"
clone https://github.com/Elghard/Odoo-App#8.0
echo "Hide 'Login Manage Databases' Link"
clone https://github.com/thinkopensolutions/tkobr-addons.git
echo "Get Canadian Provinces"
cone https://github.com/OCA/l10n-canada.git#8.0

echo "NOW YOU NEED TO PRESS 'Update Modules List'"

exit

#These are other Modules of Interest:

#Employee Time Clock Web App
clone https://github.com/marcok/odoo_modules#8.0
bzr branch lp:~margin-analysis-core-editors/margin-analysis/7.0 #???
bzr branch lp:~julius-network-solutions/julius-openobject-addons/7.0 #mrp_partially_ready (You can start the production order even if you only have part of the components)
bzr branch lp:~openerp-community/openobject-addons/elico-7.0 #mrp_move_direct (Add or Cancel Raw Material in Manufacturing Orders)
                                                             #mrp_change_rm   (Add or Cancel the Raw Material moves in MO)
                                                             #cron_watcher    (Send notification when cron job has not run for X minutes)
bzr branch lp:~hr-core-editors/hr-timesheet/7.0              #timesheet_task  (replace task work items linked to task with timesheet lines.

