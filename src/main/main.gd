extends Node

@export var game_node: Node
@export var ui_node: Node

func _ready() -> void:
	SceneManager.load_new_scene("res://assets/main/ui/screens/mainmenu/main_menu_screen.tscn", ui_node.menus_node)
