extends Control


func _ready():
	pass

func _on_BTN_Close_pressed():
	visible = false;

func _on_Link_Overs_pressed():
	OS.shell_open("https://overclockers.ru/blog/Hard-Workshop");

func _on_Link_GitHub_pressed():
	OS.shell_open("https://github.com/Shedou/ChimbaBench");
