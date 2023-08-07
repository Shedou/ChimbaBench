extends Control

const root = "/root/ChimbaBench";
var chi_render_size = Vector2(0, 0);

var chi_btn_size = Vector2(0, 0);
var chi_btn_box_size = Vector2(0, 0);

var chi_langs_one:String;

var chi_langs_two:String;

var chi_font_user = DynamicFont.new();
var font_data = "res://Fonts/determination2/determination2.ttf";
var chi_font = { "size":0, "outline_s":1, "outline_m":2, "outline_l":3 };

var chi_key_shift = 0;

var chi_caption = "";

func _ready():
	chi_langs_one = "Short test (Unicode)" + chi_uni_base();
	
	$Langs_Main.text = chi_caption + chi_langs_one;
	$Font_Current.text = "Default Font - ( Determination2 )";
	
	chi_font.size = chi_render_size.x/44;
	chi_font_user = chi_font_set();
	chi_font_set_settings(chi_font_user, chi_font.size, chi_font.outline_s);
	set_fonts();

func chi_uni_base():
	var temp = 0;
	var string:String;
	temp = 45;
	string += "\nLatin (45-100): ";
	while temp <= 100:
		string += str(char(temp));
		temp += 1;

	temp = 1065;
	string += "\nCyrillic (1065-1110): ";
	while temp <= 1110:
		string += str(char(temp));
		temp += 1;

	temp = 900;
	string += "\nGreek (900-950): ";
	while temp <= 950:
		string += str(char(temp));
		temp += 1;
	
	temp = 1345;
	string += "\nArmenian (1345-1390): ";
	while temp <= 1390:
		string += str(char(temp));
		temp += 1;
	
	temp = 4280;
	string += "\nGeorgian (4280-4325): ";
	while temp <= 4325:
		string += str(char(temp));
		temp += 1;
	
	temp = 4395;
	string += "\nHangul Jamo (Korean) (4395-4430): ";
	while temp <= 4430:
		string += str(char(temp));
		temp += 1;
	
	temp = 12550;
	string += "\nBopomofo (Chinese) (12550-12580): ";
	while temp <= 12580:
		string += str(char(temp));
		temp += 1;

	temp = 12390;
	string += "\nHiragana (Jananese) (12390-12420): ";
	while temp <= 12420:
		string += str(char(temp));
		temp += 1;

	temp = 12490;
	string += "\nKatakana (Jananese) (12490-12520): ";
	while temp <= 12520:
		string += str(char(temp));
		temp += 1;
	
	temp = 1720;
	string += "\nArabic (1720-1750): ";
	while temp <= 1750:
		string += str(char(temp));
		temp += 1;
	
	temp = 2320;
	string += "\nDevanagari (Indic) (2304-2431): ";
	while temp <= 2350:
		string += str(char(temp));
		temp += 1;
	
	return string;

func chi_uni_cyrillic():
	var temp = 0;
	var string:String;



func on_resize():
	chi_font_size_Set(0, "0");
	
	$Background2.rect_size.x = chi_render_size.x - 40;
	$Background2.rect_size.y = chi_render_size.y / 1.75;
	$Background2.rect_position = Vector2(20, 20);
	
	$Langs_Main.rect_size.x = chi_render_size.x - 80;
	$Langs_Main.rect_size.y = chi_render_size.y / 1.75;
	$Langs_Main.rect_position = Vector2(40, 20);
	
#	$Langs_Other.rect_size.x = chi_render_size.x / 2 - 45;
#	$Langs_Other.rect_size.y = chi_render_size.y / 2;
#	$Langs_Other.rect_position = Vector2(chi_render_size.x - 40 - $Langs_Other.rect_size.x, 20);
	
	$Font_Current.rect_size.x = chi_render_size.x - 40;
	$Font_Current.rect_size.y = chi_render_size.y / 10;
	$Font_Current.rect_position = Vector2(20, 10 + $Background2.rect_size.y);
	
	$User_Text.rect_size.x = chi_render_size.x - 40;
	$User_Text.rect_size.y = chi_render_size.y / 5.5;
	$User_Text.rect_position = Vector2(20, $Background2.rect_size.y + $Font_Current.rect_size.y);
	
	$BTN_Close.rect_position = Vector2(20, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Select_Font.rect_position = Vector2(30 + chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	
	$BTN_Minus_x2.rect_position = Vector2(50 + chi_btn_size.x * 2, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Minus.rect_position = Vector2(60 + chi_btn_size.x * 2 + chi_btn_box_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Font_Size.rect_position = Vector2(70 + chi_btn_size.x * 2 + chi_btn_box_size.x * 2, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Plus.rect_position = Vector2(80 + chi_btn_size.x * 2 + chi_btn_box_size.x * 3, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Plus_x2.rect_position = Vector2(90 + chi_btn_size.x * 2 + chi_btn_box_size.x * 4, chi_render_size.y - 20 - chi_btn_size.y);

func _on_OpenFile_file_selected(path):
	var temp = path.substr(path.length() - 4, -1);
	if temp == ".ttf" or temp == ".otf":
		font_data = path;
		chi_font_user = chi_font_set();
		chi_font_set_settings(chi_font_user, chi_font.size, chi_font.outline_s);
		set_fonts();
		if path.length() >= 80:
			$Font_Current.text = str("..." + path.substr(path.length() - 80, -1));
		else: $Font_Current.text = str(path);
	else: get_node(root).chi_show_message("Bad file extension: \"" + path.substr(path.length() - 4, -1) + "\"", "Font not changed!");
		
func set_fonts():
	$"Langs_Main".set("custom_fonts/font", chi_font_user);
	$"Langs_Other".set("custom_fonts/font", chi_font_user);
	$"User_Text".set("custom_fonts/font", chi_font_user);

func chi_font_size_Set(index, dir, chi_key_10 = 0):
	if dir == "+" and chi_font.size < 142 and chi_key_shift == 0 and chi_key_10 == 0: chi_font.size += index;
	if dir == "+" and chi_font.size <= 132 and chi_key_shift == 1 and chi_key_10 == 1: chi_font.size += index;
	if dir == "+" and chi_font.size <= 122 and chi_key_shift == 1 and chi_key_10 == 0: chi_font.size += index;
	if dir == "-" and chi_font.size > 2 and chi_key_shift == 0 and chi_key_10 == 0: chi_font.size -= index;
	if dir == "-" and chi_font.size >= 12 and chi_key_shift == 1 and chi_key_10 == 1: chi_font.size -= index;
	if dir == "-" and chi_font.size >= 22 and chi_key_shift == 1 and chi_key_10 == 0: chi_font.size -= index;
	if dir == "0": chi_font.size = int(chi_render_size.x/48);
	
	$BTN_Font_Size.text = str(chi_font.size);
	chi_font_set_settings(chi_font_user, chi_font.size, chi_font.outline_s)
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



func _on_BTN_Minus_x2_pressed():
	if chi_key_shift == 1: chi_font_size_Set(20, "-");
	else: chi_font_size_Set(2, "-");

func _on_BTN_Minus_pressed():
	if chi_key_shift == 1: chi_font_size_Set(10, "-", 1);
	else: chi_font_size_Set(1, "-");

func _on_BTN_Font_Size_pressed():
	chi_font_size_Set(0, "0");

func _on_BTN_Plus_pressed():
	if chi_key_shift == 1: chi_font_size_Set(10, "+", 1);
	else: chi_font_size_Set(1, "+");

func _on_BTN_Plus_x2_pressed():
	if chi_key_shift == 1: chi_font_size_Set(20, "+");
	else: chi_font_size_Set(2, "+");

func _input(event):
	if event.is_action_pressed("shift"):
		chi_key_shift = 1;
	if event.is_action_released("shift"):
		chi_key_shift = 0;
