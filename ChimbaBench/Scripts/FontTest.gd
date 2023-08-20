extends Control

const root = "/root/ChimbaBench";
const root_GUI = "/root/ChimbaBench/GUI";

var chi_render_size = Vector2(0, 0);

var chi_btn_size = Vector2(0, 0);
var chi_short_size = Vector2(0, 0);
var chi_wide_size = Vector2(0, 0);

var chi_langs_one:String;

var chi_font_user = DynamicFont.new();
var font_data = "res://Fonts/determination2/determination2.ttf";
var chi_font = { "size":0, "outline_s":1, "outline_m":2, "outline_l":3 };

var chi_keys = { "shift": 0 };

var chi_caption = "";

func _ready():
	chi_langs_one = "Short test (Unicode)" + chi_uni_base();
	
	$Langs_Main.text = chi_caption + chi_langs_one;
	$Font_Current.text = "Default Font - ( Determination2 )";
	
	chi_font.size = chi_render_size.x/44;
	chi_font_user = get_node(root_GUI).chi_font_set(font_data);
	get_node(root_GUI).chi_font_set_settings(chi_font_user, chi_font.size, chi_font.outline_s);
	set_fonts();

func chi_unicode(range_start:int, range_end:int):
	var counter = range_start;
	var string:String;
	
	while counter <= range_end:
		string += str(char(counter));
		counter += 1;
	
	return string;

func chi_uni_base():
	var string:String;
	string += "\nLatin (45-100): ";
	string += chi_unicode(45, 100);

	string += "\nCyrillic (1065-1110): ";
	string += chi_unicode(1065, 1110);

	string += "\nGreek (900-950): ";
	string += chi_unicode(900, 950);
	
	string += "\nArmenian (1345-1390): ";
	string += chi_unicode(1345, 1390);
	
	string += "\nGeorgian (4280-4325): ";
	string += chi_unicode(4280, 4325);
	
	string += "\nHangul Syllables (49980-50015): ";
	string += chi_unicode(49980, 50015);
	
	string += "\nBopomofo (12550-12580): ";
	string += chi_unicode(12550, 12580);

	string += "\nHiragana (12390-12420): ";
	string += chi_unicode(12390, 12420);

	string += "\nKatakana (12490-12520): ";
	string += chi_unicode(12490, 12520);
	
	string += "\nArabic (1720-1750): ";
	string += chi_unicode(1720, 1750);

	string += "\nDevanagari (2320-2350): ";
	string += chi_unicode(2320, 2350);
	
	return string;

func on_resize():
	chi_font_size_Set(0, "0");
	
	$Background2.rect_size.x = chi_render_size.x - 40;
	$Background2.rect_size.y = chi_render_size.y / 1.75;
	$Background2.rect_position = Vector2(20, 20);
	
	$Langs_Main.rect_size.x = chi_render_size.x - 80;
	$Langs_Main.rect_size.y = chi_render_size.y / 1.75;
	$Langs_Main.rect_position = Vector2(40, 20);
	
	$Font_Current.rect_size.x = chi_render_size.x - 40;
	$Font_Current.rect_size.y = chi_render_size.y / 10;
	$Font_Current.rect_position = Vector2(20, 10 + $Background2.rect_size.y);
	
	$User_Text.rect_size.x = chi_render_size.x - 40;
	$User_Text.rect_size.y = chi_render_size.y / 5.5;
	$User_Text.rect_position = Vector2(20, $Background2.rect_size.y + $Font_Current.rect_size.y);
	
	$BTN_Close.rect_position = Vector2(20, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Select_Font.rect_position = Vector2(30 + chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	
	$BTN_Minus_x2.rect_position = Vector2(50 + chi_btn_size.x * 2, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Minus.rect_position = Vector2(55 + chi_btn_size.x * 2 + chi_short_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Font_Size.rect_position = Vector2(60 + chi_btn_size.x * 2 + chi_short_size.x * 2, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Plus.rect_position = Vector2(65 + chi_btn_size.x * 2 + chi_short_size.x * 3, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Plus_x2.rect_position = Vector2(70 + chi_btn_size.x * 2 + chi_short_size.x * 4, chi_render_size.y - 20 - chi_btn_size.y);
	
	$LINE_From.rect_position = Vector2(90 + chi_btn_size.x * 2 + chi_short_size.x * 5, chi_render_size.y - 20 - chi_btn_size.y);
	$LBL_Spacer.rect_size = Vector2(chi_btn_size.y / 4, chi_btn_size.y);
	$LBL_Spacer.rect_position = Vector2(100 + chi_btn_size.x * 2 + chi_short_size.x * 5 + chi_wide_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	$LINE_To.rect_position = Vector2(110 + chi_btn_size.x * 2 + chi_short_size.x * 5 + chi_wide_size.x + $LBL_Spacer.rect_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Set.rect_position = Vector2(120 + chi_btn_size.x * 2 + chi_short_size.x * 5 + chi_wide_size.x * 2 + $LBL_Spacer.rect_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	
	$BTN_Help.rect_position = Vector2(chi_render_size.x - 20 - chi_wide_size.x, chi_render_size.y - 20 - chi_btn_size.y);

func _on_OpenFile_file_selected(path):
	var temp = path.substr(path.length() - 4, -1);
	if temp == ".ttf" or temp == ".otf":
		font_data = path;
		chi_font_user = get_node(root_GUI).chi_font_set(font_data);
		get_node(root_GUI).chi_font_set_settings(chi_font_user, chi_font.size, chi_font.outline_s);
		set_fonts();
		if path.length() >= 80:
			$Font_Current.text = str("..." + path.substr(path.length() - 80, -1));
		else: $Font_Current.text = str(path);
	else: get_node(root).chi_show_message("Bad file extension: \"" + path.substr(path.length() - 4, -1) + "\"", "Font not changed!");

func chi_font_size_Set(size, dir, chi_key_10 = 0):
	if dir == "+" and chi_font.size < 142 and chi_keys["shift"] == 0 and chi_key_10 == 0: chi_font.size += size;
	if dir == "+" and chi_font.size <= 132 and chi_keys["shift"] == 1 and chi_key_10 == 1: chi_font.size += size;
	if dir == "+" and chi_font.size <= 122 and chi_keys["shift"] == 1 and chi_key_10 == 0: chi_font.size += size;
	if dir == "-" and chi_font.size > 2 and chi_keys["shift"] == 0 and chi_key_10 == 0: chi_font.size -= size;
	if dir == "-" and chi_font.size >= 12 and chi_keys["shift"] == 1 and chi_key_10 == 1: chi_font.size -= size;
	if dir == "-" and chi_font.size >= 22 and chi_keys["shift"] == 1 and chi_key_10 == 0: chi_font.size -= size;
	if dir == "0": chi_font.size = int(chi_render_size.x/48);
	
	$BTN_Font_Size.text = str(chi_font.size);
	get_node(root_GUI).chi_font_set_settings(chi_font_user, chi_font.size, chi_font.outline_s)
	set_fonts();

func _on_BTN_SelectFont_pressed():
	$OpenFile.popup_centered(chi_render_size * 0.7);

func _on_BTN_Close_pressed():
	visible = false;

func _on_BTN_Minus_x2_pressed():
	if chi_keys["shift"] == 1: chi_font_size_Set(20, "-");
	else: chi_font_size_Set(2, "-");

func _on_BTN_Minus_pressed():
	if chi_keys["shift"] == 1: chi_font_size_Set(10, "-", 1);
	else: chi_font_size_Set(1, "-");

func _on_BTN_Font_Size_pressed():
	chi_font_size_Set(0, "0");

func _on_BTN_Plus_pressed():
	if chi_keys["shift"] == 1: chi_font_size_Set(10, "+", 1);
	else: chi_font_size_Set(1, "+");

func _on_BTN_Plus_x2_pressed():
	if chi_keys["shift"] == 1: chi_font_size_Set(20, "+");
	else: chi_font_size_Set(2, "+");

func _on_BTN_Set_pressed():
	var test:int = 0;
	var test2:int = 0;
	test = int($LINE_From.text);
	test2 = int($LINE_To.text);
	$Langs_Main.text = str("Attention! Feature under development!\n", test, " - ", test2);

func _on_BTN_Help_pressed():
	get_node(root).chi_show_message("\nButton -Select Font-:  Allows you to select a font file.\n\nButtons \"<<, <, >, >>\":  Сhange the font size, click on the current size number to reset.\nHold shift to change +-10/20 instead of +-1/2.\n\n\"Code - Code\" and button -SET-:  Feature under development. In the future, will allow you to select a range of Unicode characters to display.\n", "Font Test - Help");

func set_fonts():
	$"Langs_Main".set("custom_fonts/font", chi_font_user);
	$"User_Text".set("custom_fonts/font", chi_font_user);

