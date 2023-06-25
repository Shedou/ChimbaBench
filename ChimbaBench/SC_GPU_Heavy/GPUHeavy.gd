extends Spatial

var chi_rotate = Vector3();
var chi_rot = Vector3();
var chi_vector = Vector3(0.142,0.142,0.142);
var chi_rotate_dir = 0;

func _ready():
	Engine.target_fps = 0;
	$Bench60.chi_benchmark_name = "GPU Heavy v0.5";
	$Bench60.chi_benchmark_info = " This test was created to load the video card.\n\n It uses technologies such as:\n- SSR (Screen Space Reflections).\n- SSAO (Screen space ambient occlusion).\n- DOF (Depth of field).\n- Parallax Mapping.\n- And other.\n\n Attention! Using third-party overlays (MSI Afterburner and others) can significantly affect the test results! It is recommended not to use third party overlays during testing!";
	
	chi_rotate = $GPU_Heavy/CSGBox2.rotation_degrees + Vector3(3.22,3.22,3.22);
	chi_rot = $GPU_Heavy/CSGBox2.rotation_degrees - Vector3(3.22,3.22,3.22);

func _physics_process(delta):
	#$GPU_Heavy/CSGBox3/ReflectionProbe.update_mode = ReflectionProbe.UPDATE_ONCE;
	if $Bench60.chi_loop == 1:
		if $GPU_Heavy/CSGBox2.rotation_degrees < chi_rotate and chi_rotate_dir == 0:
			$GPU_Heavy/CSGBox2.rotation_degrees += chi_vector;
			$GPU_Heavy/CSGBox2.translation += chi_vector / 10;
			$GPU_Heavy/CSGBox3.rotation_degrees -= chi_vector / 5;
			$GPU_Heavy/SpotLight.rotation_degrees += chi_vector;
			$GPU_Heavy/Camera.translation += chi_vector / 80;
		else:
			chi_rotate_dir = 1;
		if $GPU_Heavy/CSGBox2.rotation_degrees > chi_rot and chi_rotate_dir == 1:
			$GPU_Heavy/CSGBox2.rotation_degrees -= chi_vector;
			$GPU_Heavy/CSGBox2.translation -= chi_vector / 10;
			$GPU_Heavy/CSGBox3.rotation_degrees += chi_vector / 5;
			$GPU_Heavy/SpotLight.rotation_degrees -= chi_vector;
			$GPU_Heavy/Camera.translation -= chi_vector / 80;
		else:
			chi_rotate_dir = 0;
