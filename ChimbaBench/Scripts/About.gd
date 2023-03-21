extends Control


func _ready():
	pass

func _on_Overclockers_pressed():
	OS.shell_open("https://overclockers.ru/blog/Hard-Workshop");

func _on_GitHub_pressed():
	OS.shell_open("https://github.com/Shedou/ChimbaBench");


func _on_BTN_Close_pressed():
	visible = false;
