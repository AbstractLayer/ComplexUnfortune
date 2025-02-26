extends Node

signal player_peer_connected(id: int)
signal player_peer_disconnected(id: int)

var peers: Array[ENetMultiplayerPeer] = []
var registered_players: Dictionary = {}

func create_game(host_port: int) -> void:
	var server_peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	server_peer.create_server(host_port, 5)
	peers.append(server_peer)
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	_on_peer_connected(1)
	
func join_game(join_ip: String, join_port: int) -> void:
	var client_peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	client_peer.create_client(join_ip,join_port)
	peers.append(client_peer)
	
	multiplayer.multiplayer_peer = client_peer

func _on_peer_connected(id: int) -> void:
	player_peer_connected.emit(id)
	
func _on_peer_disconnected(id: int) -> void:
	player_peer_disconnected.emit(id)
