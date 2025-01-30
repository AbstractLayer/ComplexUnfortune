class_name InputPlayerLobby extends MultiplayerSynchronizer

@export var hello: bool = false

func _ready() -> void:
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)

@rpc("call_local")
func hello_function():
	hello = true
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print("hello")
		hello_function.rpc()
