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

var chi_executable_dir = OS.get_executable_path().get_base_dir();
var chi_OS = OS.get_name();
var chi_smi_enabled = 0;


var chi_nodes = {
	"node_gui" : "/root/ChimbaBench/GUI",
	"node_gui_info" : "/root/ChimbaBench/GUI/GUI_Info",
	"node_main_controls" : "/root/ChimbaBench/GUI/Main_Controls",
	"node_system_info" : "/root/ChimbaBench/GUI/System_Info",
	"node_settings" : "/root/ChimbaBench/GUI/Settings",
	"node_lang_test" : "/root/ChimbaBench/GUI/Lang_Test",
	"node_about" : "/root/ChimbaBench/GUI/About",
	"node_message" : "/root/ChimbaBench/GUI/Message"
};
var chi_backgrounds = {
	"bg_system_info" : "/root/ChimbaBench/GUI/System_Info/Background",
	"bg_settings" : "/root/ChimbaBench/GUI/Settings/Background",
	"bg_lang_test" : "/root/ChimbaBench/GUI/Lang_Test/Background",
	"bg_about" : "/root/ChimbaBench/GUI/About/Background",
	"bg_message" : "/root/ChimbaBench/GUI/Message/Background"
};
var chi_other = {
	"check_fullscreen" : "/root/ChimbaBench/GUI/Settings/CHECK_Fullscreen",
	"lang_user_text" : "/root/ChimbaBench/GUI/Lang_Test/User_Text",
	"message_msg" : "/root/ChimbaBench/GUI/Message/MSG",
	"txt_about_license" : "/root/ChimbaBench/GUI/About/TXT_License",
	"txt_about_used" : "/root/ChimbaBench/GUI/About/TXT_Used"
};
var chi_sel = {
	"sel_settings_msaa" : "/root/ChimbaBench/GUI/Settings/SEL_MSAA",
	"sel_settings_aniso" : "/root/ChimbaBench/GUI/Settings/SEL_Aniso",
	"sel_settings_resolution" : "/root/ChimbaBench/GUI/Settings/SEL_resolution",
};
var chi_labels = {
	"sysi_text_portable" : "/root/ChimbaBench/GUI/System_Info/Lin/Portable",
	"sysi_text_system" : "/root/ChimbaBench/GUI/System_Info/Lin/System",
	"lang_langs_main" : "/root/ChimbaBench/GUI/Lang_Test/Langs_Main",
	"lang_langs_other" : "/root/ChimbaBench/GUI/Lang_Test/Langs_Other",
	"lang_font_current" : "/root/ChimbaBench/GUI/Lang_Test/Font_Current",
	"message_capt" : "/root/ChimbaBench/GUI/Message/CAPT",
	"guii_nvidia_smi" : "/root/ChimbaBench/GUI/GUI_Info/NvidiaSmiInfo",
	"guii_debug_info" : "/root/ChimbaBench/GUI/GUI_Info/DebugInfo"
};
var chi_btn_gui = {
	"btn_main_settings" : "/root/ChimbaBench/GUI/Main_Controls/BTN_Settings",
	"btn_main_langtest" : "/root/ChimbaBench/GUI/Main_Controls/BTN_Lang_Test",
	"btn_main_about" : "/root/ChimbaBench/GUI/Main_Controls/BTN_About",
	"btn_main_system_info" : "/root/ChimbaBench/GUI/Main_Controls/BTN_System_Info",
	"btn_main_sbox" : "/root/ChimbaBench/GUI/Main_Controls/BTN_SBox",
	"btn_main_gpu_heavy" : "/root/ChimbaBench/GUI/Main_Controls/BTN_GPU_Heavy",
	"btn_main_exit" : "/root/ChimbaBench/GUI/Main_Controls/BTN_Exit",
	"lbl_btn_main_menu" : "/root/ChimbaBench/GUI/Main_Controls/LBL_BTN_Main_Menu",
	"lbl_btn_tests" : "/root/ChimbaBench/GUI/Main_Controls/LBL_BTN_Tests",
	"lbl_btn_other" : "/root/ChimbaBench/GUI/Main_Controls/LBL_BTN_Other",
	"btn_settings_close" : "/root/ChimbaBench/GUI/Settings/BTN_Close",
	"btn_settings_save" : "/root/ChimbaBench/GUI/Settings/BTN_Save",
	"btn_settings_save_restart" : "/root/ChimbaBench/GUI/Settings/BTN_Save_Restart",
	"btn_sysi_close" : "/root/ChimbaBench/GUI/System_Info/BTN_Close",
	"btn_sysi_win_wmi" : "/root/ChimbaBench/GUI/System_Info/Win/BTN_Win_WMI",
	"btn_sysi_Lin_neo" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_NeoFetch",
	"btn_sysi_Lin_dmi" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_dmidecode35",
	"btn_sysi_Lin_dmi_bios" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_biosdecode35",
	"btn_sysi_Lin_dmi_vpd" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_vpddecode35",
	"btn_sysi_Lin_lscpu" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_lscpu",
	"btn_sysi_Lin_proc_cpu" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_proc_cpu",
	"btn_sysi_Lin_lsusb" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_lsusb",
	"btn_sysi_Lin_lspci" : "/root/ChimbaBench/GUI/System_Info/Lin/BTN_lspci",
	"btn_lang_close" : "/root/ChimbaBench/GUI/Lang_Test/BTN_Close",
	"btn_lang_select_font" : "/root/ChimbaBench/GUI/Lang_Test/BTN_Select_Font",
	"btn_about_close" : "/root/ChimbaBench/GUI/About/BTN_Close",
	"btn_about_used_res" : "/root/ChimbaBench/GUI/About/BTN_Used_Res",
	"btn_about_license" : "/root/ChimbaBench/GUI/About/BTN_License",
	"btn_message_close" : "/root/ChimbaBench/GUI/Message/BTN_Close",
	"btn_message_save" : "/root/ChimbaBench/GUI/Message/BTN_Save"
};

func _ready():
	Engine.target_fps = 120;
	$GUI/Settings.chi_settings_load_from_file();
	get_tree().get_root().connect("size_changed", self, "on_resize");
	on_resize();

func on_resize():
	$GUI.on_resize();

func chi_show_message(message = "Warning!", caption = "Warning!"):
	if get_node(chi_nodes["node_message"]).visible == true:
		get_node(chi_labels["message_capt"]).text = caption;
		get_node(chi_other["message_msg"]).text += "\n- " + str(message);
	if get_node(chi_nodes["node_message"]).visible == false:
		get_node(chi_nodes["node_message"]).visible = true;
		get_node(chi_labels["message_capt"]).text = caption;
		get_node(chi_other["message_msg"]).text = "- " + str(message);
	
