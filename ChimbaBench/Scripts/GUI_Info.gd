extends Control
var Chi_TestLang_A : String = "Amharic: \"ሙከራ\"\nArmenian: \"թեստ\"\nAssamese: \"পৰীক্ষা\"\nBambara: \"kɔrɔbɔli\"\nGeorgian: \"ტესტი\"\n";
var Chi_TestLang : String = "China: \"測試\"\nChina simpl.: \"测试\"\nEnglish: \"test\"\nHindi: \"परीक्षा\"\nArabic: \"امتحان\"\nBengal: \"পরীক্ষা\"\nRussian: \"тест\"\nJapan: \"テスト\"\nPunjabi: \"ਟੈਸਟ\"\nDeutsch: \"prüfen\"\n";
var dd = DynamicFont.new();

var executable_path = OS.get_executable_path().get_base_dir();
var dir_font = Directory.new();
var exec = executable_path + "/Font/FreeMonospaced.otf";

func _ready():
	
	if dir_font.dir_exists(executable_path + "/Font") == true and dir_font.file_exists(exec) == true:
		dd.font_data = load(exec);
	else:
		dd.font_data = load("res://Fonts/determination2/determination2.ttf");
	
	$Label.text = VisualServer.get_video_adapter_name();
	$Label2.text = Chi_TestLang_A;
	$Label3.text = Chi_TestLang;
	$Label4.text = exec;
	dd.size = 24;
	dd.outline_size = 2;
	dd.outline_color = Color(0.301961, 0.301961, 0.301961);
	$Label.set("custom_fonts/font", dd);
	$Label2.set("custom_fonts/font", dd);
	$Label3.set("custom_fonts/font", dd);
	$Label5.set("custom_fonts/font", dd);

func _process(delta):
	$Label5.text = "ChimbaBench 1.0 (GPLv3+)\nFPS: " + str(Performance.get_monitor(Performance.TIME_FPS)) + "\nDrawCalls 2D: " + str(Performance.get_monitor(Performance.RENDER_2D_DRAW_CALLS_IN_FRAME)) + "\nDrawCalls 3D: " + str(Performance.get_monitor(Performance.RENDER_DRAW_CALLS_IN_FRAME));


func _on_Button_pressed():
	pass # Replace with function body.
	dd.font_data = load("res://Fonts/determination2/determination2.ttf");
	$Label.set("custom_fonts/font", dd);
	$Label2.set("custom_fonts/font", dd);
	$Label3.set("custom_fonts/font", dd);



func _on_Button2_pressed():
	pass # Replace with function body.
	dd.font_data = load("res://Fonts/Xarrovv/Xarrovv.otf");
	$Label.set("custom_fonts/font", dd);
	$Label2.set("custom_fonts/font", dd);
	$Label3.set("custom_fonts/font", dd);
