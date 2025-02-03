class_name MainNode extends Node

@export var world_node: WorldNode
@export var gui_node: GUINode

func _ready() -> void:
	SignalBus.start_game.connect(_on_start_game)
	SceneManager.load_new_scene(SceneManager.scenes_gallery.scenes["MainMenu"], gui_node.ui_node)

func _on_start_game() -> void:
	SceneManager.load_new_scene(SceneManager.scenes_gallery.scenes["DungeonCrawler"], world_node.dungeon_crawler)
