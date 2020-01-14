extends Control

export(String, FILE, "*.tscn") var main_menu : String = ""

func _on_MainMenuButton_pressed():
	get_tree().change_scene(main_menu)
