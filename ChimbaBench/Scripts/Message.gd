extends Control

const root = "/root/ChimbaBench";
var chi_render_size = Vector2(0, 0);

var chi_btn_size = Vector2(0, 0);
var chi_short_size = Vector2(0, 0);
var chi_wide_size = Vector2(0, 0);
var chi_sel_size = Vector2(0, 0);

func on_resize():
	$CAPT.rect_size.x = chi_render_size.x - 20;
	$CAPT.rect_size.y = chi_render_size.x / 32;
	$CAPT.rect_position = Vector2(10,10);
	
	$BTN_Close.rect_position = Vector2(20, chi_render_size.y - 20 - chi_btn_size.y);
	$BTN_Save.rect_position = Vector2(chi_render_size.x - 20 - chi_btn_size.x, chi_render_size.y - 20 - chi_btn_size.y);
	
	$MSG.rect_size.x = chi_render_size.x - 40;
	$MSG.rect_size.y = chi_render_size.y - 40 - chi_btn_size.y - $CAPT.rect_size.y;
	$MSG.rect_position = Vector2(20, 10 + $CAPT.rect_size.y);

func _on_BTN_Close_pressed():
	visible = false;

func _on_BTN_Save_pressed():
	var chi_file = File.new();
	var chi_dir = Directory.new();
	
	var date = str(Time.get_date_string_from_system());
	var time = str(Time.get_time_string_from_system());
	
	if get_node(root).chi_OS == "Windows":
		time = time.replace(":",";");
	
	var chi_exe = get_node(root).chi_executable_dir;
	var chi_path = chi_exe + "/Saved_Info";
	var chi_full_path = str(chi_path, "/", $CAPT.text, " - ", date, " - ", time, ".txt");
	if not chi_dir.dir_exists(chi_path):
		chi_dir.open(chi_exe);
		chi_dir.make_dir("Saved_Info");
	
	chi_file.open(chi_full_path, chi_file.WRITE);
	chi_file.store_string($MSG.text);
	chi_file.close();
	$MSG.text += "Output file: " + chi_full_path;
