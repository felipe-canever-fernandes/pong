extends Control

export(String, FILE, "*.tscn") var level : String = ""

func _on_PlayButton_pressed():
	get_tree().change_scene(level)

func _on_QuitButton_pressed():
	get_tree().quit()
