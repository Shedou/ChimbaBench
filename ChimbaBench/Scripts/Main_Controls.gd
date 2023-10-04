extends Control

const root = "/root/ChimbaBench";
var chi_render_size = Vector2(0, 0);

var chi_btn_size = Vector2(0, 0);
var chi_short_size = Vector2(0, 0);
var chi_wide_size = Vector2(0, 0);
var chi_sel_size = Vector2(0, 0);

func on_resize():
	$LBL_BTN_Main_Menu.rect_position = Vector2(10, chi_render_size.y - 40 - chi_btn_size.y * 4);
	$BTN_System_Info.rect_position = Vector2(10, chi_render_size.y - 30 - chi_btn_size.y * 3);
	$BTN_Settings.rect_position = Vector2(10, chi_render_size.y - 20 - chi_btn_size.y * 2);
	$BTN_Exit.rect_position = Vector2(10, chi_render_size.y - 10 - chi_btn_size.y);
	
	$LBL_BTN_Tests.rect_position = Vector2(20 + chi_btn_size.x, chi_render_size.y - 30 - chi_btn_size.y * 3);
	$BTN_GPU_Heavy.rect_position = Vector2(20 + chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y * 2);
	$BTN_SBox.rect_position = Vector2(20 + chi_btn_size.x, chi_render_size.y - 10 - chi_btn_size.y);
	
	$LBL_BTN_Other.rect_position = Vector2(chi_render_size.x - 10 - chi_btn_size.x, chi_render_size.y - 30 - chi_btn_size.y * 3);
	$BTN_Font_Test.rect_position = Vector2(chi_render_size.x - 10 - chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y * 2);
	$BTN_About.rect_position = Vector2(chi_render_size.x - 10 - chi_btn_size.x, chi_render_size.y - 10 - chi_btn_size.y);

func _on_BTN_Exit_pressed():
	get_tree().quit();

func _on_BTN_SBox_pressed():
	get_tree().change_scene("res://SC_SimpleBox/SimpleBox.tscn");

func _on_BTN_GPU_Heavy_pressed():
	get_tree().change_scene("res://SC_GPU_Heavy/GPUHeavy.tscn");
