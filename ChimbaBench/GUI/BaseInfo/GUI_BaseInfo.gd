extends Control

export var more_info : bool = false;
export(String, FILE) var font_data = "res://Fonts/determination2/determination2.ttf";

var chi_project_name_and_version = "ChimbaBench 2.0 (GPLv3+)\n";
var chi_font = {"main":0, "small":0,
	"size_main_s":24, "size_main_m":32, "size_main_l":44,
	"size_small_s":20, "size_small_m":24, "size_small_l":32,
	"outline_s":2, "outline_m":3, "outline_l":4, "active":5, "active_2":0}

var chi_render_size = {"x":0, "y":0};
var chi_windows_size = {"x":0, "y":0};

var chi_elements_gui_baseinfo = {
	"base_system" : "BaseSystemInfo",
	"base_perf" : "BasePerfInfo"
};

func _ready():
	chi_prepare();
	get_tree().get_root().connect("size_changed", self, "on_resize");
	
	for chitem in chi_elements_gui_baseinfo:
		get_node(chi_elements_gui_baseinfo[chitem]).set("custom_fonts/font", chi_font.main);

func on_resize():
	$BaseSystemInfo.chi_info();
	chi_adaptive_prepare();
	
func chi_prepare():
	chi_font.main = DynamicFont.new();
	chi_font.small = DynamicFont.new();
	chi_render_size = OS.get_window_safe_area().size;
	$BaseSystemInfo.chi_info();
	rect_size = chi_render_size;
	chi_font.main = chi_font_set();
	chi_font.small = chi_font_set();
	chi_adaptive_prepare();

func chi_adaptive_prepare():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	if chi_render_size.x <= 1920:
		chi_font.active_2 = 0;
		if chi_font.active != chi_font.active_2:
			chi_font_set_settings(chi_font.main, chi_font.size_main_s, chi_font.outline_s);
		chi_font.active = chi_font.active_2;
	if chi_render_size.x > 1920 and chi_render_size.x <= 2560:
		chi_font.active_2 = 1;
		if chi_font.active != chi_font.active_2:
			chi_font_set_settings(chi_font.main, chi_font.size_main_m, chi_font.outline_m);
		chi_font.active = chi_font.active_2;
	if chi_render_size.x > 2560:
		chi_font.active_2 = 2;
		if chi_font.active != chi_font.active_2:
			chi_font_set_settings(chi_font.main, chi_font.size_main_l, chi_font.outline_l);
		chi_font.active = chi_font.active_2;
	$BasePerfInfo.rect_position.x = chi_render_size.x - 650;

func chi_font_set():
	var font = DynamicFont.new();
	font.font_data = load(font_data);
	return font;

func chi_font_set_settings(font, fsize = 24, outliine_size = 2, outline_color:Color = Color(0.2, 0.2, 0.30, 1)):
	font.size = fsize;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;

