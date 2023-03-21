extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	#yield(get_tree().create_timer(1.0), "timeout");
	text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS)) + "\nDrawCalls 2D: " + str(Performance.get_monitor(Performance.RENDER_2D_DRAW_CALLS_IN_FRAME)) + "\nDrawCalls 3D: " + str(Performance.get_monitor(Performance.RENDER_DRAW_CALLS_IN_FRAME));
	text = text + "\nRender Size: " + str(OS.get_window_safe_area().size.x, "x", OS.get_window_safe_area().size.y) + "\nUser Desktop: " + str(OS.get_screen_size().x, "x", OS.get_screen_size().y);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
