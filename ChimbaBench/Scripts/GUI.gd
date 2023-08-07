extends Control

const root = "/root/ChimbaBench";
var chi_render_size = Vector2(0, 0);


var chi_font_base = DynamicFont.new();
var chi_font_base_small = DynamicFont.new();

var chi_locale_path;
var chi_locale_file;
var chi_locale_dir = Directory.new();
var chi_localization = ConfigFile.new();

var chi_exe_directory;

var chi_font = { "outline_s":1, "outline_m":2, "outline_l":3, "outline_xl":4 };
export(String, FILE) var font_data = "res://Fonts/determination2/determination2.ttf";


var chi_btn_size = Vector2(0, 0);
var chi_btn_box_size = Vector2(0, 0);
var chi_sel_size = Vector2(0, 0);
export var chi_btn_mult = Vector2(6, 4);
export var chi_btn_box_mult = Vector2(6, 1);
export var chi_sel_mult = Vector2(3.5, 8);

func _ready():
	chi_exe_directory = get_node(root).chi_executable_dir;
	chi_locale_file = chi_exe_directory + "/Localization/GUI.cfg";
	chi_locale_path = chi_exe_directory + "/Localization";

	chi_font_base = chi_font_set();
	chi_font_base_small = chi_font_set();
	chi_font_apply();
	chi_font_apply_text();
	
func on_resize():
	chi_btn_size.x = chi_render_size.x / chi_btn_mult.x;
	chi_btn_size.y = chi_btn_size.x / chi_btn_mult.y;
	chi_btn_box_size.x = chi_btn_size.y;
	chi_btn_box_size.y = chi_btn_box_size.x;
	
	chi_sel_size.x = chi_render_size.x / chi_sel_mult.x;
	chi_sel_size.y = chi_sel_size.x / chi_sel_mult.y;
	
	for chi_item in get_node(root).chi_nodes:
		get_node(get_node(root).chi_nodes[chi_item]).chi_btn_size = chi_btn_size;
		get_node(get_node(root).chi_nodes[chi_item]).chi_btn_box_size = chi_btn_box_size;
		get_node(get_node(root).chi_nodes[chi_item]).rect_size = chi_render_size;
	for chi_item in get_node(root).chi_btn_gui:
		get_node(get_node(root).chi_btn_gui[chi_item]).rect_size = chi_btn_size;
	for chi_item in get_node(root).chi_btn_box_gui:
		get_node(get_node(root).chi_btn_box_gui[chi_item]).rect_size = chi_btn_box_size;
	for chi_item in get_node(root).chi_sel:
		get_node(get_node(root).chi_sel[chi_item]).rect_size = chi_sel_size;
	for chi_item in get_node(root).chi_backgrounds:
		get_node(get_node(root).chi_backgrounds[chi_item]).rect_size = chi_render_size - Vector2(20, 20);
		get_node(get_node(root).chi_backgrounds[chi_item]).rect_position = Vector2(10, 10);
		get_node(get_node(root).chi_backgrounds[chi_item]).color = Color(0.25, 0.25, 0.25, 0.95);
	
	if chi_render_size.x <= 640:
		chi_font_set_settings(chi_font_base, 16, chi_font.outline_s);
		chi_font_set_settings(chi_font_base_small, 14, chi_font.outline_s);
	if chi_render_size.x > 640 and chi_render_size.x < 1920:
		chi_font_set_settings(chi_font_base, chi_render_size.x/48, chi_font.outline_m);
		chi_font_set_settings(chi_font_base_small, chi_render_size.x/56, chi_font.outline_s);
	if chi_render_size.x >= 1920 and chi_render_size.x <= 2560:
		chi_font_set_settings(chi_font_base, chi_render_size.x/48, chi_font.outline_l);
		chi_font_set_settings(chi_font_base_small, chi_render_size.x/56, chi_font.outline_m);
	if chi_render_size.x > 2560:
		chi_font_set_settings(chi_font_base, chi_render_size.x/48, chi_font.outline_xl);
		chi_font_set_settings(chi_font_base_small, chi_render_size.x/56, chi_font.outline_l);
	
	$Main_Controls.on_resize();
	$System_Info.on_resize();
	$Settings.on_resize();
	$Font_Test.on_resize();
	$About.on_resize();
	$Message.on_resize();

func chi_font_apply():
	for chitem in get_node(root).chi_labels:
		get_node(get_node(root).chi_labels[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in get_node(root).chi_sel:
		get_node(get_node(root).chi_sel[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in get_node(root).chi_btn_gui:
		get_node(get_node(root).chi_btn_gui[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in get_node(root).chi_btn_box_gui:
		get_node(get_node(root).chi_btn_box_gui[chitem]).set("custom_fonts/font", chi_font_base);
	for chitem in get_node(root).chi_other:
		get_node(get_node(root).chi_other[chitem]).set("custom_fonts/font", chi_font_base);

func chi_font_apply_text():
	get_node(get_node(root).chi_other["message_msg"]).set("custom_fonts/font", chi_font_base_small);

func chi_font_set():
	var font = DynamicFont.new();
	font.font_data = load(font_data);
	return font;

func chi_font_set_settings(font, size, outliine_size = 0, outline_color:Color = Color(0.2, 0.2, 0.30, 1)):
	font.size = size;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;

func _on_BTN_Settings_pressed():
	get_node(get_node(root).node_settings).visible = true;

func _on_BTN_About_pressed():
	get_node(get_node(root).node_about).visible = true;

func _on_BTN_SystemInfo_pressed():
	get_node(get_node(root).node_system_info).visible = true;

func _on_BTN_FontTest_pressed():
	get_node(get_node(root).node_font_test).visible = true;
