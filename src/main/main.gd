class_name MainNode extends Node

@export var game_node: GameNode
@export var ui_node: UINode

func _ready() -> void:
	SignalBus.start_game.connect(_on_start_game)
	_init_main_game()

func _init_main_game() -> void:
	SceneManager.load_new_scene(SceneManager.scenes_gallery.scenes["MainMenu"], ui_node.menus_node)

func _on_start_game() -> void:
	SceneManager.load_new_scene(SceneManager.scenes_gallery.scenes["DungeonCrawler"], game_node.dungeon_crawler)
