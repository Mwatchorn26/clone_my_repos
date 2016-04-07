#! /bin/bash
cd /opt/odoo/$2addons/
echo "Cloning TEI Custom modules..."
python /opt/odoo/$2odoo.py -d $1 -i "auth_ldaps, mrp_shopfloor_terminal, project_issue_service, project_serial_numbers, crm_eto, sale_editable_tree_view, web_list_view_sticky, l10n_ca_toponyms, tko_hide_login_manage_databases_link"
