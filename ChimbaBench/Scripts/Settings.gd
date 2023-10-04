extends Control

const root = "/root/ChimbaBench";
var chi_render_size = Vector2(0, 0);

var chi_desktop_size = Vector2(0, 0);

var chi_btn_size = Vector2(0, 0);
var chi_short_size = Vector2(0, 0);
var chi_wide_size = Vector2(0, 0);
var chi_sel_size = Vector2(0, 0);

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
var chi_resols = {
	0:640,100:360, 1:800,101:600, 2:1280,102:720, 3:1920,103:1080,
	4:2560,104:1440, 5:3840,105:2160, 6:7680,106:4320, 7:640,107:480,
	8:1024,108:768, 9:1366,109:768, 10:1440,110:900, 11:1280,111:1024,
	12:1600,112:900, 13:1920,113:1200, 14:2560,114:1080, 15:2560,115:1600,
	16:3440,116:1440 };

var chi_aniso_id = { 1:0, 2:1, 4:2, 8:3, 16:4 };
var chi_aniso_sel = 0;
var chi_aniso = 0;

var chi_restart_need = 0;

func _ready():
	chi_desktop_size = OS.get_screen_size();
	chi_sett_exe = get_node(root).chi_executable_dir;
	chi_sett_file = chi_sett_exe + "/Settings/Main.cfg";
	chi_sett_dir = chi_sett_exe + "/Settings";
	set_settings_msaa();
	set_settings_aniso();
	set_settings_resolution();

func on_resize():
	$BTN_Close.rect_position = Vector2(20, (chi_render_size.y - 20) - chi_btn_size.y);
	$BTN_Save.rect_position = Vector2(30 + chi_btn_size.x, (chi_render_size.y - 20) - chi_btn_size.y);
	
	$Left.rect_position = Vector2(20, 20);
	$Left.rect_size = Vector2(chi_render_size.x / 2 - 30, chi_render_size.y - 60 - chi_btn_size.y);
	$Left/BG.rect_position = Vector2(0, 0);
	$Left/BG.rect_size = $Left.rect_size;
	
	$Right.rect_position = Vector2(chi_render_size.x / 2 + 10, 20);
	$Right.rect_size = Vector2(chi_render_size.x / 2 - 30, chi_render_size.y - 60 - chi_btn_size.y);
	$Right/BG.rect_position = Vector2(0, 0);
	$Right/BG.rect_size = $Right.rect_size;
	
	$Left/SEL_MSAA.rect_position = Vector2(10, 10);
	$Left/SEL_Aniso.rect_position = Vector2(10, 20 + $Left/SEL_MSAA.rect_size.y);
	$Left/SEL_resolution.rect_position = Vector2(10, 30 + $Left/SEL_Aniso.rect_size.y + $Left/SEL_MSAA.rect_size.y);
	
	$Left/SEL_BTN_FullScreen.rect_position = Vector2(10, 40 + $Left/SEL_Aniso.rect_size.y + $Left/SEL_MSAA.rect_size.y + $Left/SEL_resolution.rect_size.y);


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
		ProjectSettings.save_custom("override.cfg");
		return 1;

func chi_settings_load_from_file():
	if chi_sett_d.dir_exists(chi_sett_dir) and chi_sett_d.file_exists(chi_sett_file):
		var chi_load_sett = chi_sett.load(chi_sett_file);
		if chi_load_sett == OK:
			_on_SEL_MSAA_item_selected(chi_sett.get_value("Main", "MSAA"));
			chi_screen_set(chi_sett.get_value("Main", "Fullscreen"), chi_sett.get_value("Main", "Resolution"));
			$Left/SEL_resolution.select($Left/SEL_resolution.get_item_id(chi_resolution));
			ProjectSettings.set_setting("window/size/resizable", false);
	chi_aniso_sel = ProjectSettings.get_setting("rendering/quality/filters/anisotropic_filter_level");

func chi_screen_set(fullscreen, resolution):
	if fullscreen == true:
		OS.set_window_fullscreen(true);
		$Left/SEL_resolution.disabled = true;
		chi_resol_fullscreen = true;
		$Left/SEL_BTN_FullScreen.pressed = true;
	if chi_resol_fullscreen == false:
		_on_SEL_resolution_item_selected(resolution);

func set_settings_msaa():
	$Left/SEL_MSAA.add_item("MSAA Disable", 0);
	$Left/SEL_MSAA.add_item("MSAA 2x", 1);
	$Left/SEL_MSAA.add_item("MSAA 4x", 2);
	$Left/SEL_MSAA.add_item("MSAA 8x", 3);
	$Left/SEL_MSAA.add_item("MSAA 16x", 4);
	$Left/SEL_MSAA.add_item("MSAA AVR 2x", 5);
	$Left/SEL_MSAA.add_item("MSAA AVR 4x", 6);
	$Left/SEL_MSAA.select(ProjectSettings.get_setting("rendering/quality/filters/msaa"));

func set_settings_fxaa():
	pass

func set_settings_aniso():
	$Left/SEL_Aniso.add_item("Disabled", 1);
	$Left/SEL_Aniso.add_item("Anisotropy 2x", 2);
	$Left/SEL_Aniso.add_item("Anisotropy 4x", 4);
	$Left/SEL_Aniso.add_item("Anisotropy 8x", 8);
	$Left/SEL_Aniso.add_item("Anisotropy 16x", 16);
	var chi_aniso_choice = ProjectSettings.get_setting("rendering/quality/filters/anisotropic_filter_level");
	$Left/SEL_Aniso.select(chi_aniso_id[chi_aniso_choice]);

func set_settings_resolution():
	$Left/SEL_resolution.add_item("640x360 - 0.23 MP", 0);
	$Left/SEL_resolution.add_item("800x600 - 0.48 MP", 1);
	$Left/SEL_resolution.add_item("1280x720 - 0.92 MP", 2);
	$Left/SEL_resolution.add_item("1920x1080 - 2.07 MP", 3);
	$Left/SEL_resolution.add_item("2560x1440 - 3.69 MP", 4);
	$Left/SEL_resolution.add_item("3840x2160 - 8.29 MP", 5);
	$Left/SEL_resolution.add_item("7680x4320 - 33.18 MP", 6);
	$Left/SEL_resolution.add_separator();
	$Left/SEL_resolution.add_item("640x480 - 0.31 MP", 7);
	$Left/SEL_resolution.add_item("1024x768 - 0.79 MP", 8);
	$Left/SEL_resolution.add_item("1366x768 - 1.05 MP", 9);
	$Left/SEL_resolution.add_item("1440x900 - 1.30 MP", 8);
	$Left/SEL_resolution.add_item("1280x1024 - 1.31 MP", 11);
	$Left/SEL_resolution.add_item("1600x900 - 1.44 MP", 12);
	$Left/SEL_resolution.add_item("1920x1200 - 2.30 MP", 13);
	$Left/SEL_resolution.add_item("2560x1080 - 2.76 MP", 14);
	$Left/SEL_resolution.add_item("2560x1600 - 4.10 MP", 15);
	$Left/SEL_resolution.add_item("3440x1440 - 4.82 MP", 16);
	$Left/SEL_resolution.select($Left/SEL_resolution.get_item_id(chi_resolution));

func _on_BTN_Close_pressed():
	visible = false;

func _on_SEL_MSAA_item_selected(index):
	ProjectSettings.set_setting("rendering/quality/filters/msaa", index);
	var c_RID = $"/root".get_viewport_rid();
	VisualServer.viewport_set_msaa(c_RID, index);
	get_node(root + "/GUI/GUI_BaseInfo/BasePerfInfo").chi_msaa_fxaa_read();
	chi_msaa = index;
	$Left/SEL_MSAA.select(ProjectSettings.get_setting("rendering/quality/filters/msaa"));

func _on_SEL_Aniso_item_selected(index):
	if chi_aniso_sel != $Left/SEL_Aniso.get_item_id(index):
		chi_restart_need = 1;
		chi_aniso = index;
		get_node(root + "/GUI/Settings/BTN_Save").text = "Save and restart";

func _on_SEL_resolution_item_selected(index):
	if chi_resol_fullscreen == false and chi_desktop_size.x >= chi_resols[$Left/SEL_resolution.get_item_id(index)] and chi_desktop_size.y >= chi_resols[$Left/SEL_resolution.get_item_id(index)+100]:
		OS.set_window_size(Vector2(chi_resols[$Left/SEL_resolution.get_item_id(index)],chi_resols[$Left/SEL_resolution.get_item_id(index)+100]));
		#OS.window_size = Vector2(chi_resols[$SEL_resolution.get_item_id(index)],chi_resols[$SEL_resolution.get_item_id(index)+100]);
		OS.set_window_fullscreen(true);
		OS.set_window_fullscreen(false);
		chi_resolution = index;
		var screen_size = OS.get_screen_size();
		var window_size = OS.get_window_size();
		OS.set_window_position(screen_size*0.5 - window_size*0.5);

func _on_SEL_BTN_FullScreen_toggled(button_pressed):
	if button_pressed:
		chi_resol_fullscreen = true;
		OS.set_window_fullscreen(true);
		#OS.window_fullscreen = true;
		#OS.window_borderless = true;
		$Left/SEL_resolution.disabled = true;
	else:
		chi_resol_fullscreen = false;
		OS.set_window_fullscreen(false);
		#OS.window_fullscreen = false;
		#OS.window_borderless = false;
		$Left/SEL_resolution.disabled = false;
		_on_SEL_resolution_item_selected(chi_resolution); #Crutch for Linux
		OS.window_borderless = false; #Crutch for Linux

func _on_BTN_Save_pressed():
	if chi_settings_save_to_file() == 1 and chi_restart_need == 0:
		get_node(root).chi_show_message("Settings saved to file:\n" + str(chi_sett_file), "Settings Saved!");
	if chi_settings_save_to_file() == 1 and chi_restart_need == 1:
		ProjectSettings.set_setting("rendering/quality/filters/anisotropic_filter_level", $Left/SEL_Aniso.get_item_id(chi_aniso));
		OS.execute(OS.get_executable_path(), [], false);
		get_tree().quit();
	if chi_settings_save_to_file() != 1:
		get_node(root).chi_show_message("Something went wrong...", "Warning!");
