extends Node2D

@export var player_id : int = 1:
	set(id):
		player_id = id
		#input_player_lobby_synchronizer.set_multiplayer_authority(player_id)
