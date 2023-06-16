extends Control


var chi_wmi_info = [""];
var chi_wmi_info_output = "";
var chi_exe_dir;

func _ready():
	chi_exe_dir = $"../../..".chi_executable_dir;

func _on_BTN_Win_WMI_pressed():
	if $"/root/ChimbaBench".chi_OS == "Windows":
		chi_windows_wmi_info();
		$"/root/ChimbaBench".chi_show_message("wmic path Win32_VideoController\n" + chi_wmi_info_output, "Windows Management Instrumentation (WMI) Info");

func chi_windows_wmi_info():
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "AdapterCompatibility"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "AdapterDACType"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "AdapterRAM"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Caption"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Description"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "DeviceID"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "DriverDate"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "DriverVersion"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "InfFilename"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "InfSection"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Name"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "PNPDeviceID"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Status"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "VideoModeDescription"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "VideoProcessor"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "StatusInfo"], true, chi_wmi_info, false, false);
	chi_wmi_info_output += chi_wmi_info[0];
