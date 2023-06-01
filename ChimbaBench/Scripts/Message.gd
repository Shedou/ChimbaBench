extends Control

var chi_temp;
var chi_m2;
var chi_m3;
var chi_m4;
var chi_render_size = Vector2(0,0);

func _ready():
	get_tree().get_root().connect("size_changed", self, "on_resize");
	
func on_resize():
	chi_adaptive();
	
func chi_adaptive():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	chi_m2 = chi_render_size.x / 50;
	chi_m3 = chi_render_size.x / 30;
	chi_m4 = chi_render_size.x / 20;
	$Background.margin_left = chi_m2;
	$Background.margin_top = chi_m2;
	$Background.margin_right = chi_render_size.x - chi_m2;
	$Background.margin_bottom = chi_render_size.y - chi_m2;
	
	chi_temp = (chi_render_size.y + chi_render_size.x) / 26;
	$CAPT.margin_left = chi_m2;
	$CAPT.margin_top = chi_m2;
	$CAPT.margin_right = chi_render_size.x - chi_m2;
	if chi_temp > chi_m3:
		$CAPT.margin_bottom = chi_temp;
	else:
		$CAPT.margin_bottom = chi_m3;
	
	$BTN_Close.rect_size.x = chi_render_size.x / 8;
	$BTN_Close.rect_size.y = $BTN_Close.rect_size.x / 3;
	$BTN_Close.rect_position.x = (chi_render_size.x / 10) - ($BTN_Close.rect_size.x / 2);
	$BTN_Close.rect_position.y = chi_render_size.y - chi_m3 - $BTN_Close.rect_size.y;
	
	$MSG.margin_left = chi_m3;
	$MSG.margin_top = $CAPT.margin_bottom;
	$MSG.margin_right = chi_render_size.x - chi_m3;
	$MSG.margin_bottom = chi_render_size.y - chi_m4 - $BTN_Close.rect_size.y;


func _on_BTN_Close_pressed():
	visible = false;
