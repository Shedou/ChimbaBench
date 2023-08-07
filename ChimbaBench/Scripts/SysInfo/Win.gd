extends Control

const root = "/root/ChimbaBench";

var chi_exe_dir;
var spacer = "------------------------------------------------------------";

var chi_win_exit_codes = {
	0:"0",
	1:"1"
}

var chi_wmi_info = [""];
var chi_wmi_info_output = "";

func _ready():
	chi_exe_dir = get_node(root).chi_executable_dir;

func chi_os_exe_command(cname:String, command:String, args = [], append:bool = false, block:bool = true, stderr:bool = false, open_console:bool = false):
	var cmd_output = [""];
	var chmod_output = [""];
	var exit_code_str = "";
	var exit_code;
	var exit_code_ch;
	
	if append == false:
		exit_code = OS.execute(command, args, block, cmd_output, stderr, open_console);
		if cmd_output[0] != "":
			get_node(root).chi_show_message(str("Command: ", command, "\nArguments: ", args, "\n", spacer, "\n", cmd_output[0], "\n\n"), cname);
		else:
			if exit_code != null: exit_code_str = " - ( " + str(exit_code) + " )";
			else: exit_code_str = " - ( Undefined error code )";
			get_node(root).chi_show_message(str("Command: ", command, "\nArguments: ", args, "\nError code: ", exit_code, exit_code_str, "\n\n"), cname);
	else:
		exit_code = OS.execute(command, args, block, cmd_output, stderr, open_console);
		if cmd_output[0] != "":
			get_node(root).chi_show_message(str(cmd_output[0]), cname);
		else:
			if exit_code != null: exit_code_str = " - ( " + exit_code + " )";
			else: exit_code_str = " - ( Undefined error code )";
			get_node(root).chi_show_message(str("Command: ", command, "\nArguments: ", args, "\nError code: ", exit_code, exit_code_str, "\n\n"), cname);


func _on_BTN_Win_WMI_pressed():
	chi_os_exe_command("WMI Info", "wmic", ["path", "Win32_VideoController", "get", "Name"], true);
	chi_os_exe_command("WMI Info", "wmic", ["path", "Win32_VideoController", "get", "DriverDate"], true);
	chi_os_exe_command("WMI Info", "wmic", ["path", "Win32_VideoController", "get", "DriverVersion"], true);
	chi_os_exe_command("WMI Info", "wmic", ["path", "Win32_VideoController", "get", "PNPDeviceID"], true);
	chi_os_exe_command("WMI Info", "wmic", ["path", "Win32_VideoController", "get", "InfFilename"], true);
	chi_os_exe_command("WMI Info", "wmic", ["path", "Win32_VideoController", "get", "InfSection"], true);
	chi_os_exe_command("WMI Info", "wmic", ["path", "Win32_VideoController", "get", "AdapterRAM"], true);

func _on_BTN_Sys_Info_pressed():
	chi_os_exe_command("System Info", "systeminfo", []);
	
