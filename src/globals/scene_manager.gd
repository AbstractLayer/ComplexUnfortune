extends Node

@export var scenes_gallery: ScenesGallery

var loading_screen: Control

func _ready() -> void:
	loading_screen = get_tree().get_current_scene().get_node("GUI/GUICanvas/LoadingScreen")
	loading_screen.hide()
	
func load_new_scene(scene_path: String, owner_node : Node) -> void:
	loading_screen.show()
	
	var new_scene: Node = load(scene_path).instantiate()
	new_scene.tree_entered.connect(_on_new_scene_entered)
	owner_node.add_child(new_scene)

func _on_new_scene_entered() -> void:
	loading_screen.hide()
