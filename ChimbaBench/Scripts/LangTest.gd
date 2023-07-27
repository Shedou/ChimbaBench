extends Control

var chi_render_size = Vector2(0, 0);
var chi_btn_size = Vector2(0, 0);

var chi_langs_main : String = "Russian: \"тест\"\nEnglish: \"test\"\nChina: \"測試\"\nChina simpl.: \"测试\"\nJapan: \"テスト\"\nGeorgian: \"ტესტი\"\nDeutsch: \"prüfen\"";
var chi_langs_other : String = "Arabic: \"امتحان\"\nHindi: \"परीक्षा\"\nAmharic: \"ሙከራ\"\nArmenian: \"թեստ\"\nAssamese: \"পৰীক্ষা\"\nBambara: \"kɔrɔbɔli\"\nBengal: \"পরীক্ষা\"\nPunjabi: \"ਟੈਸਟ\"";

var chi_font_user = DynamicFont.new();
var font_data = "res://Fonts/determination2/determination2.ttf";
var chi_font = { "size":0, "outline_s":2, "outline_m":3, "outline_l":4 };


func _ready():
	$Langs_Main.text = "-- Main languages --\n" + chi_langs_main;
	$Langs_Other.text = "-- Other languages --\n" + chi_langs_other;
	sel_font_size();
	
	chi_font.size = chi_render_size.x/44;
	chi_font_user = chi_font_set();
	chi_font_set_settings(chi_font_user, chi_font.size, $"..".chi_font.outline_s);
	set_fonts();

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
	$SEL_Font_Size.rect_position = Vector2(40 + chi_btn_size.x * 2, chi_render_size.y - 20 - chi_btn_size.y);

func _on_OpenFile_file_selected(path):
	var temp = path.substr(path.length() - 4, -1);
	if temp == ".ttf" or temp == ".otf":
		font_data = path;
		chi_font_user = chi_font_set();
		chi_font_set_settings(chi_font_user, chi_font.size, $"..".chi_font.outline_s);
		set_fonts();
		$"../..".chi_show_message(str(path), "Font changed!");
		
func set_fonts():
	$"Langs_Main".set("custom_fonts/font", chi_font_user);
	$"Langs_Other".set("custom_fonts/font", chi_font_user);
	$"User_Text".set("custom_fonts/font", chi_font_user);

func sel_font_size():
	$SEL_Font_Size.add_item("Default Font Size", 0);
	$SEL_Font_Size.add_item("12", 12);
	$SEL_Font_Size.add_item("16", 16);
	$SEL_Font_Size.add_item("20", 20);
	$SEL_Font_Size.add_item("24", 24);
	$SEL_Font_Size.add_item("28", 28);
	$SEL_Font_Size.add_item("32", 32);
	$SEL_Font_Size.add_item("36", 36);
	$SEL_Font_Size.add_item("44", 44);
	$SEL_Font_Size.select(0);

func _on_SEL_Font_Size_item_selected(index):
	var item;
	item = $SEL_Font_Size.get_item_id(index);
	if item == 0: chi_font.size = chi_render_size.x/44;
	else: chi_font.size = item;
	chi_font_set_settings(chi_font_user, chi_font.size, $"..".chi_font.outline_s)
	set_fonts();

func chi_font_set():
	var font = DynamicFont.new();
	font.font_data = load(font_data);
	return font;

func chi_font_set_settings(font, size, outliine_size = 0, outline_color:Color = Color(0.25, 0.25, 0.40, 1)):
	font.size = size;
	font.outline_size = outliine_size;
	font.outline_color = outline_color;

func _on_BTN_SelectFont_pressed():
	$OpenFile.popup_centered(chi_render_size * 0.7);

func _on_BTN_Close_pressed():
	visible = false;

