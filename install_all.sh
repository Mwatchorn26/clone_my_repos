#! /bin/bash

if [ -z "$1" ]
then
  echo "Missing argument: Database name to install the modules in is missing."
  echo "Usage call ./install_all.sh name_of_db"
else
  echo "Installing TEI Custom modules..."
  echo "Update Module List..."
  
  if [ -d /opt/odoo/addons/ ]; then
    #PROD and TEST servers:
    CUSTOM_ADDONS_PATH="/opt/odoo/addons/custom"
  else #Dev server install:
    CUSTOM_ADDONS_PATH="/opt/odoo/custom/addons"
  fi
  
  addons=$CUSTOM_ADDONS_PATH
  addons=$addons,$CUSTOM_ADDONS_PATH/Akretion/odoo-usability          #module: base_usability (display partner.title)
  addons=$addons,$CUSTOM_ADDONS_PATH/Elghard/Odoo-App                 #module: web_list_view_sticky
  addons=$addons,$CUSTOM_ADDONS_PATH/thinkopensolutions/tkobr-addons  #module: tko_hide_login_manage_databases_link 
                                                                      #module: tko_mail_smtp_per_user
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/l10n-canada
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/manufacture                  #module: mrp_bom_product_details (This module adds product price and stock to bom view)
                                                                      #module: mrp_bom_version (may work for versioning! Needs Testing!!!)
                                                                      #module: mrp_production_estimated_cost
                                                                      #module: mrp_production_real_cost (maybe, need testing)
                                                                      
                                                                      
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/server-tools                 #module: mass_editing
                                                                      #module: auth_brute_force
                                                                      #module: cron_run_manually
                                                                      #module: database_cleanup (for DEV only)
                                                                      #module: disable_openerp_online
                                                                      #module: module_prototyper (for DEV only)
                                                                      #module: scheduler_error_mailer
                                                                      #module: shell (for DEV only)
                                                                      
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/account-analytic             #module:
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/project
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/hr-timesheet
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/sale-financial
  addons=$addons,$CUSTOM_ADDONS_PATH/OCA/partner-contact
  addons=$addons,$CUSTOM_ADDONS_PATH/dreispt/odoo-addons
  
  
  python /opt/odoo/odoo-server/odoo.py -d $1 --stop-after-init --addons-path $CUSTOM_ADDONS_PATH/,$CUSTOM_ADDONS_PATH/OCA/partner-contact,$CUSTOM_ADDONS_PATH -u all
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
