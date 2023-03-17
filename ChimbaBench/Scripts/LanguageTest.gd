extends Label

var chi_TestLang_A : String = "Amharic: \"ሙከራ\"\nArmenian: \"թեստ\"\nAssamese: \"পৰীক্ষা\"\nBambara: \"kɔrɔbɔli\"\nGeorgian: \"ტესტი\"\n";
var chi_TestLang : String = "China: \"測試\"\nChina simpl.: \"测试\"\nEnglish: \"test\"\nHindi: \"परीक्षा\"\nArabic: \"امتحان\"\nBengal: \"পরীক্ষা\"\nRussian: \"тест\"\nJapan: \"テスト\"\nPunjabi: \"ਟੈਸਟ\"\nDeutsch: \"prüfen\"\n";

func _ready():
	text = chi_TestLang + "\n" + chi_TestLang_A;
