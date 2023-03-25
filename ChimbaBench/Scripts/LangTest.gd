extends Control

var chi_langs_main : String = "Russian: \"тест\"\nEnglish: \"test\"\nChina: \"測試\"\nChina simpl.: \"测试\"\nJapan: \"テスト\"\nGeorgian: \"ტესტი\"\nDeutsch: \"prüfen\"";
var chi_langs_other : String = "Arabic: \"امتحان\"\nHindi: \"परीक्षा\"\nAmharic: \"ሙከራ\"\nArmenian: \"թեստ\"\nAssamese: \"পৰীক্ষা\"\nBambara: \"kɔrɔbɔli\"\nBengal: \"পরীক্ষা\"\nPunjabi: \"ਟੈਸਟ\"";

func _ready():
	get_node($"../../".chi_elements_gui_langtest["langs_main"]).text = "- Main languages:\n" + chi_langs_main;
	get_node($"../../".chi_elements_gui_langtest["langs_other"]).text = "- Other languages:\n" + chi_langs_other;
	


func _on_BTN_Close_pressed():
	visible = false;
