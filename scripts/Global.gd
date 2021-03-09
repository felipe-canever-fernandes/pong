extends Node

const TITLE := "Pong"
const VERSION := "1.1.0.0 Alpha"
const AUTHOR := "Felipe Canever Fernandes"

func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())
