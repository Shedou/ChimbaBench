extends Label

var chi_project_name;
var chi_font_sysinfo = DynamicFont.new();

var chi_gpu_name;
var chi_wmi_info;
var chi_driverOGL;


func _ready():
	chi_project_name = $"../../../".chi_project_name_and_version;
	chi_gpu_name = VisualServer.get_video_adapter_name();
	chi_driverOGL = OS.get_video_driver_name(OS.get_current_video_driver());
	if chi_driverOGL == "GLES3":
		chi_driverOGL = "OpenGL/ES 3.0";
	if chi_driverOGL == "GLES2":
		chi_driverOGL = "OpenGL/ES 2.0(!!!)";
	
	text = str(chi_project_name) + str(chi_gpu_name) + "\nAPI: " + str(chi_driverOGL);
