#! /bin/bash

if [ -z "$1" ]
then
  echo "Missing argument: Database name to install the modules in is missing."
  echo "Usage call ./install_all.sh name_of_db"
else
  echo "Installing TEI Custom modules..."
  echo "Update Module List..."
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/odoo-server/addons/ -u all
  echo "Install custom modules..."
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/odoo-server/addons/ -i \
  project_issue_service,project_serial_numbers,crm_eto,Odoo-App/web_list_view_sticky,l10n-canada/l10n_ca_toponyms
  #,mrp_shopfloor_terminal
  #auth_ldap_rewrite
  printf "\n\n************** DONE **************\n"
fi
