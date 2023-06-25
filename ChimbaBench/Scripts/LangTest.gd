extends Control

var chi_render_size = Vector2(0, 0);
var chi_btn_size = Vector2(0, 0);

var chi_langs_main : String = "Russian: \"тест\"\nEnglish: \"test\"\nChina: \"測試\"\nChina simpl.: \"测试\"\nJapan: \"テスト\"\nGeorgian: \"ტესტი\"\nDeutsch: \"prüfen\"";
var chi_langs_other : String = "Arabic: \"امتحان\"\nHindi: \"परीक्षा\"\nAmharic: \"ሙከራ\"\nArmenian: \"թեստ\"\nAssamese: \"পৰীক্ষা\"\nBambara: \"kɔrɔbɔli\"\nBengal: \"পরীক্ষা\"\nPunjabi: \"ਟੈਸਟ\"";

func _ready():
	$Langs_Main.text = "- Main languages:\n" + chi_langs_main;
	$Langs_Other.text = "- Other languages:\n" + chi_langs_other;

func on_resize():
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
	
	$BTN_Close.rect_position = Vector2(20, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Select_Font.rect_position = Vector2(30 + chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y);

func _on_BTN_Close_pressed():
	visible = false;

func _on_OpenFile_file_selected(path):
	var temp = path.substr(path.length() - 4, -1);
	if temp == ".ttf" or temp == ".otf":
		$"..".font_data = path;
		$"..".chi_font_base = $"..".chi_font_set();
		$"..".chi_font_base_small = $"..".chi_font_set();
		$"..".chi_font_apply();
		$"..".chi_font_apply_text();
		$"..".chi_font_set_settings($"..".chi_font_base, chi_render_size.x/44, $"..".chi_font.outline_s);
		$"..".chi_font_set_settings($"..".chi_font_base_small, chi_render_size.x/54, $"..".chi_font.outline_s);
		$"../..".on_resize();
		$"../..".chi_show_message(str(path), "Font changed!");

func _on_BTN_SelectFont_pressed():
	$OpenFile.popup_centered(chi_render_size * 0.7);
