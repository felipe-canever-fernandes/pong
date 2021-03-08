extends Control

export(String, FILE, "*.tscn") var main_menu : String = ""

onready var about_label : Label = $CenterContainer/VBoxContainer/AboutLabel

func _ready() -> void:
	about_label.text = "PONG Alpha 1.0.0\n\nby\nFelipe Canever Fernandes\n\nusing\nGodot Engine\n"

func _on_MainMenuButton_pressed():
	get_tree().change_scene(main_menu)
