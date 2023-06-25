extends Control

var chi_font_base = DynamicFont.new();
var chi_font_base_small = DynamicFont.new();

var chi_locale_path;
var chi_locale_file;
var chi_locale_dir = Directory.new();
var chi_localization = ConfigFile.new();

var chi_exe_directory;

var chi_font = { "outline_s":2, "outline_m":3, "outline_l":4 };
export(String, FILE) var font_data = "res://Fonts/determination2/determination2.ttf";


var chi_render_size = Vector2(0, 0);
var chi_btn_size = Vector2(0, 0);
var chi_sel_size = Vector2(0, 0);
export var chi_btn_mult = Vector2(6, 4);
export var chi_sel_mult = Vector2(3.5, 8);

func _ready():
	chi_exe_directory = $"..".chi_executable_dir;
	chi_locale_file = chi_exe_directory + "/Localization/GUI.cfg";
	chi_locale_path = chi_exe_directory + "/Localization";

	chi_font_base = chi_font_set();
	chi_font_base_small = chi_font_set();
	chi_font_apply();
	chi_font_apply_text();
	
func on_resize():
	chi_render_size = OS.get_window_safe_area().size;
	
	chi_btn_size.x = chi_render_size.x / chi_btn_mult.x;
	chi_btn_size.y = chi_btn_size.x / chi_btn_mult.y;
	
	chi_sel_size.x = chi_render_size.x / chi_sel_mult.x;
	chi_sel_size.y = chi_sel_size.x / chi_sel_mult.y;
	
	for chi_item in $"/root/ChimbaBench".chi_nodes:
		get_node($"/root/ChimbaBench".chi_nodes[chi_item]).chi_btn_size = chi_btn_size;
		get_node($"/root/ChimbaBench".chi_nodes[chi_item]).chi_render_size = chi_render_size;
		get_node($"/root/ChimbaBench".chi_nodes[chi_item]).rect_size = chi_render_size;
	for chi_item in $"/root/ChimbaBench".chi_btn_gui:
		get_node($"/root/ChimbaBench".chi_btn_gui[chi_item]).rect_size = chi_btn_size;
	for chi_item in $"/root/ChimbaBench".chi_sel:
		get_node($"/root/ChimbaBench".chi_sel[chi_item]).rect_size = chi_sel_size;
	for chi_item in $"/root/ChimbaBench".chi_backgrounds:
		get_node($"/root/ChimbaBench".chi_backgrounds[chi_item]).rect_size = chi_render_size - Vector2(20, 20);
		get_node($"/root/ChimbaBench".chi_backgrounds[chi_item]).rect_position = Vector2(10, 10);
		get_node($"/root/ChimbaBench".chi_backgrounds[chi_item]).color = Color(0.25, 0.25, 0.25, 0.95);
	
	if chi_render_size.x <= 640:
		chi_font_set_settings(chi_font_base, 16, chi_font.outline_s);
		chi_font_set_settings(chi_font_base_small, 14, chi_font.outline_s);
	else:
		chi_font_set_settings(chi_font_base, chi_render_size.x/46, chi_font.outline_m);
		chi_font_set_settings(chi_font_base_small, chi_render_size.x/56, chi_font.outline_m);
	
	$Main_Controls.on_resize();
	$System_Info.on_resize();
	$Settings.on_resize();
	$Lang_Test.on_resize();
	$About.on_resize();
	$Message.on_resize();

func chi_font_apply():
	for chitem in $"/root/ChimbaBench".chi_labels:
		get_node($"/root/ChimbaBench".chi_labels[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_sel:
		get_node($"/root/ChimbaBench".chi_sel[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_btn_gui:
		get_node($"/root/ChimbaBench".chi_btn_gui[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in $"/root/ChimbaBench".chi_other:
		get_node($"/root/ChimbaBench".chi_other[chitem]).set("custom_fonts/font", chi_font_base);

func chi_font_apply_text():
	get_node($"/root/ChimbaBench".chi_other["message_msg"]).set("custom_fonts/font", chi_font_base_small);

func chi_font_set():
	var font = DynamicFont.new();
	font.font_data = load(font_data);
	return font;

func chi_font_set_settings(font, size, outliine_size = 0, outline_color:Color = Color(0.25, 0.25, 0.40, 1)):
	font.size = size;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;

func _on_BTN_Settings_pressed():
	get_node($"/root/ChimbaBench".chi_nodes["node_settings"]).visible = true;

func _on_BTN_LangTest_pressed():
	get_node($"/root/ChimbaBench".chi_nodes["node_lang_test"]).visible = true;

func _on_BTN_About_pressed():
	get_node($"/root/ChimbaBench".chi_nodes["node_about"]).visible = true;

func _on_BTN_SystemInfo_pressed():
	get_node($"/root/ChimbaBench".chi_nodes["node_system_info"]).visible = true;
