#ChimbaBench
#Copyright (C) 2023 Chimbal
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.
extends Spatial

const root = "/root/ChimbaBench";
const node_gui = root + "/GUI";
const node_main_controls = root + "/GUI/Main_Controls";
const node_system_info = root + "/GUI/System_Info";
const node_settings = root + "/GUI/Settings";
const node_font_test = root + "/GUI/Font_Test";
const node_about = root + "/GUI/About";
const node_message = root + "/GUI/Message";

var chi_executable_dir = OS.get_executable_path().get_base_dir();
var chi_OS = OS.get_name();

var chi_keys = { "shift": 0 };

var chi_nodes = {
	"node_gui" : node_gui,
	"node_main_controls" : node_main_controls,
	"node_system_info" : node_system_info,
	"node_settings" : node_settings,
	"node_font_test" : node_font_test,
	"node_about" : node_about,
	"node_message" : node_message
	};

var chi_backgrounds = {
	"bg_system_info" : node_system_info + "/Background",
	"bg_settings" : node_settings + "/Background",
	"bg_font_test" : node_font_test + "/Background",
	"bg_about" : node_about + "/Background",
	"bg_message" : node_message + "/Background",
	};

var chi_sel = {
	"sel_settings_msaa" : node_settings + "/SEL_MSAA",
	"sel_settings_aniso" : node_settings + "/SEL_Aniso",
	"sel_settings_resolution" : node_settings + "/SEL_resolution",
	};

var chi_labels = {
	"sysi_text_portable" : node_system_info + "/Lin/Portable",
	"sysi_text_system" : node_system_info + "/Lin/System",
	"lang_langs_main" : node_font_test + "/Langs_Main",
	"lang_font_current" : node_font_test + "/Font_Current",
	"message_capt" : node_message + "/CAPT",
	};

var chi_btn_gui = {
	"btn_main_settings" : node_main_controls + "/BTN_Settings",
	"btn_main_langtest" : node_main_controls + "/BTN_Font_Test",
	"btn_main_about" : node_main_controls + "/BTN_About",
	"btn_main_system_info" : node_main_controls + "/BTN_System_Info",
	"btn_main_sbox" : node_main_controls + "/BTN_SBox",
	"btn_main_gpu_heavy" : node_main_controls + "/BTN_GPU_Heavy",
	"btn_main_exit" : node_main_controls + "/BTN_Exit",
	"lbl_btn_main_menu" : node_main_controls + "/LBL_BTN_Main_Menu",
	"lbl_btn_tests" : node_main_controls + "/LBL_BTN_Tests",
	"lbl_btn_other" : node_main_controls + "/LBL_BTN_Other",
	"btn_settings_close" : node_settings + "/BTN_Close",
	"btn_settings_save" : node_settings + "/BTN_Save",
	"btn_sysi_close" : node_system_info +"/BTN_Close",
	"btn_sysi_win_wmi" : node_system_info + "/Win/BTN_Win_WMI",
	"btn_sysi_win_sys" : node_system_info + "/Win/BTN_Sys_Info",
	"btn_sysi_win_drv" : node_system_info + "/Win/BTN_Drv_Query",
	"btn_sysi_Lin_neo" : node_system_info + "/Lin/BTN_NeoFetch",
	"btn_sysi_Lin_dmi" : node_system_info + "/Lin/BTN_dmidecode35",
	"btn_sysi_Lin_dmi_bios" : node_system_info + "/Lin/BTN_biosdecode35",
	"btn_sysi_Lin_dmi_vpd" : node_system_info + "/Lin/BTN_vpddecode35",
	"btn_sysi_Lin_lscpu" : node_system_info + "/Lin/BTN_lscpu",
	"btn_sysi_Lin_proc_cpu" : node_system_info + "/Lin/BTN_proc_cpu",
	"btn_sysi_Lin_lsusb" : node_system_info + "/Lin/BTN_lsusb",
	"btn_sysi_Lin_lspci" : node_system_info + "/Lin/BTN_lspci",
	"btn_sysi_Lin_lshw" : node_system_info + "/Lin/BTN_LSHW",
	"btn_font_close" : node_font_test + "/BTN_Close",
	"btn_font_select_font" : node_font_test + "/BTN_Select_Font",
	"btn_about_close" : node_about + "/BTN_Close",
	"btn_about_used_res" : node_about + "/BTN_Used",
	"btn_about_license" : node_about + "/BTN_License",
	"btn_about_4b" : node_about + "/BTN_4B",
	"btn_about_about" : node_about + "/BTN_About",
	"btn_message_close" : node_message + "/BTN_Close",
	"btn_message_save" : node_message + "/BTN_Save",
	};

var chi_short_gui = {
	"btn_font_minus_x2" : node_font_test + "/BTN_Minus_x2",
	"btn_font_minus" : node_font_test + "/BTN_Minus",
	"btn_font_font_size" : node_font_test + "/BTN_Font_Size",
	"btn_font_plus" : node_font_test + "/BTN_Plus",
	"btn_font_plus_x2" : node_font_test + "/BTN_Plus_x2",
	};

var chi_wide_gui = {
	"line_from" : node_font_test + "/LINE_From",
	"line_to" : node_font_test + "/LINE_To",
	"btn_set" : node_font_test + "/BTN_Set",
	"btn_help" : node_font_test + "/BTN_Help",
	};

var chi_other = {
	"check_fullscreen" : node_settings + "/CHECK_Fullscreen",
	"lang_user_text" : node_font_test + "/User_Text",
	"lbl_spacer" : node_font_test + "/LBL_Spacer",
	"message_msg" : node_message + "/MSG",
	"txt_about_about" : node_about + "/TXT_About",
	"txt_about_license" : node_about + "/TXT_License",
	"txt_about_used" : node_about + "/TXT_Used",
	"txt_about_4b" : node_about + "/TXT_4B",
	};

func _ready():
	Engine.target_fps = 120;
	
	$GUI/Settings.chi_settings_load_from_file();
	get_tree().get_root().connect("size_changed", self, "on_resize");
	
	get_node("GUI/GUI_BaseInfo/BasePerfInfo").chi_aniso_read();
	
	on_resize();

func on_resize():
	var chi_render_size = OS.get_window_safe_area().size;
	for chi_item in chi_nodes:
		get_node(chi_nodes[chi_item]).chi_render_size = chi_render_size;
	
	$GUI.on_resize();

func chi_show_message(message = "Warning!", caption = "Warning!"):
	if get_node(chi_nodes["node_message"]).visible == true:
		get_node(chi_labels["message_capt"]).text = caption;
		get_node(chi_other["message_msg"]).text += "\n- " + str(message);
	if get_node(chi_nodes["node_message"]).visible == false:
		get_node(chi_nodes["node_message"]).visible = true;
		get_node(chi_labels["message_capt"]).text = caption;
		get_node(chi_other["message_msg"]).text = "- " + str(message);

func _input(event):
	if event.is_action_pressed("shift"):
		chi_keys["shift"] = 1;
		get_node(node_font_test).chi_keys["shift"] = 1;
	if event.is_action_released("shift"):
		chi_keys["shift"] = 0;
		get_node(node_font_test).chi_keys["shift"] = 0;
