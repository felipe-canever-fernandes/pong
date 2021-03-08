extends Node

var title : String
var version : String
var author : String

func _ready() -> void:
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
