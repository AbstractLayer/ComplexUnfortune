extends MultiplayerSynchronizer

var input_direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)
	
	input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if Input.is_key_pressed(KEY_1):
		hello.rpc()
	
@rpc("call_local")
func hello():
	if multiplayer.is_server():
		owner.is_hello = true
