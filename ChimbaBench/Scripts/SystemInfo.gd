extends Control

var chi_render_size = Vector2(0,0);

func _ready():
	get_tree().get_root().connect("size_changed", self, "on_resize");
	if $"/root/ChimbaBench".chi_OS == "Windows":
		$Win.visible = true;
		$Lin.visible = false;
	if $"/root/ChimbaBench".chi_OS == "X11":
		$Win.visible = false;
		$Lin.visible = true;
	
func on_resize():
	adaptive_buttons();
	if $"/root/ChimbaBench".chi_OS == "Windows":
		adaptive_buttons_windows();
	if $"/root/ChimbaBench".chi_OS == "X11":
		adaptive_buttons_linux();
	

func adaptive_buttons():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	$Win.rect_size = chi_render_size;
	$Background.rect_size.x = chi_render_size.x - 20;
	$Background.rect_size.y = chi_render_size.y - 20;
	$Background.rect_position = Vector2(10, 10);
	
	$BTN_Close.rect_size.x = chi_render_size.x / 8;
	$BTN_Close.rect_size.y = $BTN_Close.rect_size.x / 3;
	$BTN_Close.rect_position = Vector2(20, (chi_render_size.y - 20) - $BTN_Close.rect_size.y);
	

func adaptive_buttons_windows():
	$Win/BTN_Win_WMI.rect_size.x = chi_render_size.x / 5;
	$Win/BTN_Win_WMI.rect_size.y = $Win/BTN_Win_WMI.rect_size.x / 4;
	$Win/BTN_Win_WMI.rect_position = Vector2(20, 20);
	
func adaptive_buttons_linux():
	$Lin/Portable.rect_size.x = chi_render_size.x / 3;
	$Lin/Portable.rect_size.y = $Lin/Portable.rect_size.x / 12;
	$Lin/Portable.rect_position = Vector2(20, 12);
	
	$Lin/BTN_NeoFetch.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_NeoFetch.rect_size.y = $Lin/BTN_NeoFetch.rect_size.x / 4;
	$Lin/BTN_NeoFetch.rect_position = Vector2(20, 22 + $Lin/Portable.rect_size.y);
	
	$Lin/BTN_dmidecode35.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_dmidecode35.rect_size.y = $Lin/BTN_dmidecode35.rect_size.x / 4;
	$Lin/BTN_dmidecode35.rect_position = Vector2(20, 32 + $Lin/Portable.rect_size.y + $Lin/BTN_NeoFetch.rect_size.y);
	
	$Lin/BTN_biosdecode35.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_biosdecode35.rect_size.y = $Lin/BTN_biosdecode35.rect_size.x / 4;
	$Lin/BTN_biosdecode35.rect_position = Vector2(20, 42 + $Lin/Portable.rect_size.y + $Lin/BTN_NeoFetch.rect_size.y + $Lin/BTN_dmidecode35.rect_size.y);
	
	$Lin/BTN_vpddecode35.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_vpddecode35.rect_size.y = $Lin/BTN_vpddecode35.rect_size.x / 4;
	$Lin/BTN_vpddecode35.rect_position = Vector2(20, 52 + $Lin/Portable.rect_size.y + $Lin/BTN_NeoFetch.rect_size.y + $Lin/BTN_dmidecode35.rect_size.y + $Lin/BTN_biosdecode35.rect_size.y);
	
	
	#----
	
	$Lin/System.rect_size.x = chi_render_size.x / 3;
	$Lin/System.rect_size.y = $Lin/Portable.rect_size.x / 12;
	$Lin/System.rect_position = Vector2(chi_render_size.x - 20 - $Lin/System.rect_size.x, 12);
	
	$Lin/BTN_lscpu.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_lscpu.rect_size.y = $Lin/BTN_lscpu.rect_size.x / 4;
	$Lin/BTN_lscpu.rect_position = Vector2(chi_render_size.x - 20 - $Lin/BTN_lscpu.rect_size.x, 22 + $Lin/System.rect_size.y);
	
	$Lin/BTN_proc_cpu.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_proc_cpu.rect_size.y = $Lin/BTN_proc_cpu.rect_size.x / 4;
	$Lin/BTN_proc_cpu.rect_position = Vector2(chi_render_size.x - 20 - $Lin/BTN_proc_cpu.rect_size.x, 32 + $Lin/System.rect_size.y + $Lin/BTN_lscpu.rect_size.y);
	
	$Lin/BTN_lsusb.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_lsusb.rect_size.y = $Lin/BTN_vpddecode35.rect_size.x / 4;
	$Lin/BTN_lsusb.rect_position = Vector2(chi_render_size.x - 20 - $Lin/BTN_lsusb.rect_size.x, 42 + $Lin/System.rect_size.y + $Lin/BTN_lscpu.rect_size.y + $Lin/BTN_proc_cpu.rect_size.y);
	
	$Lin/BTN_lspci.rect_size.x = chi_render_size.x / 5;
	$Lin/BTN_lspci.rect_size.y = $Lin/BTN_vpddecode35.rect_size.x / 4;
	$Lin/BTN_lspci.rect_position = Vector2(chi_render_size.x - 20 - $Lin/BTN_lspci.rect_size.x, 52 + $Lin/System.rect_size.y + $Lin/BTN_lscpu.rect_size.y + $Lin/BTN_proc_cpu.rect_size.y + $Lin/BTN_lsusb.rect_size.y);

func _on_BTN_Close_pressed():
	visible = false;

