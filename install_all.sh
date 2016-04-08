#! /bin/bash

if [ -z "$1" ]
then
  echo "Missing argument: Database name to install the modules in is missing."
  echo "Usage call ./install_all.sh name_of_db"
else
  echo "Installing TEI Custom modules..."
  echo "Update Module List..."
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/custom/addons/OCA/,/opt/odoo/odoo-server/addons/ -u all
  echo "Install custom modules..."
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/custom/addons/OCA/,/opt/odoo/odoo-server/addons/ -i project_issue_service
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/custom/addons/OCA/,/opt/odoo/odoo-server/addons/ -i project_serial_numbers
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/custom/addons/OCA/,/opt/odoo/odoo-server/addons/ -i crm_eto
  mv /opt/odoo/custom/addons/Odoo-App/web_list_view_sticky /opt/odoo/custom/addons/web_list_view_sticky
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/custom/addons/OCA/,/opt/odoo/odoo-server/addons/ -i web_list_view_sticky
  mv /opt/odoo/custom/addons/l10n-canada/l10n_ca_toponyms /opt/odoo/custom/addons/l10n_ca_toponyms
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/custom/addons/OCA/,/opt/odoo/odoo-server/addons/ -i l10n_ca_toponyms
  
  #Uncomment these if going on a production server and you don't want users accessing the database manager:
  #mv /opt/odoo/custom/addons/tkobr-addons/tko_hide_login_manage_databases_link  /opt/odoo/custom/addons/tko_hide_login_manage_databases_link 
  #python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path /opt/odoo/custom/addons/,/opt/odoo/custom/addons/OCA/,/opt/odoo/odoo-server/addons/ -i tko_hide_login_manage_databases_link
  
  #,mrp_shopfloor_terminal
  #auth_ldap_rewrite
  printf "\n\n************** DONE **************\n"
fi
