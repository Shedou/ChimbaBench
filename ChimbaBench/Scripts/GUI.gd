extends Control

var chi_font_base = DynamicFont.new();
var chi_font_base_small = DynamicFont.new();

var chi_locale_path;
var chi_locale_file;
var chi_locale_dir = Directory.new();
var chi_localization = ConfigFile.new();

var chi_exe_directory;

var chi_render_size = {"x":0, "y":0};
var chi_font = { "size_main_s": 22, "size_main_m": 32, "size_main_l": 42,
	"size_small_s": 18, "size_small_m": 24, "size_small_l": 32,
	"outline_s":2, "outline_m":3, "outline_l":4
	};
export(String, FILE) var font_data = "res://Fonts/determination2/determination2.ttf";


func _ready():
	get_tree().get_root().connect("size_changed", self, "on_resize");
	chi_vars_prepare();
	var ok = chi_localization_load_from_file();

	chi_font_base = chi_font_set();
	chi_font_base_small = chi_font_set();
	chi_font_apply();
	chi_font_apply_text();
	
func on_resize():
	chi_adaptive();
	
func chi_adaptive():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	$GUI_Info.rect_size = chi_render_size;
	$Main_Controls.rect_size = chi_render_size;
	$SystemInfo.rect_size = chi_render_size;
	$Settings.rect_size = chi_render_size;
	$LangTest.rect_size = chi_render_size;
	$About.rect_size = chi_render_size;
	chi_font_set_settings(chi_font_base, chi_render_size.x/44, chi_font.outline_s);
	chi_font_set_settings(chi_font_base_small, chi_render_size.x/54, chi_font.outline_s);
	
	
	
func chi_vars_prepare():
	chi_exe_directory = $"..".chi_executable_dir;
	chi_locale_file = chi_exe_directory + "/Localization/GUI.cfg";
	chi_locale_path = chi_exe_directory + "/Localization";

func chi_font_apply():
	for chitem in $"/root/ChimbaBench".chi_elements_gui:
		get_node($"/root/ChimbaBench".chi_elements_gui[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_controls:
		get_node($"/root/ChimbaBench".chi_elements_gui_controls[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_info:
		get_node($"/root/ChimbaBench".chi_elements_gui_info[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_settings:
		get_node($"/root/ChimbaBench".chi_elements_gui_settings[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_langtest:
		get_node($"/root/ChimbaBench".chi_elements_gui_langtest[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_about:
		get_node($"/root/ChimbaBench".chi_elements_gui_about[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_message:
		get_node($"/root/ChimbaBench".chi_elements_gui_message[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_elements_system_info:
		get_node($"/root/ChimbaBench".chi_elements_system_info[chitem]).set("custom_fonts/font", chi_font_base);
		
func chi_font_apply_text():
	get_node($"/root/ChimbaBench".chi_elements_gui_message["msg"]).set("custom_fonts/font", chi_font_base_small);

func chi_font_set():
	var font = DynamicFont.new();
	font.font_data = load(font_data);
	return font;

func chi_font_set_settings(font, size, outliine_size = 0, outline_color:Color = Color(0.25, 0.25, 0.40, 1)):
	font.size = size;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;

func chi_localization_save_to_file():
	if not chi_locale_dir.dir_exists(chi_locale_path):
		chi_locale_dir.open(chi_exe_directory);
		chi_locale_dir.make_dir("Localization");
	
	if chi_locale_dir.dir_exists(chi_locale_path):
		chi_localization.set_value("Main", "WindowTitle", "ChimbaBench");
		chi_localization.set_value("GUI_Main_Controls", "BTN_Settings", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_settings"]).text);
		chi_localization.set_value("GUI_Main_Controls", "BTN_LangTest", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_langtest"]).text);
		chi_localization.set_value("GUI_Main_Controls", "BTN_About", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_about"]).text);
		chi_localization.set_value("GUI_Main_Controls", "BTN_SystemInfo", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_systeminfo"]).text);
		chi_localization.set_value("GUI_Main_Controls", "BTN_SBox", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_sbox"]).text);
		
		chi_localization.set_value("GUI_SystemInfo", "BTN_Close", get_node($"/root/ChimbaBench".chi_elements_system_info["btn_close"]).text);
		chi_localization.set_value("GUI_SystemInfo", "BTN_Win_WMI", get_node($"/root/ChimbaBench".chi_elements_system_info["btn_win_wmi"]).text);
		
		chi_localization.set_value("GUI_Settings", "BTN_Close", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_close"]).text);
		chi_localization.set_value("GUI_Settings", "BTN_Save", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_save"]).text);
		chi_localization.set_value("GUI_Settings", "BTN_AA", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_aa"]).text);
		chi_localization.set_value("GUI_Settings", "CHECK_Fullscreen", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_check_fullscreen"]).text);
		
		chi_localization.set_value("GUI_LangTest", "BTN_Close", get_node($"/root/ChimbaBench".chi_elements_gui_langtest["btn_close"]).text);
		chi_localization.set_value("GUI_About", "BTN_Close", get_node($"/root/ChimbaBench".chi_elements_gui_about["btn_close"]).text);
		chi_localization.set_value("GUI_Message", "BTN_Close", get_node($"/root/ChimbaBench".chi_elements_gui_message["btn_close"]).text);
		
		chi_localization.save(chi_locale_file);
		return 1;

func chi_localization_load_from_file():
	if chi_locale_dir.dir_exists(chi_locale_path) and chi_locale_dir.file_exists(chi_locale_file):
		var chi_load_localization = chi_localization.load(chi_locale_file);
		if chi_load_localization == OK:
			OS.set_window_title(chi_localization.get_value("Main", "WindowTitle"));
			get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_settings"]).text = chi_localization.get_value("GUI_Main_Controls", "BTN_Settings");
			get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_langtest"]).text = chi_localization.get_value("GUI_Main_Controls", "BTN_LangTest");
			get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_about"]).text = chi_localization.get_value("GUI_Main_Controls", "BTN_About");
			get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_systeminfo"]).text = chi_localization.get_value("GUI_Main_Controls", "BTN_SystemInfo");
			get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_sbox"]).text = chi_localization.get_value("GUI_Main_Controls", "BTN_SBox");
			
			get_node($"/root/ChimbaBench".chi_elements_system_info["btn_close"]).text = chi_localization.get_value("GUI_SystemInfo", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_system_info["btn_win_wmi"]).text = chi_localization.get_value("GUI_SystemInfo", "BTN_Win_WMI");
			
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_close"]).text = chi_localization.get_value("GUI_Settings", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_save"]).text = chi_localization.get_value("GUI_Settings", "BTN_Save");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_aa"]).text = chi_localization.get_value("GUI_Settings", "BTN_AA");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_check_fullscreen"]).text = chi_localization.get_value("GUI_Settings", "CHECK_Fullscreen");
			
			get_node($"/root/ChimbaBench".chi_elements_gui_langtest["btn_close"]).text = chi_localization.get_value("GUI_LangTest", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_gui_about["btn_close"]).text = chi_localization.get_value("GUI_About", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_gui_message["btn_close"]).text = chi_localization.get_value("GUI_Message", "BTN_Close");
			return 1;

func _on_BTN_Settings_pressed():
	get_node($"/root/ChimbaBench".chi_elements_gui_settings["node"]).visible = true;

func _on_BTN_LangTest_pressed():
	get_node($"/root/ChimbaBench".chi_elements_gui_langtest["node"]).visible = true;


func _on_BTN_About_pressed():
	get_node($"/root/ChimbaBench".chi_elements_gui_about["node"]).visible = true;


func _on_BTN_SystemInfo_pressed():
	get_node($"/root/ChimbaBench".chi_elements_system_info["node"]).visible = true;
