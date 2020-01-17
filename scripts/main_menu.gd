extends Control

export(String, FILE, "*.tscn") var level : String = ""
export(String, FILE, "*.tscn") var about_menu : String = ""

func _ready() -> void:
	get_tree().paused = false

func _on_PlayButton_pressed():
	get_tree().change_scene(level)

func _on_AboutButton_pressed():
	get_tree().change_scene(about_menu)

func _on_QuitButton_pressed():
	get_tree().quit()
