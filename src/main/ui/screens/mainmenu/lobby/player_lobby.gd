class_name UIPlayerLobby extends TextureRect

@export var name_label: Label

@export var player_id : int = 1:
	set(id):
		player_id = id
		#%InputSychronizer.set_multiplayer_authority(id)

@export var player_name : String = "noname":
	set(name):
		player_name = name

func _ready() -> void:
	name_label.text = str(player_name)
