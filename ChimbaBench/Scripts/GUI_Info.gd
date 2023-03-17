extends Control
var dd = DynamicFont.new();

var executable_path = OS.get_executable_path().get_base_dir();
var dir_font = Directory.new();
var exec = executable_path + "/Font/FreeMonospaced.otf";

func _ready():
	
	if dir_font.dir_exists(executable_path + "/Font") == true and dir_font.file_exists(exec) == true:
		dd.font_data = load(exec);
	else:
		dd.font_data = load("res://Fonts/determination2/determination2.ttf");
	
	$Label4.text = exec;
	dd.size = 24;
	dd.outline_size = 2;
	dd.outline_color = Color(0.251961, 0.251961, 0.401961);
	$BaseSystemInfo.set("custom_fonts/font", dd);
	$NvidiaSmiInfo.set("custom_fonts/font", dd);
	$LanguageTest.set("custom_fonts/font", dd);
	$BasePerfInfo.set("custom_fonts/font", dd);

func _on_Button_pressed():
	pass # Replace with function body.
	dd.font_data = load("res://Fonts/determination2/determination2.ttf");
	$BaseSystemInfo.set("custom_fonts/font", dd);
	$NvidiaSmiInfo.set("custom_fonts/font", dd);
	$LanguageTest.set("custom_fonts/font", dd);
	$BasePerfInfo.set("custom_fonts/font", dd);



func _on_Button2_pressed():
	pass # Replace with function body.
	dd.font_data = load("res://Fonts/Xarrovv/Xarrovv.otf");
	$BaseSystemInfo.set("custom_fonts/font", dd);
	$NvidiaSmiInfo.set("custom_fonts/font", dd);
	$LanguageTest.set("custom_fonts/font", dd);
	$BasePerfInfo.set("custom_fonts/font", dd);
	
