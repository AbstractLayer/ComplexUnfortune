class_name Main extends Node

@export var game_node: Node
@export var ui_node: Node

func _ready() -> void:
	_init_main_game()

func _init_main_game() -> void:
	SceneManager.load_new_scene()
