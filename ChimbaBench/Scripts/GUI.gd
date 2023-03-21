extends Control

var chi_font_base = DynamicFont.new();
var chi_font_custom = DynamicFont.new();
var chi_font_custom_path;
var chi_font_custom_dir = Directory.new();
var chi_font_custon_file;

var chi_locale_path;
var chi_locale_file;
var chi_locale_dir = Directory.new();
var chi_localization = ConfigFile.new();

var chi_exe_directory;

func _ready():
	chi_vars_prepare();
	
	if chi_font_custom_dir.dir_exists(chi_exe_directory + "/Font") and chi_font_custom_dir.file_exists(chi_font_custom_path):
		chi_font_custom.font_data = load(chi_font_custom_path);

	chi_font_base.font_data = load("res://Fonts/determination2/determination2.ttf");
	$GUI_Info/Label4.text = chi_font_custom_path;
	
	chi_font_base_set_settings(24, 3, Color(0.251961, 0.251961, 0.401961, 1));
	chi_font_base_apply();
	
	$"..".chi_show_message("ВАЖНОЕ СООБЩЕНИЕ ХЁ!");
	$"..".chi_show_message("hy!");
	$"..".chi_show_message("アザザ");
	$"..".chi_show_message("აზაზა");
	
	yield(get_tree().create_timer(2.0), "timeout");
	chi_font_base = chi_font_custom;

func chi_vars_prepare():
	chi_exe_directory = $"..".chi_executable_dir;
	chi_locale_file = chi_exe_directory + "/Localization/GUI.cfg";
	chi_locale_path = chi_exe_directory + "/Localization";
	chi_font_custon_file = "/Font/FreeMonospaced.otf";
	chi_font_custom_path = chi_exe_directory + chi_font_custon_file;

func chi_font_base_apply():
	for chitem in range(0, $"..".chi_elements_gui.size()):
		get_node($"..".chi_elements_gui[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in range(0, $"..".chi_elements_gui_info.size()):
		get_node($"..".chi_elements_gui_info[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in range(0, $"..".chi_elements_gui_settings.size()):
		get_node($"..".chi_elements_gui_settings[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in range(0, $"..".chi_elements_gui_langtest.size()):
		get_node($"..".chi_elements_gui_langtest[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in range(0, $"..".chi_elements_gui_message.size()):
		get_node($"..".chi_elements_gui_message[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in range(0, $"..".chi_elements_gui_about.size()):
		get_node($"..".chi_elements_gui_about[chitem]).set("custom_fonts/font", chi_font_base);

func chi_font_base_set_settings(size, outliine_size, outline_color:Color):
	chi_font_base.size = size;
	chi_font_base.outline_size = outliine_size;
	chi_font_base.outline_color = outline_color;

func chi_localization_save_to_file():
	if not chi_locale_dir.dir_exists(chi_locale_path):
		chi_locale_dir.open(chi_exe_directory);
		chi_locale_dir.make_dir("Localization");
	
	if chi_locale_dir.dir_exists(chi_locale_path):
		chi_localization.set_value("Locale", "WindowTitle", "ChimbaBench");
		chi_localization.set_value("Button_Main_GUI", "Settings", get_node($"..".chi_elements_gui[0]).text);
		chi_localization.set_value("Button_Main_GUI", "Language_test", get_node($"..".chi_elements_gui[1]).text);

		chi_localization.save(chi_locale_file);

func chi_localization_load_from_file():
	if chi_locale_dir.dir_exists(chi_locale_path) and chi_locale_dir.file_exists(chi_locale_file):
		var chi_load_localization = chi_localization.load(chi_locale_file);
		if chi_load_localization == OK:
			OS.set_window_title(chi_localization.get_value("Locale", "WindowTitle"));
			get_node($"..".chi_elements_gui[0]).text = chi_localization.get_value("Button_Main_GUI", "Settings");
			get_node($"..".chi_elements_gui[1]).text = chi_localization.get_value("Button_Main_GUI", "Language_test");

func _on_BTN_Settings_pressed():
	$Settings.visible = true;

func _on_BTN_LangTest_pressed():
	$LangTest.visible = true;

func _on_BTN_Load_Locale_pressed():
	chi_localization_load_from_file();

func _on_BTN_Save_Locale_pressed():
	chi_localization_save_to_file();

func _on_BTN_About_pressed():
	$About.visible = true;
