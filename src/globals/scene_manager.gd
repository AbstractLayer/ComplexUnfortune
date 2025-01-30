extends Node

@export var scenes_gallery: ScenesGallery

var loading_screen: PackedScene
var loading_screen_instance: Control
var load_scene_progress: Array
var global_scene_path : String

func _ready() -> void:
	loading_screen = scenes_gallery.scenes["LoadingScreen"]

func load_new_scene(scene_path : String, owner_node : Node) -> void:
	var new_scene: Variant = load(scene_path).instantiate()
	
	global_scene_path = scene_path
	ResourceLoader.load_threaded_request(global_scene_path)
	
	owner_node.add_child(new_scene)
	loading_screen_instance = loading_screen.instantiate()
	get_tree().get_current_scene().add_child(loading_screen_instance)
	
	self.set_process(true)
	print("set_process_true")
	
func _process(_delta: float) -> void:
	print(scenes_gallery.scenes)
	ResourceLoader.load_threaded_get_status(global_scene_path,load_scene_progress)
	if ResourceLoader.THREAD_LOAD_LOADED:
		#loading_screen_instance.queue_free()
		set_process(false)
		print("set_process false")
