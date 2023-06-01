extends Control

var chi_render_size = Vector2(0,0);
var font_data = "res://Fonts/determination2/determination2.ttf";

var thread;
var chi_loop;
var timer;
var chi_test_result : float = 0;

var chi_font = {"main":0, "small":0,
	"size_main_s":24, "size_main_m":32, "size_main_l":44,
	"size_small_s":20, "size_small_m":24, "size_small_l":32,
	"outline_s":2, "outline_m":3, "outline_l":4, "active":5, "active_2":0}

var chi_windows_size = {"x":0, "y":0};

var chi_elements_gui_baseinfo = {
	"btn_back" : "BTN_Back",
	"btn_start" : "BTN_Start",
	"result" : "Result"
};

func _ready():
	thread = Thread.new();
	chi_prepare();
	get_tree().get_root().connect("size_changed", self, "on_resize");
	for chitem in chi_elements_gui_baseinfo:
		get_node(chi_elements_gui_baseinfo[chitem]).set("custom_fonts/font", chi_font.main);
	
func on_resize():
	chi_render_size = OS.get_window_safe_area().size;
	chi_adaptive_prepare();
	adaptive_buttons();

func adaptive_buttons():
	chi_render_size = OS.get_window_safe_area().size;
	$BTN_Back.rect_size.x = chi_render_size.x / 6;
	$BTN_Back.rect_size.y = $BTN_Back.rect_size.x / 4;
	$BTN_Back.rect_position = Vector2(10, (chi_render_size.y - 10) - $BTN_Back.rect_size.y);
	
	$BTN_Start.rect_size.x = chi_render_size.x / 6;
	$BTN_Start.rect_size.y = $BTN_Start.rect_size.x / 4;
	$BTN_Start.rect_position = Vector2(chi_render_size.x - 10 - $BTN_Start.rect_size.x, chi_render_size.y - 10 - $BTN_Start.rect_size.y);
	
	if chi_render_size.x <= 1920:
		$Result.rect_size.x = 360;
		$Result.rect_size.y = 90;
		$Result.rect_position = Vector2(20, 225);
	if chi_render_size.x > 1920 and chi_render_size.x <= 2560:
		$Result.rect_size.x = 460;
		$Result.rect_size.y = 115;
		$Result.rect_position = Vector2(20, 300);
	if chi_render_size.x > 2560:
		$Result.rect_size.x = 560;
		$Result.rect_size.y = 125;
		$Result.rect_position = Vector2(20, 400);
	
	$Result_BG.rect_size.x = $Result.rect_size.x + 16;
	$Result_BG.rect_size.y = $Result.rect_size.y;
	$Result_BG.rect_position.x = $Result.rect_position.x - 8;
	$Result_BG.rect_position.y = $Result.rect_position.y;
	
func chi_prepare():
	chi_font.main = DynamicFont.new();
	chi_font.small = DynamicFont.new();
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	chi_font.main = chi_font_set();
	chi_font.small = chi_font_set();
	chi_adaptive_prepare();

func chi_adaptive_prepare():
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

func chi_font_set():
	var font = DynamicFont.new();
	font.font_data = load(font_data);
	return font;

func chi_font_set_settings(font, fsize = 24, outliine_size = 2, outline_color:Color = Color(0.2, 0.2, 0.30, 1)):
	font.size = fsize;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;
	

func _on_BTN_Back_pressed():
	get_tree().change_scene("res://ChimbaBench.tscn");


func _on_BTN_Start_pressed():
	$Result_BG.visible = true;
	$Result.visible = true;
	chi_test_result = 0;
	$Result.text = "Preparing!";
	on_resize();
	$BTN_Start.disabled = true;
	$Timer.start();

func _on_Timer_timeout():
	chi_loop = 1;
	$Result.text = "Testing! (60 seconds)\nDon't touch mouse and keyboard!";
	on_resize();
	$Timer2.start();
	
func _on_Timer2_timeout():
	chi_loop = 0;
	$Result.text = "-----  ChimbaPoints: " + str(chi_test_result / 10) + " CPs  -----\n(CPs = total frames / 10)\nAverage FPS: " + str(stepify((chi_test_result / $Timer2.wait_time), 0.1));
	on_resize();
	$BTN_Start.disabled = false;

func _process(delta):
	if chi_loop == 1:
		chi_test_result = chi_test_result + 1;
