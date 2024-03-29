extends Control

const root = "/root/ChimbaBench";

var chi_exe_dir;
var spacer = "------------------------------------------------------------";

var chi_linux_exit_codes = {
	0:"All right.",
	1:"General error",
	2:"Misuse of shell builtins",
	126:"Command invoked cannot execute",
	127:"Command not found, possibly a defective Linux distribution?",
	128:"Invalid argument to exit",
	130:"Script terminated by Control-C"
}


func _ready():
	chi_exe_dir = get_node(root).chi_executable_dir;
	$Portable.text = "Portable tools";
	$System.text = "System dependent tools";


func _on_BTN_NeoFetch_pressed():
	chi_os_exe_command("NeoFetch", "bash", [chi_exe_dir + "/Tools_Linux/neofetch710/neofetch", "--stdout", "--color_blocks off"], true);

func _on_BTN_dmidecode35_pressed():
	chi_os_exe_command("DMI Decode v3.5", "pkexec", [chi_exe_dir + "/Tools_Linux/dmi_decode_35/dmidecode.exec"], true);

func _on_BTN_biosdecode35_pressed():
	chi_os_exe_command("BIOS Decode v3.5", "pkexec", [chi_exe_dir + "/Tools_Linux/dmi_decode_35/biosdecode.exec"], true);

func _on_BTN_vpddecode35_pressed():
	chi_os_exe_command("VPD Decode v3.5", "pkexec", [chi_exe_dir + "/Tools_Linux/dmi_decode_35/vpddecode.exec"], true);

func _on_BTN_lscpu_pressed():
	chi_os_exe_command("CPU Info", "lscpu", []);
	chi_os_exe_command("CPU Info", "lscpu", ["-C"]);

func _on_BTN_proc_cpu_pressed():
	chi_os_exe_command("CPU Info (/proc/cpuinfo)", "cat", ["/proc/cpuinfo"]);

func _on_BTN_lsusb_pressed():
	chi_os_exe_command("USB Info", "lsusb", ["-v"]);
	chi_os_exe_command("USB Info", "usb-devices", []);

func _on_BTN_lspci_pressed():
	chi_os_exe_command("PCI Info", "lspci", ["-v"]);

func _on_BTN_LSHW_pressed():
	chi_os_exe_command("HardWare LiSter B.02.19", "pkexec", [chi_exe_dir + "/Tools_Linux/lshw_B219/lshw_B2_19.exec"], true);

func chi_os_exe_command(cname:String, command:String, args = [], chmod:bool = false, append:bool = false, block:bool = true, stderr:bool = false, open_console:bool = false):
	# Example use (Linux):      chi_os_exe_command("CPU Info", "lscpu");
	# chi_os_exe_command("NeoFetch", "bash", ["/Tools_Linux/neofetch710/neofetch", "--stdout", "--color_blocks off"], true);
	var cmd_output = [""];
	var chmod_output = [""];
	var exit_code_str = "";
	var exit_code;
	var exit_code_ch;
	
	if chmod == true:
		exit_code_ch = OS.execute("chmod", ["u+x", args[0]], block, chmod_output, stderr, open_console);
	exit_code = OS.execute(command, args, block, cmd_output, stderr, open_console);
	if cmd_output[0] != "":
		get_node(root).chi_show_message(str("Command: ", command, "\nArguments: ", args, "\n", spacer, "\n", cmd_output[0], "\n\n"), cname);
	else:
		if chi_linux_exit_codes[exit_code] != null: exit_code_str = " - ( " + chi_linux_exit_codes[exit_code] + " )";
		else: exit_code_str = " - ( Undefined error code )";
		get_node(root).chi_show_message(str("Command: ", command, "\nArguments: ", args, "\nError code: ", exit_code, exit_code_str, "\n\n"), cname);

