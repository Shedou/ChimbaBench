extends Label

var chi_mem = {"static" : 0, "static_max" : 0, "dynamic" : 0, "dynamic_max" : 0};
var chi_mem_vga = {"texture" : 0, "vertex" : 0, "all" : 0};
var chi_frame_info = { "vertex" : 0, "obj_2d" : 0, "obj_3d" : 0, "fps" : 0, "drawcalls_2d" : 0, "drawcalls_3d" : 0};
var chi_aa = { "msaa" : 0, "fxaa" : false, "fxaa_sharp" : 0, "anisotropy" : 0};
var chi_aa_names = { "0":"Disabled", "1":"2x", "2":"4x", "3":"8x", "4":"16x", "5":"AVR 2x", "6":"AVR 4x", "False":"Disabled", "True":"Enabled"};
var chi_aniso_names = { 0:"0", 1:"Disabled", 2:"2x", 4:"4x", 8:"8x", 16:"16x" };

func _ready():
	chi_msaa_fxaa_read();
	chi_aniso_read();

func _physics_process(delta):
	#yield(get_tree().create_timer(0.5), "timeout");
	chi_frame_info.fps = Performance.get_monitor(Performance.TIME_FPS);
	chi_frame_info.drawcalls_2d = Performance.get_monitor(Performance.RENDER_2D_DRAW_CALLS_IN_FRAME);
	chi_frame_info.drawcalls_3d = Performance.get_monitor(Performance.RENDER_DRAW_CALLS_IN_FRAME);
	
	chi_frame_info.obj_2d = Performance.get_monitor(Performance.RENDER_2D_ITEMS_IN_FRAME);
	chi_frame_info.obj_3d = Performance.get_monitor(Performance.RENDER_OBJECTS_IN_FRAME);
	chi_frame_info.vertex = Performance.get_monitor(Performance.RENDER_VERTICES_IN_FRAME);
	
	text = str("FPS: ", chi_frame_info.fps) + str("\nDrawCalls 2D: ", chi_frame_info.drawcalls_2d) + str("\nDrawCalls 3D: ", chi_frame_info.drawcalls_3d);
	text += str("\nItems in frame (2D/3D): ", chi_frame_info.obj_2d, "/", chi_frame_info.obj_3d) + str("\nVertex in frame: ", chi_frame_info.vertex);
	text += str("\n\nAnisotropy: ", str(chi_aniso_names[chi_aa.anisotropy]), "\nMSAA: ", chi_aa_names[str(chi_aa.msaa)]) + str("\nFXAA: ", chi_aa_names[str(chi_aa.fxaa)]) + str("\nFXAA Sharp: ", chi_aa.fxaa_sharp);
	if $"..".more_info == true:
		chi_mem.dynamic = Performance.get_monitor(Performance.MEMORY_DYNAMIC);
		chi_mem.dynamic_max = Performance.get_monitor(Performance.MEMORY_DYNAMIC_MAX);
		chi_mem.static = Performance.get_monitor(Performance.MEMORY_STATIC);
		chi_mem.static_max = Performance.get_monitor(Performance.MEMORY_STATIC_MAX);
		chi_mem_vga.texture = Performance.get_monitor(Performance.RENDER_TEXTURE_MEM_USED);
		chi_mem_vga.vertex = Performance.get_monitor(Performance.RENDER_VERTEX_MEM_USED);
		chi_mem_vga.all = Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED);
		text += str("\n\nMORE INFO:\nMem Dynamic/max: ", int(chi_mem.dynamic / 1024 / 1024), "/") + str(int(chi_mem.dynamic_max / 1024 / 1024), " MiB");
		text += str("\nMem Static/max: ", int(chi_mem.static / 1024 / 1024), "/")+ str(int(chi_mem.static_max / 1024 / 1024), " MiB");
		text += str("\nVideo Mem: ", chi_mem_vga.all / 1024 / 1024, " MiB") + str("\nTexture Mem: ", chi_mem_vga.texture / 1024 / 1024, " MiB") + str("\nVertex Mem: ", chi_mem_vga.vertex / 1024 / 1024, " MiB");
	
func chi_msaa_fxaa_read():
	chi_aa.msaa = ProjectSettings.get_setting("rendering/quality/filters/msaa");
	chi_aa.fxaa = ProjectSettings.get_setting("rendering/quality/filters/use_fxaa");
	chi_aa.fxaa_sharp = ProjectSettings.get_setting("rendering/quality/filters/sharpen_intensity");
	
func chi_aniso_read():
	chi_aa.anisotropy = ProjectSettings.get_setting("rendering/quality/filters/anisotropic_filter_level");
