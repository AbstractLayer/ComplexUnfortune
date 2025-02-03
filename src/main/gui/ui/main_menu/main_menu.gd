class_name GUIMainMenu extends Control

@export var title_panel: MainMenuTitle
@export var ui_panel: MainMenuUI

func _ready() -> void:
	SignalBus.start_game.connect(_on_started_game)
	
func _on_started_game() -> void:
	queue_free()
