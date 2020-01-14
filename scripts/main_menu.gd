extends Control

export(String, FILE, "*.tscn") var level : String = ""

func _on_PlayButton_pressed():
	get_tree().change_scene(level)
