extends Node

@export var game_node: Node
@export var ui_node: Node

func _ready() -> void:
	SignalBus.start_game.connect(_on_start_game)
	SceneManager.load_new_scene("res://assets/main/ui/screens/mainmenu/main_menu_screen.tscn", ui_node.menus_node)
	
func _on_start_game() -> void:
	SceneManager.load_new_scene("res://assets/main/game/action/dungeon_crawler_screen.tscn", game_node)
