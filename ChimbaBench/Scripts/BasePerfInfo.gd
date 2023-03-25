extends Label
var chi_mem_static;
var chi_mem_static_max;
var chi_mem_dynamic;
var chi_mem_dynamic_max;

var chi_vid_mem_tex;
var chi_vid_mem_vertex;
var chi_vid_mem;

var chi_vid_vertex;

var chi_2d_items;
var chi_3d_items;

var chi_MSAA;
var chi_MSAA_name;
var chi_FXAA;
var chi_FXAA_name;
var chi_FXAA_sharp;

var chi_aniso;
var chi_aniso_name;

var chi_raster;

func _ready():
	chi_msaa_fxaa_read();
	chi_msaa_aniso_read();

func _process(delta):
	#yield(get_tree().create_timer(0.5), "timeout");
	chi_mem_dynamic = Performance.get_monitor(Performance.MEMORY_DYNAMIC);
	chi_mem_dynamic_max = Performance.get_monitor(Performance.MEMORY_DYNAMIC_MAX);
	chi_mem_static = Performance.get_monitor(Performance.MEMORY_STATIC);
	chi_mem_static_max = Performance.get_monitor(Performance.MEMORY_STATIC_MAX);
	
	chi_2d_items = Performance.get_monitor(Performance.RENDER_2D_ITEMS_IN_FRAME);
	chi_3d_items = Performance.get_monitor(Performance.RENDER_OBJECTS_IN_FRAME);
	chi_vid_mem_tex = Performance.get_monitor(Performance.RENDER_TEXTURE_MEM_USED);
	chi_vid_mem_vertex = Performance.get_monitor(Performance.RENDER_VERTEX_MEM_USED);
	chi_vid_mem = Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED);
	
	chi_vid_vertex = Performance.get_monitor(Performance.RENDER_VERTICES_IN_FRAME);
	
	chi_raster = OS.get_window_safe_area().size.x * OS.get_window_safe_area().size.y;
	
	text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS)) + "\nDrawCalls 2D: " + str(Performance.get_monitor(Performance.RENDER_2D_DRAW_CALLS_IN_FRAME)) + "\nDrawCalls 3D: " + str(Performance.get_monitor(Performance.RENDER_DRAW_CALLS_IN_FRAME));
	text += "\nRaster: " + str(chi_raster/1000000) + " MP";
	text += "\nRender: " + str(OS.get_window_safe_area().size.x, "x", OS.get_window_safe_area().size.y) + "\nDesktop: " + str(OS.get_screen_size().x, "x", OS.get_screen_size().y);
	text += "\nMem Dynamic/max: " + str(int(chi_mem_dynamic / 1024 / 1024)) + "/" + str(int(chi_mem_dynamic_max / 1024 / 1024)) + " MiB";
	text += "\nMem Static/max: " + str(int(chi_mem_static / 1024 / 1024)) + "/" + str(int(chi_mem_static_max / 1024 / 1024)) + " MiB";
	text += "\nItems in frame (2D): " + str(chi_2d_items) + "\nObjects in frame (3D): " + str(chi_3d_items) + "\nVertex in frame: " + str(chi_vid_vertex);
	text += "\nVideo Mem: " + str(chi_vid_mem / 1024 / 1024) + " MiB\nTexture Mem: " + str(chi_vid_mem_tex / 1024 / 1024) + " MiB\nVertex Mem: " + str(chi_vid_mem_vertex / 1024 / 1024) + " MiB";
	text += "\nMSAA: " + str(chi_MSAA_name) + "\nFXAA: " + str(chi_FXAA_name) + "\nFXAA Sharp: " + str(chi_FXAA_sharp);
	text += "\nAnisotropy: " + str(chi_aniso) + "x";
	
func chi_msaa_fxaa_read():
	chi_MSAA = ProjectSettings.get_setting("rendering/quality/filters/msaa");
	chi_FXAA = ProjectSettings.get_setting("rendering/quality/filters/use_fxaa");
	chi_FXAA_sharp = ProjectSettings.get_setting("rendering/quality/filters/sharpen_intensity");
	chi_msaa_fxaa();
	
func chi_msaa_aniso_read():
	chi_aniso = ProjectSettings.get_setting("rendering/quality/filters/anisotropic_filter_level");

func chi_msaa_fxaa():
	if chi_MSAA == 0:
		chi_MSAA_name = "Disabled";
	if chi_MSAA == 1:
		chi_MSAA_name = "2x";
	if chi_MSAA == 2:
		chi_MSAA_name = "4x";
	if chi_MSAA == 3:
		chi_MSAA_name = "8x";
	if chi_MSAA == 4:
		chi_MSAA_name = "16x";
	if chi_MSAA == 5:
		chi_MSAA_name = "AVR 2x";
	if chi_MSAA == 6:
		chi_MSAA_name = "AVR 4x";
	
	if chi_FXAA == false:
		chi_FXAA_name = "Disabled";
	if chi_FXAA == true:
		chi_FXAA_name = "Enabled";
	

