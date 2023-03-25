extends Label

var chi_smi_driver_ver = [0];
var chi_smi_video_mem_all = [0];
var chi_smi_gpu_load = [0];
var chi_smi_gpu_power = [0];
var chi_smi_gpu_clock = [0];

var chi_timeout = 0;
var chi_timeout_value = 1.0;

var chi_thr1_timeout = 0;
var chi_thr1_timeout_value = 1000.0;

var chi_loop = 1;
var thread;

func _ready():
	if $"../../../".chi_OS == "Windows":
		thread = Thread.new();
		thread.start(self, "_thread_function");
		OS.execute("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe", ["--query-gpu=memory.total", "--format=csv,noheader"], true, chi_smi_video_mem_all, false, false);
		OS.execute("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe", ["--query-gpu=driver_version", "--format=csv,noheader"], true, chi_smi_driver_ver, false, false);
	

func _thread_function(userdata):
	while chi_loop == 1:
		if chi_thr1_timeout == 0:
			chi_thr1_timeout = 1;
			OS.delay_msec(chi_thr1_timeout_value);
			OS.execute("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe", ["--query-gpu=utilization.gpu", "--format=csv,noheader"], true, chi_smi_gpu_load, false, false);
			OS.execute("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe", ["--query-gpu=power.draw", "--format=csv,noheader"], true, chi_smi_gpu_power, false, false);
			OS.execute("C:\\Program Files\\NVIDIA Corporation\\NVSMI\\nvidia-smi.exe", ["--query-gpu=clocks.current.graphics", "--format=csv,noheader"], true, chi_smi_gpu_clock, false, false);
			chi_thr1_timeout = 0;
			

func _process(delta):
	if $"../../../".chi_OS == "Windows":
		if chi_timeout == 0:
			chi_timeout = 1;
			yield(get_tree().create_timer(chi_timeout_value), "timeout");
			text = "- NVIDIA System Management Interface:" + "\nGPU Memory: " + str(chi_smi_video_mem_all[0]) + "Driver Version: " + str(chi_smi_driver_ver[0]);
			text = text + "\nRefresh interval: " + str(chi_timeout_value) + " Sec." + "\nGPU Load: " + str(chi_smi_gpu_load[0]) + "GPU Power: " + str(chi_smi_gpu_power[0]) + "GPU Clock: " + str(chi_smi_gpu_clock[0]);
			chi_timeout = 0;
		
	
