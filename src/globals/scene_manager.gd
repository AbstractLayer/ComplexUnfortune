extends Node

var loading_screen = load("res://assets/main/ui/menus/loading/loading_screen.tscn")
var loading_screen_instance
var load_scene_progress: Array
var global_scene_path : String

func load_new_scene(scene_path : String, owner_node : Node):
	var new_scene = load(scene_path).instantiate()
	
	global_scene_path = scene_path
	ResourceLoader.load_threaded_request(global_scene_path)
	
	owner_node.add_child(new_scene)
	loading_screen_instance = loading_screen.instantiate()
	get_tree().get_current_scene().add_child(loading_screen_instance)
	
	self.set_process(true)
	print("set_process_true")
	
func _process(_delta: float) -> void:
	ResourceLoader.load_threaded_get_status(global_scene_path,load_scene_progress)
	if ResourceLoader.THREAD_LOAD_LOADED:
		loading_screen_instance.queue_free()
		set_process(false)
		print("set_process false")
