class_name UIPlayerLobby extends TextureRect

@export var name_label: Label
@export var input_player_lobby_synchronizer: InputPlayerLobby

@export var player_id : int = 1:
	set(id):
		player_id = id
		input_player_lobby_synchronizer.set_multiplayer_authority(player_id)

@export var player_name : String = "noname":
	set(name):
		player_name = name

func _ready() -> void:
	name_label.text = str(player_name)

func _process(_delta: float) -> void:
	if input_player_lobby_synchronizer.hello == true:
		$hellolabel.show()
