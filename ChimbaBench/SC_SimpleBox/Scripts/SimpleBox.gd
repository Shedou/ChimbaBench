extends Spatial

var chi_rotate = Vector3();
var chi_rot = Vector3();
var chi_vector = Vector3(0.042,0.0042,0.042);
var chi_rotate_dir = 0;

func _ready():
	Engine.target_fps = 0;
	$Bench60.chi_benchmark_name = "Simple Box v1.1";
	$Bench60.chi_benchmark_info = " The Simple Box benchmark is a simple textured cube and a procedural skybox.\n\n This test is useful for very weak video cards and for checking the performance of the processor / video card / video driver combination.\n\n Also, the Simple Box test is useful for testing in virtual machines and when rendering using a processor instead of a video card.\n\n This is not a CPU-only benchmark!\n\n Attention! Using third-party overlays (MSI Afterburner and others) can significantly affect the test results! It is recommended not to use third party overlays during testing!";
	
	chi_rotate = $CSGBox.rotation_degrees + Vector3(3.22,3.022,3.22);
	chi_rot = $CSGBox.rotation_degrees - Vector3(3.22,3.022,3.22);

func _physics_process(delta):
	if $Bench60.chi_loop == 1:
		if $CSGBox.rotation_degrees < chi_rotate and chi_rotate_dir == 0:
			$CSGBox.rotation_degrees += chi_vector;
		else: chi_rotate_dir = 1;
		if $CSGBox.rotation_degrees > chi_rot and chi_rotate_dir == 1:
			$CSGBox.rotation_degrees -= chi_vector;
		else: chi_rotate_dir = 0;
