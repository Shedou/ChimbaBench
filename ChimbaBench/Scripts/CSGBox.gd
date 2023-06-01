extends CSGBox

var chi_rotate = Vector3();
var chi_rot = Vector3();
var chi_vector = Vector3(0.042,0.0042,0.042);
var chi_rotate_dir = 0;

func _ready():
	chi_rotate = rotation_degrees + Vector3(3.22,3.022,3.22);
	chi_rot = rotation_degrees - Vector3(3.22,3.022,3.22);
	pass # Replace with function body.


func _physics_process(delta):

	if rotation_degrees < chi_rotate and chi_rotate_dir == 0:
		rotation_degrees += chi_vector;
	else:
		chi_rotate_dir = 1;

	if rotation_degrees > chi_rot and chi_rotate_dir == 1:
		rotation_degrees -= chi_vector;
	else:
		chi_rotate_dir = 0;
