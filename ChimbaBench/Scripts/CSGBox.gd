extends CSGBox

var chi_rotate;

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	chi_rotate = Vector3();
	chi_rotate = rotation;
	rotation += Vector3(0.02,0.002,0.02);
