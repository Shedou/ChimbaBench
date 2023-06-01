extends Control

var chi_render_size = Vector2(0,0);

var chi_langs_main : String = "Russian: \"тест\"\nEnglish: \"test\"\nChina: \"測試\"\nChina simpl.: \"测试\"\nJapan: \"テスト\"\nGeorgian: \"ტესტი\"\nDeutsch: \"prüfen\"";
var chi_langs_other : String = "Arabic: \"امتحان\"\nHindi: \"परीक्षा\"\nAmharic: \"ሙከራ\"\nArmenian: \"թեստ\"\nAssamese: \"পৰীক্ষা\"\nBambara: \"kɔrɔbɔli\"\nBengal: \"পরীক্ষা\"\nPunjabi: \"ਟੈਸਟ\"";

func _ready():
	get_node($"../../".chi_elements_gui_langtest["langs_main"]).text = "- Main languages:\n" + chi_langs_main;
	get_node($"../../".chi_elements_gui_langtest["langs_other"]).text = "- Other languages:\n" + chi_langs_other;
	get_tree().get_root().connect("size_changed", self, "on_resize");
	
func on_resize():
	chi_render_size = OS.get_window_safe_area().size;
	adaptive_buttons();

func adaptive_buttons():
	rect_size = chi_render_size;
	$Background.rect_size.x = chi_render_size.x - 20;
	$Background.rect_size.y = chi_render_size.y - 20;
	$Background.rect_position = Vector2(10, 10);
	
	$Background2.rect_size.x = chi_render_size.x - 40;
	$Background2.rect_size.y = chi_render_size.y / 2.25;
	$Background2.rect_position = Vector2(20, 20);
	
	$Langs_Main.rect_size.x = chi_render_size.x / 2;
	$Langs_Main.rect_size.y = chi_render_size.y / 2.2;
	$Langs_Main.rect_position = Vector2(40, 20);
	
	$Langs_Other.rect_size.x = chi_render_size.x / 2;
	$Langs_Other.rect_size.y = chi_render_size.y / 2.25;
	$Langs_Other.rect_position = Vector2($Langs_Main.rect_size.x + 10, 20);
	
	$Font_Current.rect_size.x = chi_render_size.x - 40;
	$Font_Current.rect_size.y = chi_render_size.y / 10;
	$Font_Current.rect_position = Vector2(20, 10 + $Background2.rect_size.y);
	
	$User_Text.rect_size.x = chi_render_size.x - 40;
	$User_Text.rect_size.y = chi_render_size.y / 4;
	$User_Text.rect_position = Vector2(20, $Background2.rect_size.y + $Font_Current.rect_size.y);
	
	$BTN_Close.rect_size.x = chi_render_size.x / 8;
	$BTN_Close.rect_size.y = $BTN_Close.rect_size.x / 3;
	$BTN_Close.rect_position = Vector2(20, (chi_render_size.y - 20) - $BTN_Close.rect_size.y);
	


func _on_BTN_Close_pressed():
	visible = false;
