extends Control

export(String, FILE, "*.tscn") var main_menu : String = ""

onready var about_label : Label = $CenterContainer/VBoxContainer/AboutLabel

func _ready() -> void:
	about_label.text = "{title} {version}\n\nby\n{author}\n\nusing\nGodot Engine\n"\
		.format({
			"title": Global.title,
			"version": Global.version,
			"author": Global.author
		})

func _on_MainMenuButton_pressed():
	get_tree().change_scene(main_menu)
