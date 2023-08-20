extends Control

const root = "/root/ChimbaBench";
var chi_render_size = Vector2(0, 0);

var chi_btn_size = Vector2(0, 0);
var chi_short_size = Vector2(0, 0);
var chi_wide_size = Vector2(0, 0);

var chi_txt_size = Vector2(0, 0);
var chi_links_size = Vector2(0, 0);

func on_resize():
	
	chi_links_size.x = chi_render_size.x / 4;
	chi_links_size.y = chi_links_size.x / 2.25;
	chi_txt_size = Vector2(chi_render_size.x - 40, chi_render_size.y - 60 - chi_links_size.y - chi_btn_size.y);
	
	$Link_Git.rect_size = chi_links_size;
	$Link_Git.rect_position = Vector2(10, 20);
	
	$Link_Overs.rect_size = chi_links_size;
	$Link_Overs.rect_position = Vector2((chi_render_size.x / 2) - (chi_links_size.x / 2), 20);
	
	$Link_Godot.rect_size = chi_links_size;
	$Link_Godot.rect_position = Vector2(chi_render_size.x - 10 - chi_links_size.x, 20);
	
	$TXT_About.rect_size = chi_txt_size;
	$TXT_About.rect_position = Vector2(20, 30 + chi_links_size.y);
	
	$TXT_License.rect_size = chi_txt_size;
	$TXT_License.rect_position = Vector2(20, 30 + chi_links_size.y);
	
	$TXT_Used.rect_size = chi_txt_size;
	$TXT_Used.rect_position = Vector2(20, 30 + chi_links_size.y);
	
	$TXT_4B.rect_size = chi_txt_size;
	$TXT_4B.rect_position = Vector2(20, 30 + chi_links_size.y);
	
	$BTN_Close.rect_position = Vector2(20, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_About.rect_position = Vector2(30 + chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Used.rect_position = Vector2(40 + chi_btn_size.x * 2, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_License.rect_position = Vector2(50 + chi_btn_size.x * 3, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_4B.rect_position = Vector2(60 + chi_btn_size.x * 4, chi_render_size.y - 20 - chi_btn_size.y);

func _on_BTN_Close_pressed():
	visible = false;

func _on_Link_Overs_pressed():
	OS.shell_open("https://overclockers.ru/blog/Hard-Workshop");

func _on_Link_Git_pressed():
	OS.shell_open("https://github.com/Shedou/ChimbaBench");

func _on_Link_Godot_pressed():
	OS.shell_open("https://godotengine.org");

func _on_BTN_License_pressed():
	$BTN_About.disabled = false;
	$BTN_Used.disabled = false;
	$BTN_License.disabled = true;
	$BTN_4B.disabled = false;
	
	$TXT_About.visible = false;
	$TXT_Used.visible = false;
	$TXT_License.visible = true;
	$TXT_4B.visible = false;

func _on_BTN_Used_pressed():
	$BTN_About.disabled = false;
	$BTN_Used.disabled = true;
	$BTN_License.disabled = false;
	$BTN_4B.disabled = false;
	
	$TXT_About.visible = false;
	$TXT_Used.visible = true;
	$TXT_License.visible = false;
	$TXT_4B.visible = false;

func _on_BTN_About_pressed():
	$BTN_About.disabled = true;
	$BTN_Used.disabled = false;
	$BTN_License.disabled = false;
	$BTN_4B.disabled = false;
	
	$TXT_About.visible = true;
	$TXT_Used.visible = false;
	$TXT_License.visible = false;
	$TXT_4B.visible = false;

func _on_BTN_4B_pressed():
	$BTN_About.disabled = false;
	$BTN_Used.disabled = false;
	$BTN_License.disabled = false;
	$BTN_4B.disabled = true;
	
	$TXT_About.visible = false;
	$TXT_Used.visible = false;
	$TXT_License.visible = false;
	$TXT_4B.visible = true;
	
