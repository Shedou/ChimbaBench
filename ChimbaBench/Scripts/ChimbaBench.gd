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

var chi_project_name_and_version = "ChimbaBench 1.2 (GPLv3+)\n";

var chi_executable_dir = OS.get_executable_path().get_base_dir();

var chi_OS = OS.get_name();

var chi_elements_gui = [
	"/root/ChimbaBench/GUI/BTN_Settings",
	"/root/ChimbaBench/GUI/BTN_LangTest",
	"/root/ChimbaBench/GUI/BTN_About"
	];
var chi_elements_gui_info = [
	"/root/ChimbaBench/GUI/GUI_Info/BaseSystemInfo",
	"/root/ChimbaBench/GUI/GUI_Info/BasePerfInfo",
	"/root/ChimbaBench/GUI/GUI_Info/NvidiaSmiInfo",
	];
var chi_elements_gui_settings = [
	"/root/ChimbaBench/GUI/Settings/BTN_Close",
	"/root/ChimbaBench/GUI/Settings/BTN_Save_Locale",
	"/root/ChimbaBench/GUI/Settings/BTN_Load_Locale",
	];
var chi_elements_gui_langtest = [
	"/root/ChimbaBench/GUI/LangTest/MainLangs",
	"/root/ChimbaBench/GUI/LangTest/OtherLangs",
	"/root/ChimbaBench/GUI/LangTest/TextEdit",
	"/root/ChimbaBench/GUI/LangTest/BTN_Close"
	];
var chi_elements_gui_message = [
	"/root/ChimbaBench/GUI/Message/CAPT",
	"/root/ChimbaBench/GUI/Message/MSG",
	"/root/ChimbaBench/GUI/Message/BTN_Close"
	];
var chi_elements_gui_about = [
	"/root/ChimbaBench/GUI/About/Overclockers",
	"/root/ChimbaBench/GUI/About/GitHub",
	"/root/ChimbaBench/GUI/About/BTN_Close"
	];


func _ready():
	#Engine.target_fps = 100;
	pass;

#func _process(delta):
#	pass

func chi_show_message(message = "Warning!", caption = "Warning!"):
	if get_node("GUI/Message").visible == true:
		get_node(chi_elements_gui_message[1]).text += "\n" + message;
	if get_node("GUI/Message").visible == false:
		get_node("GUI/Message").visible = true;
		get_node(chi_elements_gui_message[0]).text = caption;
		get_node(chi_elements_gui_message[1]).text = message;
	
