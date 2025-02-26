class_name UIPlayerLobby extends TextureRect

@export var name_label: Label
@export var input_player_lobby_synchronizer: InputPlayerLobby

@export var player_id : int = 1

@export var player_name : String = "noname"

func _enter_tree() -> void:
	player_id = int(str(name))
	set_multiplayer_authority(player_id)
	
func _process(_delta: float) -> void:
	name_label.text = str(player_name)
	#if input_player_lobby_synchronizer.hello == true:
		#$hellolabel.show()
