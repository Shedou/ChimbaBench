extends Control

var chi_font_base = DynamicFont.new();
var chi_font_base_small = DynamicFont.new();

var chi_locale_path;
var chi_locale_file;
var chi_locale_dir = Directory.new();
var chi_localization = ConfigFile.new();

var chi_exe_directory;

func _ready():
	chi_vars_prepare();

	chi_font_base = chi_font_set_settings("base", 22, 2);
	chi_font_base_small = chi_font_set_settings("base", 18, 2);
	chi_font_apply(chi_font_base);
	chi_font_apply_text(chi_font_base_small);
	
func chi_vars_prepare():
	chi_exe_directory = $"..".chi_executable_dir;
	chi_locale_file = chi_exe_directory + "/Localization/GUI.cfg";
	chi_locale_path = chi_exe_directory + "/Localization";

func chi_font_apply(font):
	for chitem in $"/root/ChimbaBench".chi_elements_gui:
		get_node($"/root/ChimbaBench".chi_elements_gui[chitem]).set("custom_fonts/font", font);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_controls:
		get_node($"/root/ChimbaBench".chi_elements_gui_controls[chitem]).set("custom_fonts/font", font);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_info:
		get_node($"/root/ChimbaBench".chi_elements_gui_info[chitem]).set("custom_fonts/font", font);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_settings:
		get_node($"/root/ChimbaBench".chi_elements_gui_settings[chitem]).set("custom_fonts/font", font);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_langtest:
		get_node($"/root/ChimbaBench".chi_elements_gui_langtest[chitem]).set("custom_fonts/font", font);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_about:
		get_node($"/root/ChimbaBench".chi_elements_gui_about[chitem]).set("custom_fonts/font", font);
	for chitem in $"/root/ChimbaBench".chi_elements_gui_message:
		get_node($"/root/ChimbaBench".chi_elements_gui_message[chitem]).set("custom_fonts/font", font);
	for chitem in $"/root/ChimbaBench".chi_elements_system_info:
		get_node($"/root/ChimbaBench".chi_elements_system_info[chitem]).set("custom_fonts/font", font);
		
func chi_font_apply_text(font):
	get_node($"/root/ChimbaBench".chi_elements_gui_message["msg"]).set("custom_fonts/font", font);

func chi_font_set_settings(font_path, size, outliine_size = 0, outline_color:Color = Color(0.25, 0.25, 0.40, 1)):
	var font = DynamicFont.new();
	if font_path == "base":
		font.font_data = load("res://Fonts/determination2/determination2.ttf");
	else:
		font.font_data = load(font_path);
	font.size = size;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;
	return font;

func chi_localization_save_to_file():
	if not chi_locale_dir.dir_exists(chi_locale_path):
		chi_locale_dir.open(chi_exe_directory);
		chi_locale_dir.make_dir("Localization");
	
	if chi_locale_dir.dir_exists(chi_locale_path):
		chi_localization.set_value("Main", "WindowTitle", "ChimbaBench");
		chi_localization.set_value("GUI_Main_Controls", "BTN_Settings", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_settings"]).text);
		chi_localization.set_value("GUI_Main_Controls", "BTN_LangTest", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_langtest"]).text);
		chi_localization.set_value("GUI_Main_Controls", "BTN_About", get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_about"]).text);
		
		chi_localization.set_value("GUI_SystemInfo", "BTN_Close", get_node($"/root/ChimbaBench".chi_elements_system_info["btn_close"]).text);
		chi_localization.set_value("GUI_SystemInfo", "BTN_Win_WMI", get_node($"/root/ChimbaBench".chi_elements_system_info["btn_win_wmi"]).text);
		
		chi_localization.set_value("GUI_Settings", "BTN_Close", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_close"]).text);
		chi_localization.set_value("GUI_Settings", "BTN_Save_Locale", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_save_locale"]).text);
		chi_localization.set_value("GUI_Settings", "BTN_Load_Locale", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_load_locale"]).text);
		chi_localization.set_value("GUI_Settings", "BTN_Font_Load", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_font_load"]).text);
		chi_localization.set_value("GUI_Settings", "BTN_AA", get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_aa"]).text);
		chi_localization.set_value("GUI_Settings", "SEL_MSAA", get_node($"/root/ChimbaBench".chi_elements_gui_settings["sel_msaa"]).text);
		chi_localization.set_value("GUI_Settings", "SEL_Aniso", get_node($"/root/ChimbaBench".chi_elements_gui_settings["sel_anoso"]).text);
		
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
			
			get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_close"]).text = chi_localization.get_value("chi_elements_system_info", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_gui_controls["btn_win_wmi"]).text = chi_localization.get_value("chi_elements_system_info", "BTN_Win_WMI");
			
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_close"]).text = chi_localization.get_value("GUI_Settings", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_save_locale"]).text = chi_localization.get_value("GUI_Settings", "BTN_Save_Locale");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_load_locale"]).text = chi_localization.get_value("GUI_Settings", "BTN_Load_Locale");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_font_load"]).text = chi_localization.get_value("GUI_Settings", "BTN_Font_Load");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["btn_aa"]).text = chi_localization.get_value("GUI_Settings", "BTN_AA");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["sel_msaa"]).text = chi_localization.get_value("GUI_Settings", "SEL_MSAA");
			get_node($"/root/ChimbaBench".chi_elements_gui_settings["sel_anoso"]).text = chi_localization.get_value("GUI_Settings", "SEL_Aniso");
			
			get_node($"/root/ChimbaBench".chi_elements_gui_langtest["btn_close"]).text = chi_localization.get_value("GUI_LangTest", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_gui_about["btn_close"]).text = chi_localization.get_value("GUI_About", "BTN_Close");
			get_node($"/root/ChimbaBench".chi_elements_gui_message["btn_close"]).text = chi_localization.get_value("GUI_Message", "BTN_Close");
			return 1;

func _on_BTN_Settings_pressed():
	get_node($"/root/ChimbaBench".chi_elements_gui_settings["node"]).visible = true;

func _on_BTN_LangTest_pressed():
	get_node($"/root/ChimbaBench".chi_elements_gui_langtest["node"]).visible = true;

func _on_BTN_Load_Locale_pressed():
	var ok = chi_localization_load_from_file();
	if ok:
		$"/root/ChimbaBench".chi_show_message("Localization loaded:");
		$"/root/ChimbaBench".chi_show_message(str(chi_locale_file));

func _on_BTN_Save_Locale_pressed():
	var ok = chi_localization_save_to_file();
	if ok:
		$"/root/ChimbaBench".chi_show_message("Localization saved:");
		$"/root/ChimbaBench".chi_show_message(str(chi_locale_file));

func _on_BTN_About_pressed():
	get_node($"/root/ChimbaBench".chi_elements_gui_about["node"]).visible = true;


func _on_BTN_SystemInfo_pressed():
	get_node($"/root/ChimbaBench".chi_elements_system_info["node"]).visible = true;
