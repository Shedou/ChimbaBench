extends Control

var chi_font_custom = DynamicFont.new();
var chi_font_custom_path;
var chi_font_custom_dir = Directory.new();
var chi_font_custon_file;

var chi_exe_directory;

func _ready():
	chi_vars_prepare();
	if chi_font_custom_dir.dir_exists(chi_exe_directory + "/Font") and chi_font_custom_dir.file_exists(chi_font_custom_path):
		chi_font_custom.font_data = load(chi_font_custom_path);
	set_settings_msaa();
	set_settings_aniso();

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
	chi_exe_directory = $"../../".chi_executable_dir;
	chi_font_custon_file = "/Font/FreeMonospaced.otf";
	chi_font_custom_path = chi_exe_directory + chi_font_custon_file;

func _on_BTN_Close_pressed():
	visible = false;


func _on_BTN_Font_Load_pressed():
	#chi_font_base_set_settings(chi_font_custom, 3, Color(0.251961, 0.251961, 0.401961, 1));
	#chi_font_base_apply();
	pass


func _on_SEL_MSAA_item_selected(index):
	ProjectSettings.set_setting("rendering/quality/filters/msaa", index);
	var c_RID = $"/root".get_viewport_rid();
	VisualServer.viewport_set_msaa(c_RID, index);
	$"..".get_node("GUI_Info/BasePerfInfo").chi_msaa_fxaa_read();

func _on_SEL_Aniso_item_selected(index):
	ProjectSettings.set_setting("rendering/quality/filters/anisotropic_filter_level", index+1);
	$"..".get_node("GUI_Info/BasePerfInfo").chi_msaa_aniso_read();
