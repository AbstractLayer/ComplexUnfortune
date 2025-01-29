extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var player_id : int = 1:
	set(id):
		player_id = id
		%InputSychronizer.set_multiplayer_authority(id)

var direction: Vector2
var is_hello: bool = false

func _physics_process(delta: float) -> void:
	if multiplayer.is_server():
		direction = %InputSychronizer.input_direction
		
		if is_hello == true:
			$Label.show()
			is_hello = false
			print("foi")
		
		if direction.x == -1:
			velocity.x = -SPEED
		if direction.x == 1:
			velocity.x = SPEED
		if direction.y == -1:
			velocity.y = -SPEED
		if direction.y == 1:
			velocity.y = SPEED
		if direction == Vector2.ZERO:
			velocity = Vector2.ZERO
		move_and_slide()
