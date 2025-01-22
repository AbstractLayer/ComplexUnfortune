extends Node2D

var handle: bool = false

func _physics_process(delta: float) -> void:
	if handle == true:
		$Allies/Allied1.position = get_global_mouse_position()

func _on_allied_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and not handle:
		handle = true
