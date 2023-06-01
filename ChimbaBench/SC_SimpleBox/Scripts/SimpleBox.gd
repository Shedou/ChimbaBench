extends Spatial


func _ready():
	$Main_Controls.on_resize();
	Engine.target_fps = 0;


