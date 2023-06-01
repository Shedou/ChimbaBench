extends Control

var chi_render_size = Vector2(0,0);

func _ready():
	get_tree().get_root().connect("size_changed", self, "on_resize");
	
func on_resize():
	adaptive_buttons();

func adaptive_buttons():
	chi_render_size = OS.get_window_safe_area().size;
	$BTN_About.rect_size.x = chi_render_size.x / 8;
	$BTN_About.rect_size.y = $BTN_About.rect_size.x / 3;
	$BTN_About.rect_position = Vector2((chi_render_size.x - 10) - $BTN_About.rect_size.x, (chi_render_size.y - 10) - $BTN_About.rect_size.y);
	
	$BTN_SystemInfo.rect_size.x = chi_render_size.x / 8;
	$BTN_SystemInfo.rect_size.y = $BTN_SystemInfo.rect_size.x / 3;
	$BTN_SystemInfo.rect_position = Vector2(((chi_render_size.x - 20) - $BTN_SystemInfo.rect_size.x) - $BTN_About.rect_size.x, (chi_render_size.y - 10) - $BTN_SystemInfo.rect_size.y);

	$BTN_Settings.rect_size.x = chi_render_size.x / 8;
	$BTN_Settings.rect_size.y = $BTN_Settings.rect_size.x / 3;
	$BTN_Settings.rect_position = Vector2(10, (chi_render_size.y - 10) - $BTN_Settings.rect_size.y);
	
	$BTN_SBox.rect_size.x = chi_render_size.x / 8;
	$BTN_SBox.rect_size.y = $BTN_SBox.rect_size.x / 3;
	$BTN_SBox.rect_position = Vector2(10, (chi_render_size.y - 20) - $BTN_SBox.rect_size.y - $BTN_Settings.rect_size.y);
	
	$BTN_LangTest.rect_size.x = chi_render_size.x / 8;
	$BTN_LangTest.rect_size.y = $BTN_LangTest.rect_size.x / 3;
	$BTN_LangTest.rect_position = Vector2((20 + $BTN_Settings.rect_size.x), (chi_render_size.y - 10) - $BTN_LangTest.rect_size.y);
