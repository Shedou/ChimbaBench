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

var chi_elements_gui = {
	"node" : "/root/ChimbaBench/GUI"
};
var chi_elements_gui_controls = {
	"node" : "/root/ChimbaBench/GUI/Main_Controls",
	"btn_settings" : "/root/ChimbaBench/GUI/Main_Controls/BTN_Settings",
	"btn_langtest" : "/root/ChimbaBench/GUI/Main_Controls/BTN_LangTest",
	"btn_about" : "/root/ChimbaBench/GUI/Main_Controls/BTN_About",
	"btn_systeminfo" : "/root/ChimbaBench/GUI/Main_Controls/BTN_SystemInfo",
	"btn_sbox" : "/root/ChimbaBench/GUI/Main_Controls/BTN_SBox",
};
var chi_elements_gui_info = {
	"node" : "/root/ChimbaBench/GUI/GUI_Info",
	"nvidia_smi" : "/root/ChimbaBench/GUI/GUI_Info/NvidiaSmiInfo"
};
var chi_elements_gui_settings = {
	"node" : "/root/ChimbaBench/GUI/Settings",
	"btn_close" : "/root/ChimbaBench/GUI/Settings/BTN_Close",
	"btn_save" : "/root/ChimbaBench/GUI/Settings/BTN_Save",
	"btn_aa" : "/root/ChimbaBench/GUI/Settings/BTN_SelectFont",
	"btn_sel_msaa" : "/root/ChimbaBench/GUI/Settings/SEL_MSAA",
	"btn_sel_aniso" : "/root/ChimbaBench/GUI/Settings/SEL_Aniso",
	"btn_sel_resolution" : "/root/ChimbaBench/GUI/Settings/SEL_resolution",
	"btn_check_fullscreen" : "/root/ChimbaBench/GUI/Settings/CHECK_Fullscreen"
};
var chi_elements_gui_langtest = {
	"node" : "/root/ChimbaBench/GUI/LangTest",
	"btn_close" : "/root/ChimbaBench/GUI/LangTest/BTN_Close",
	"langs_main" : "/root/ChimbaBench/GUI/LangTest/Langs_Main",
	"langs_other" : "/root/ChimbaBench/GUI/LangTest/Langs_Other",
	"user_text" : "/root/ChimbaBench/GUI/LangTest/User_Text",
	"font_current" : "/root/ChimbaBench/GUI/LangTest/Font_Current"
};
var chi_elements_gui_about = {
	"node" : "/root/ChimbaBench/GUI/About",
	"btn_close" : "/root/ChimbaBench/GUI/About/BTN_Close",
	"btn_txt_about" : "/root/ChimbaBench/GUI/About/TextAbout"
};
var chi_elements_system_info = {
	"node" : "/root/ChimbaBench/GUI/SystemInfo",
	"btn_close" : "/root/ChimbaBench/GUI/SystemInfo/BTN_Close",
	"btn_win_wmi" : "/root/ChimbaBench/GUI/SystemInfo/BTN_Win_WMI"
};
var chi_elements_gui_message = {
	"node" : "/root/ChimbaBench/GUI/Message",
	"btn_close" : "/root/ChimbaBench/GUI/Message/BTN_Close",
	"capt" : "/root/ChimbaBench/GUI/Message/CAPT",
	"msg" : "/root/ChimbaBench/GUI/Message/MSG"
};

func _ready():
	Engine.target_fps = 120;
	chi_resize();

func chi_resize():
	$GUI.on_resize();
	$GUI/Main_Controls.on_resize();
	$GUI/SystemInfo.on_resize();
	$GUI/Settings.on_resize();
	$GUI/LangTest.on_resize();
	$GUI/About.on_resize();
	$GUI/Message.on_resize();
	$GUI/Settings.chi_settings_load_from_file();

func chi_show_message(message = "Warning!", caption = "Warning!"):
	if get_node(chi_elements_gui_message["node"]).visible == true:
		get_node(chi_elements_gui_message["capt"]).text = caption;
		get_node(chi_elements_gui_message["msg"]).text += "\n- " + str(message);
	if get_node(chi_elements_gui_message["node"]).visible == false:
		get_node(chi_elements_gui_message["node"]).visible = true;
		get_node(chi_elements_gui_message["capt"]).text = caption;
		get_node(chi_elements_gui_message["msg"]).text = "- " + str(message);
	
