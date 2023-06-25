extends Control

var chi_render_size = Vector2(0,0);
var chi_windows_size = Vector2(0, 0);

var font_data = "res://Fonts/determination2/determination2.ttf";
var chi_font_m = DynamicFont.new();

var chi_loop;
var timer;
var chi_test_result : float = 0;

var chi_btn_size = Vector2(0, 0);
var chi_btn_mult = Vector2(5, 4);

var chi_benchmark_name = "Benchmark Name";
var chi_benchmark_info = "Benchmark Info";

var chi_elements_gui_baseinfo = {
	"result":"Result",
	"text":"About/msg/Text"
	};
var chi_btn = {
	"btn_back":"BTN_Back",
	"btn_start":"BTN_Start",
	"btn_info":"About/BTN_Info",
	"btn_close":"About/msg/BTN_Close"
	};

func _ready():
	chi_render_size = OS.get_window_safe_area().size;
	chi_font_m.font_data = load(font_data);
	get_tree().get_root().connect("size_changed", self, "on_resize");
	for chitem in chi_elements_gui_baseinfo:
		get_node(chi_elements_gui_baseinfo[chitem]).set("custom_fonts/font", chi_font_m);
	for chitem in chi_btn:
		get_node(chi_btn[chitem]).set("custom_fonts/font", chi_font_m);
	on_resize();

func on_resize():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	$About.rect_size = Vector2(0, 0);
	$About/msg.rect_size = chi_render_size;
	
	chi_btn_size.x = chi_render_size.x / chi_btn_mult.x;
	chi_btn_size.y = chi_btn_size.x / chi_btn_mult.y;
	
	for chi_item in chi_btn:
		get_node(chi_btn[chi_item]).rect_size = chi_btn_size;
	
	if chi_render_size.x <= 640:
		chi_font_set_settings(chi_font_m, 16, 2);
		$Result.rect_size = Vector2(250, 82);
		$Result.rect_position = Vector2(20, get_node("../GUI_BaseInfo/BaseSystemInfo").rect_size.y + 20);
	if chi_render_size.x > 640 and chi_render_size.x < 1920:
		chi_font_set_settings(chi_font_m, chi_render_size.x/44, 2);
		$Result.rect_size = Vector2(chi_render_size.x / 3, $Result.rect_size.x / 3);
		$Result.rect_position = Vector2(20, get_node("../GUI_BaseInfo/BaseSystemInfo").rect_size.y + 20);
	if chi_render_size.x >= 1920 and chi_render_size.x < 2560:
		chi_font_set_settings(chi_font_m, chi_render_size.x/44, 3);
		$Result.rect_size = Vector2(chi_render_size.x / 3, $Result.rect_size.x / 3);
		$Result.rect_position = Vector2(20, get_node("../GUI_BaseInfo/BaseSystemInfo").rect_size.y + 20);
	if chi_render_size.x >= 2560:
		chi_font_set_settings(chi_font_m, chi_render_size.x/44, 4);
		$Result.rect_size = Vector2(chi_render_size.x / 3, $Result.rect_size.x / 3);
		$Result.rect_position = Vector2(20, get_node("../GUI_BaseInfo/BaseSystemInfo").rect_size.y + 20);
	
	$BTN_Back.rect_position = Vector2(10, (chi_render_size.y - 10) - chi_btn_size.y);
	$BTN_Start.rect_position = Vector2(chi_render_size.x - 10 - chi_btn_size.x, chi_render_size.y - 10 - chi_btn_size.y);
	$About/BTN_Info.rect_position = Vector2((chi_render_size.x / 2) - (chi_btn_size.x / 2), chi_render_size.y - 10 - chi_btn_size.y);
	
	$About/msg/BTN_Close.rect_position = Vector2((chi_render_size.x / 2) - (chi_btn_size.x / 2), chi_render_size.y - 20 - chi_btn_size.y);
	
	$About/msg/Background.rect_size = chi_render_size - Vector2(20, 20);
	$About/msg/Background.rect_position = Vector2(10, 10);
	$About/msg/Background.color = Color(0.25, 0.25, 0.25, 0.95);
	
	$About/msg/Text.rect_size = chi_render_size - Vector2(40, 50 + chi_btn_size.y);
	$About/msg/Text.rect_position = Vector2(20, 20);
	
	$Result_BG.rect_size = Vector2($Result.rect_size.x + 16, $Result.rect_size.y);
	$Result_BG.rect_position = Vector2($Result.rect_position.x - 8, $Result.rect_position.y);

func chi_font_set_settings(font, fsize = 24, outliine_size = 2, outline_color:Color = Color(0.2, 0.2, 0.30, 1)):
	font.size = fsize;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;

func _on_BTN_Back_pressed():
	get_tree().change_scene("res://ChimbaBench.tscn");

func _on_BTN_Start_pressed():
	$Result_BG.visible = true;
	$Result.visible = true;
	$About.visible = false;
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
	$Result.text = chi_benchmark_name + "\n---  ChimbaPoints:  " + str(stepify(chi_test_result / 10, 0.1)) + " CPs  ---\n(CPs = total frames / 10)\nAverage FPS: " + str(stepify((chi_test_result / $Timer2.wait_time), 0.1));
	on_resize();
	$BTN_Start.disabled = false;
	$About.visible = true

func _process(delta):
	if chi_loop == 1:
		chi_test_result = chi_test_result + 1;


func _on_BTN_About_pressed():
	$About/msg/Text.text = chi_benchmark_name + "\n" + chi_benchmark_info;
	$About/msg.visible = true;


func _on_BTN_Close_pressed():
	$About/msg.visible = false;
