extends Control

var chi_render_size = Vector2(0,0);

var chi_wmi_info = [""];
var chi_wmi_info_output = "";

func _ready():
	get_tree().get_root().connect("size_changed", self, "on_resize");
	if $"/root/ChimbaBench".chi_OS != "Windows":
		$BTN_Win_WMI.disabled = true;
	
func on_resize():
	adaptive_buttons();

func adaptive_buttons():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	$Background.rect_size.x = chi_render_size.x - 20;
	$Background.rect_size.y = chi_render_size.y - 20;
	$Background.rect_position = Vector2(10, 10);
	
	$BTN_Close.rect_size.x = chi_render_size.x / 8;
	$BTN_Close.rect_size.y = $BTN_Close.rect_size.x / 3;
	$BTN_Close.rect_position = Vector2(20, (chi_render_size.y - 20) - $BTN_Close.rect_size.y);
	
	$BTN_Win_WMI.rect_size.x = chi_render_size.x / 5;
	$BTN_Win_WMI.rect_size.y = $BTN_Win_WMI.rect_size.x / 4;
	$BTN_Win_WMI.rect_position = Vector2(20, 20);

func _on_BTN_Close_pressed():
	visible = false;


func _on_BTN_Win_WMI_pressed():
	if $"/root/ChimbaBench".chi_OS == "Windows":
		chi_windows_wmi_info();
		$"/root/ChimbaBench".chi_show_message("wmic path Win32_VideoController\n" + chi_wmi_info_output, "Windows Management Instrumentation (WMI) Info");

func chi_windows_wmi_info():
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "AdapterCompatibility"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "AdapterDACType"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "AdapterRAM"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Caption"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Description"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "DeviceID"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "DriverDate"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "DriverVersion"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "InfFilename"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "InfSection"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Name"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "PNPDeviceID"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "Status"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "VideoModeDescription"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "VideoProcessor"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	OS.execute("wmic", ["path", "Win32_VideoController", "get", "StatusInfo"], true, chi_wmi_info, false, false)
	chi_wmi_info_output += chi_wmi_info[0];
	
