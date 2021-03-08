extends Node

var title : String
var version : String
var author : String

func _ready() -> void:
	_load_game_info()
	TranslationServer.set_locale(OS.get_locale())

func _load_game_info() -> void:
	var export_config = ConfigFile.new()
	export_config.load("res://export_presets.cfg")
	
	title = export_config.get_value(
		"preset.0.options",
		"application/product_name"
	)
	
	version = export_config.get_value(
		"preset.0.options",
		"application/product_version"
	)
	
	author = export_config.get_value(
		"preset.0.options",
		"application/company_name"
	)
