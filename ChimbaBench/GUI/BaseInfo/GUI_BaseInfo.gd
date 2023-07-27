extends Control

export var more_info : bool = false;
export(String, FILE) var font_data = "res://Fonts/determination2/determination2.ttf";

var chi_project_name_and_version = "ChimbaBench 2.3 (GPLv3+)";
var chi_bi_font = { "outline_s":2, "outline_m":3, "outline_l":4 }

var chi_bi_render_size = Vector2(0, 0);
var chi_bi_windows_size = Vector2(0, 0);


var chi_bi_font_m = DynamicFont.new();

var chi_elements_gui_baseinfo = { "base_system" : "BaseSystemInfo", "base_perf" : "BasePerfInfo" };

func _ready():
	chi_prepare();
	get_tree().get_root().connect("size_changed", self, "on_resize");
	
	for chitem in chi_elements_gui_baseinfo:
		get_node(chi_elements_gui_baseinfo[chitem]).set("custom_fonts/font", chi_bi_font_m);

func on_resize():
	$BaseSystemInfo.chi_info();
	chi_adaptive_prepare();
	
func chi_prepare():
	chi_bi_render_size = OS.get_window_safe_area().size;
	$BaseSystemInfo.chi_info();
	rect_size = chi_bi_render_size;
	chi_bi_font_m = chi_font_set();
	chi_adaptive_prepare();
	$BasePerfInfo.chi_msaa_aniso_read();

func chi_adaptive_prepare():
	chi_bi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_bi_render_size;
	
	if chi_bi_render_size.x <= 640:
		chi_font_set_settings(chi_bi_font_m, 16, chi_bi_font.outline_s);
	if chi_bi_render_size.x > 640 and chi_bi_render_size.x < 1920:
		chi_font_set_settings(chi_bi_font_m, chi_bi_render_size.x/44, chi_bi_font.outline_s);
	if chi_bi_render_size.x >= 1920 and chi_bi_render_size.x < 2560:
		chi_font_set_settings(chi_bi_font_m, chi_bi_render_size.x/44, chi_bi_font.outline_m);
	if chi_bi_render_size.x >= 2560:
		chi_font_set_settings(chi_bi_font_m, chi_bi_render_size.x/44, chi_bi_font.outline_l);
	
	$BaseSystemInfo.rect_size.x = chi_bi_render_size.x / 2;
	$BaseSystemInfo.rect_position.x = 10;
	$BaseSystemInfo.rect_position.y = 10;
	
	$BasePerfInfo.rect_size.x = chi_bi_render_size.x / 2;
	$BasePerfInfo.rect_position.x = chi_bi_render_size.x - $BasePerfInfo.rect_size.x - 10;
	$BasePerfInfo.rect_position.y = 10;

func chi_font_set():
	var font = DynamicFont.new();
	font.font_data = load(font_data);
	return font;

func chi_font_set_settings(font, fsize = 24, outliine_size = 2, outline_color:Color = Color(0.2, 0.2, 0.30, 1)):
	font.size = fsize;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;

