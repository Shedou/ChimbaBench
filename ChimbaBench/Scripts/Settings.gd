extends Control

var chi_render_size = Vector2(0,0);
var chi_desktop_size = Vector2(0,0);


var chi_exe_directory;
var chi_sett_d = Directory.new();
var chi_sett_dir;
var chi_sett_file;
var chi_sett = ConfigFile.new();
var chi_sett_exe;

var chi_msaa = 0;
var chi_fxaa = false;
var chi_fxaa_sharp = 0;

var chi_resol = Vector2(1024, 600);
var chi_resol_fullscreen = false;
var chi_resolution = 2;

func _ready():
	chi_desktop_size = OS.get_screen_size();
	chi_vars_prepare();
	set_settings_msaa();
	set_settings_aniso();
	set_settings_resolution();

	get_tree().get_root().connect("size_changed", self, "on_resize");
	
func on_resize():
	adaptive_buttons();

func adaptive_buttons():
	chi_render_size = OS.get_window_safe_area().size;
	rect_size = chi_render_size;
	$Background.rect_size.x = chi_render_size.x - 20;
	$Background.rect_size.y = chi_render_size.y - 20;
	$Background.rect_position = Vector2(10, 10);
	
	$BTN_Close.rect_size.x = chi_render_size.x / 8;
	$BTN_Close.rect_size.y = $BTN_Close.rect_size.x / 3;
	$BTN_Close.rect_position = Vector2(20, (chi_render_size.y - 20) - $BTN_Close.rect_size.y);
	
	$SEL_MSAA.rect_size.x = chi_render_size.x / 3.5;
	$SEL_MSAA.rect_size.y = $SEL_MSAA.rect_size.x / 8;
	$SEL_MSAA.rect_position = Vector2(20, 20);
	
	$SEL_Aniso.rect_size.x = chi_render_size.x / 3.5;
	$SEL_Aniso.rect_size.y = $SEL_Aniso.rect_size.x / 8;
	$SEL_Aniso.rect_position = Vector2(20, 30 + $SEL_MSAA.rect_size.y);
	
	$SEL_resolution.rect_size.x = chi_render_size.x / 3.5;
	$SEL_resolution.rect_size.y = $SEL_resolution.rect_size.x / 8;
	$SEL_resolution.rect_position = Vector2(20, 40 + $SEL_Aniso.rect_size.y + $SEL_MSAA.rect_size.y);
	
	$CHECK_Fullscreen.rect_size.x = chi_render_size.x / 3.5;
	$CHECK_Fullscreen.rect_size.y = $CHECK_Fullscreen.rect_size.x / 8;
	$CHECK_Fullscreen.rect_position = Vector2(20, 50 + $SEL_Aniso.rect_size.y + $SEL_MSAA.rect_size.y + $SEL_resolution.rect_size.y);
	
	$BTN_SelectFont.rect_size.x = chi_render_size.x / 6;
	$BTN_SelectFont.rect_size.y = $BTN_SelectFont.rect_size.x / 3;
	$BTN_SelectFont.rect_position = Vector2(chi_render_size.x - 20 - $BTN_SelectFont.rect_size.x, 20);
	
	$BTN_Save.rect_size.x = chi_render_size.x / 6;
	$BTN_Save.rect_size.y = $BTN_Save.rect_size.x / 3;
	$BTN_Save.rect_position = Vector2(chi_render_size.x - 20 - $BTN_Save.rect_size.x, $BTN_SelectFont.rect_size.y + 40);
	
func chi_settings_save_to_file():
	if not chi_sett_d.dir_exists(chi_sett_dir):
		chi_sett_d.open(chi_sett_exe);
		chi_sett_d.make_dir("Settings");
	
	if chi_sett_d.dir_exists(chi_sett_dir):
		chi_sett.set_value("Font", "CustomFont", $"..".font_data);
		chi_sett.set_value("Main", "MSAA", chi_msaa);
		chi_sett.set_value("Main", "FXAA", chi_fxaa);
		chi_sett.set_value("Main", "FXAA_Sharp", chi_fxaa_sharp);
		chi_sett.set_value("Main", "Resolution", chi_resolution);
		chi_sett.set_value("Main", "Fullscreen", chi_resol_fullscreen);
		chi_sett.save(chi_sett_file);
		return 1;

func chi_settings_load_from_file():
	if chi_sett_d.dir_exists(chi_sett_dir) and chi_sett_d.file_exists(chi_sett_file):
		var chi_load_sett = chi_sett.load(chi_sett_file);
		if chi_load_sett == OK:
			$"..".font_data = chi_sett.get_value("Font", "CustomFont");
			_on_SEL_MSAA_item_selected(chi_sett.get_value("Main", "MSAA"));
			chi_screen_set(chi_sett.get_value("Main", "Fullscreen"), chi_sett.get_value("Main", "Resolution"));
			$SEL_resolution.select($SEL_resolution.get_item_id(chi_resolution));
			

func set_settings_msaa():
	$SEL_MSAA.add_item("MSAA Disable", 0);
	$SEL_MSAA.add_item("MSAA 2x", 1);
	$SEL_MSAA.add_item("MSAA 4x", 2);
	$SEL_MSAA.add_item("MSAA 8x", 3);
	$SEL_MSAA.add_item("MSAA 16x", 4);
	$SEL_MSAA.add_item("MSAA AVR 2x", 5);
	$SEL_MSAA.add_item("MSAA AVR 4x", 6);
	$SEL_MSAA.select(ProjectSettings.get_setting("rendering/quality/filters/msaa"));
	
func set_settings_fxaa():
	pass

func set_settings_aniso():
	$SEL_Aniso.add_item("Anisotropy 1x", 0);
	$SEL_Aniso.add_item("Anisotropy 2x", 1);
	$SEL_Aniso.add_item("Anisotropy 3x", 2);
	$SEL_Aniso.add_item("Anisotropy 4x", 3);
	$SEL_Aniso.add_item("Anisotropy 5x", 4);
	$SEL_Aniso.add_item("Anisotropy 6x", 5);
	$SEL_Aniso.add_item("Anisotropy 7x", 6);
	$SEL_Aniso.add_item("Anisotropy 8x", 7);
	$SEL_Aniso.add_item("Anisotropy 9x", 8);
	$SEL_Aniso.add_item("Anisotropy 10x", 9);
	$SEL_Aniso.add_item("Anisotropy 11x", 10);
	$SEL_Aniso.add_item("Anisotropy 12x", 11);
	$SEL_Aniso.add_item("Anisotropy 13x", 12);
	$SEL_Aniso.add_item("Anisotropy 14x", 13);
	$SEL_Aniso.add_item("Anisotropy 15x", 14);
	$SEL_Aniso.add_item("Anisotropy 16x", 15);
	$SEL_Aniso.select((ProjectSettings.get_setting("rendering/quality/filters/anisotropic_filter_level")) - 1);

func chi_vars_prepare():
	chi_sett_exe = $"../..".chi_executable_dir;
	chi_sett_file = chi_sett_exe + "/Settings/Main.cfg";
	chi_sett_dir = chi_sett_exe + "/Settings";

func _on_BTN_Close_pressed():
	visible = false;


func _on_SEL_MSAA_item_selected(index):
	ProjectSettings.set_setting("rendering/quality/filters/msaa", index);
	var c_RID = $"/root".get_viewport_rid();
	VisualServer.viewport_set_msaa(c_RID, index);
	$"..".get_node("GUI_BaseInfo/BasePerfInfo").chi_msaa_fxaa_read();
	chi_msaa = index;
	$SEL_MSAA.select(ProjectSettings.get_setting("rendering/quality/filters/msaa"));

func _on_SEL_Aniso_item_selected(index):
	ProjectSettings.set_setting("rendering/quality/filters/anisotropic_filter_level", index+1);
	$"..".get_node("GUI_BaseInfo/BasePerfInfo").chi_msaa_aniso_read();


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
		$"../..".chi_resize();
		$"../..".chi_show_message(str(path), "Font changed!");

func _on_BTN_Save_pressed():
	if chi_settings_save_to_file() == 1:
		$"../..".chi_show_message("Settings saved to file:\n" + str(chi_sett_file), "Settings Saved!");
	var ok = $"..".chi_localization_save_to_file();
	if ok:
		$"/root/ChimbaBench".chi_show_message("Localization saved:\n" + str($"..".chi_locale_file), "Settings Saved!");


func _on_BTN_SelectFont_pressed():
		$OpenFile.popup_centered(chi_render_size * 0.7);

func set_settings_resolution():
	$SEL_resolution.add_item("640x360 - 0.23 MP", 0);
	$SEL_resolution.add_item("800x600 - 0.48 MP", 1);
	$SEL_resolution.add_item("1280x720 - 0.92 MP", 2);
	$SEL_resolution.add_item("1920x1080 - 2.07 MP", 3);
	$SEL_resolution.add_item("2560x1440 - 3.69 MP", 4);
	$SEL_resolution.add_item("3840x2160 - 8.29 MP", 5);
	$SEL_resolution.add_item("7680x4320 - 33.18 MP", 6);
	$SEL_resolution.add_separator();
	$SEL_resolution.add_item("640x480 - 0.31 MP", 7);
	$SEL_resolution.add_item("1024x768 - 0.79 MP", 8);
	$SEL_resolution.add_item("1366x768 - 1.05 MP", 9);
	$SEL_resolution.add_item("1440x900 - 1.30 MP", 8);
	$SEL_resolution.add_item("1280x1024 - 1.31 MP", 11);
	$SEL_resolution.add_item("1600x900 - 1.44 MP", 12);
	$SEL_resolution.add_item("1920x1200 - 2.30 MP", 13);
	$SEL_resolution.add_item("2560x1080 - 2.76 MP", 14);
	$SEL_resolution.add_item("2560x1600 - 4.10 MP", 15);
	$SEL_resolution.add_item("3440x1440 - 4.82 MP", 16);
	$SEL_resolution.select($SEL_resolution.get_item_id(chi_resolution));
var chi_resols = {
	0:640,100:360,
	1:800,101:600,
	2:1280,102:720,
	3:1920,103:1080,
	4:2560,104:1440,
	5:3840,105:2160,
	6:7680,106:4320,
	7:640,107:480,
	8:1024,108:768,
	9:1366,109:768,
	10:1440,110:900,
	11:1280,111:1024,
	12:1600,112:900,
	13:1920,113:1200,
	14:2560,114:1080,
	15:2560,115:1600,
	16:3440,116:1440
};

func _on_SEL_resolution_item_selected(index):
	if chi_resol_fullscreen == false and chi_desktop_size.x >= chi_resols[$SEL_resolution.get_item_id(index)] and chi_desktop_size.y >= chi_resols[$SEL_resolution.get_item_id(index)+100]:
		OS.set_window_size(Vector2(chi_resols[$SEL_resolution.get_item_id(index)],chi_resols[$SEL_resolution.get_item_id(index)+100]));
		OS.set_window_fullscreen(true);
		OS.set_window_fullscreen(false);
		chi_resolution = index;
		var screen_size = OS.get_screen_size();
		var window_size = OS.get_window_size();
		OS.set_window_position(screen_size*0.5 - window_size*0.5);


func _on_CHECK_Fullscreen_toggled(button_pressed):
	if button_pressed:
		chi_resol_fullscreen = true;
		OS.set_window_fullscreen(true);
		$SEL_resolution.disabled = true;
	else:
		chi_resol_fullscreen = false;
		OS.set_window_fullscreen(false);
		$SEL_resolution.disabled = false;

func chi_screen_set(fullscreen, resolution):
	if fullscreen == true:
		OS.set_window_fullscreen(true);
		$SEL_resolution.disabled = true;
		chi_resol_fullscreen = true;
		$CHECK_Fullscreen.pressed = true;
	if chi_resol_fullscreen == false:
		_on_SEL_resolution_item_selected(resolution);
	
	
