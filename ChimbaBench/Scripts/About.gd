extends Control

var chi_render_size = Vector2(0, 0);
var chi_btn_size = Vector2(0, 0);

func on_resize():
	
	$Link_Git.rect_size.x = chi_render_size.x / 4;
	$Link_Git.rect_size.y = $Link_Git.rect_size.x / 2.25;
	$Link_Git.rect_position = Vector2(10, 20);
	
	$Link_Overs.rect_size.x = chi_render_size.x / 4;
	$Link_Overs.rect_size.y = $Link_Git.rect_size.x / 2.25;
	$Link_Overs.rect_position = Vector2((chi_render_size.x / 2) - ($Link_Git.rect_size.x / 2), 20);
	
	$Link_Godot.rect_size.x = chi_render_size.x / 4;
	$Link_Godot.rect_size.y = $Link_Godot.rect_size.x / 2.25;
	$Link_Godot.rect_position = Vector2(chi_render_size.x - 10 - $Link_Git.rect_size.x, 20);
	
	$TXT_License.rect_size.x = chi_render_size.x - 40;
	$TXT_License.rect_size.y = chi_render_size.y - 60 - $Link_Overs.rect_size.y - chi_btn_size.y;
	$TXT_License.rect_position = Vector2(20, 30 + $Link_Overs.rect_size.y);
	
	$TXT_Used.rect_size.x = chi_render_size.x - 40;
	$TXT_Used.rect_size.y = chi_render_size.y - 60 - $Link_Overs.rect_size.y - chi_btn_size.y;
	$TXT_Used.rect_position = Vector2(20, 30 + $Link_Overs.rect_size.y);
	
	$BTN_Close.rect_position = Vector2(20, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_License.rect_position = Vector2(30 + chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Used_Res.rect_position = Vector2(40 + chi_btn_size.x * 2, chi_render_size.y - 20 - chi_btn_size.y);

func _on_BTN_Close_pressed():
	visible = false;

func _on_Link_Overs_pressed():
	OS.shell_open("https://overclockers.ru/blog/Hard-Workshop");

func _on_Link_Git_pressed():
	OS.shell_open("https://github.com/Shedou/ChimbaBench");

func _on_Link_Godot_pressed():
	OS.shell_open("https://godotengine.org");

func _on_BTN_License_pressed():
	$BTN_License.disabled = true;
	$BTN_Used_Res.disabled = false;
	$TXT_License.visible = true;
	$TXT_Used.visible = false;

func _on_BTN_Used_Res_pressed():
	$BTN_License.disabled = false;
	$BTN_Used_Res.disabled = true;
	$TXT_License.visible = false;
	$TXT_Used.visible = true;

