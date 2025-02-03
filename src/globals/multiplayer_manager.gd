extends Node

signal player_peer_connect(id: int)
signal player_peer_disconnect(player_id: int)

var registered_players: Dictionary = {}

func create_game(host_port: int) -> void:
	var server_peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	server_peer.create_server(host_port, 5)
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_in_game)
	multiplayer.peer_disconnected.connect(_remove_player_in_game)
	
	print("hosted")
	_add_player_in_game(1)
	
func join_game(join_ip: String, join_port: int) -> void:
	var client_peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	client_peer.create_client(join_ip,join_port)
	
	multiplayer.multiplayer_peer = client_peer
	print("joined")

func _add_player_in_game(id: int) -> void:
	player_peer_connect.emit(id)
	
func _remove_player_in_game(id: int) -> void:
	print("Player %s has disconnected" % [id])
	player_peer_disconnect.emit(id)
