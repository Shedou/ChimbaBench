extends Control

var chi_render_size = Vector2(0,0);

func _ready():
	get_tree().get_root().connect("size_changed", self, "on_resize");
	if $"/root/ChimbaBench".chi_OS != "Windows":
		$BTN_Win_WMI.disabled = true;
	
func on_resize():
	adaptive_buttons();

func adaptive_buttons():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	$Background.rect_size.x = chi_render_size.x - 20;
	$Background.rect_size.y = chi_render_size.y - 20;
	$Background.rect_position = Vector2(10, 10);
	
	$Link_Git.rect_size.x = chi_render_size.x / 4;
	$Link_Git.rect_size.y = $Link_Git.rect_size.x / 2.25;
	$Link_Git.rect_position = Vector2(10, 20);
	
	$Link_Overs.rect_size.x = chi_render_size.x / 4;
	$Link_Overs.rect_size.y = $Link_Overs.rect_size.x / 2.25;
	$Link_Overs.rect_position = Vector2(10, (40 + $Link_Git.rect_size.y));
	
	$BTN_Close.rect_size.x = chi_render_size.x / 8;
	$BTN_Close.rect_size.y = $BTN_Close.rect_size.x / 3;
	$BTN_Close.rect_position = Vector2(20, (chi_render_size.y - 20) - $BTN_Close.rect_size.y);
	
	$TextAbout.rect_size.x = chi_render_size.x / 2.1;
	$TextAbout.rect_size.y = chi_render_size.y - 40;
	$TextAbout.rect_position = Vector2(chi_render_size.x - $TextAbout.rect_size.x - 20, chi_render_size.y - $TextAbout.rect_size.y - 20);



func _on_BTN_Close_pressed():
	visible = false;


func _on_Link_Overs_pressed():
	OS.shell_open("https://overclockers.ru/blog/Hard-Workshop");


func _on_Link_Git_pressed():
	OS.shell_open("https://github.com/Shedou/ChimbaBench");
