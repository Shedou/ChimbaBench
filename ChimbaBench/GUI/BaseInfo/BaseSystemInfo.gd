extends Label

var chi_font_sysinfo = DynamicFont.new();

var chi_gpu_name;
var chi_driverOGL;
var chi_raster;
var chi_cpu_name;
var chi_cpu_cores;
var chi_os_name;
var chi_os_model;

func _ready():
	chi_gpu_name = VisualServer.get_video_adapter_name();
	chi_driverOGL = OS.get_video_driver_name(OS.get_current_video_driver());
	chi_cpu_name = OS.get_processor_name();
	chi_cpu_cores = OS.get_processor_count();
	chi_os_name = OS.get_name();
	chi_os_model = OS.get_model_name();
	if chi_driverOGL == "GLES3":
		chi_driverOGL = "OpenGL/ES 3.0";
	if chi_driverOGL == "GLES2":
		chi_driverOGL = "OpenGL/ES 2.0 (!!!)";

func chi_info():
	chi_raster = $"..".chi_render_size.x * $"..".chi_render_size.y;
	text = str($"..".chi_project_name_and_version) + str("- ", chi_os_name, " - (",chi_os_model,")") + str("\n- ", chi_gpu_name) + str("\n- ", chi_cpu_name, " (",chi_cpu_cores, "t)") + str("\nAPI: ", chi_driverOGL);
	text += str("\n\nDesktop: ", OS.get_screen_size().x, "x", OS.get_screen_size().y) + str("\nRender size: ", $"..".chi_render_size.x, "x", $"..".chi_render_size.y) + str(" - (", chi_raster/1000000) + " MP)"; 
