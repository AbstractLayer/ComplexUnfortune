extends Node

const SERVER_IP = "127.0.0.1"
const PORT = 25565

var player_scene = preload("res://assets/main/DEBUG/game_debug.tscn")

var _players_spawn_node

func host_game():
	print("hosted")
	
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(PORT)
	
	_players_spawn_node = get_tree().get_current_scene().get_node("Players")
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_in_game)
	multiplayer.peer_disconnected.connect(_remove_player_in_game)
	
	_add_player_in_game(1)
	
func join_game():
	print("joined")
	
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP,PORT)
	
	multiplayer.multiplayer_peer = client_peer
	
func _add_player_in_game(id: int):
	print("Player %s has joined" % id)
	
	var player = player_scene.instantiate()
	player.player_id = id
	player.name = str(id)
	
	_players_spawn_node.add_child(player, true)
	
func _remove_player_in_game(id: int):
	print("Player %s has disconnected" % id)
	if not _players_spawn_node.has_node(str(id)):
		return
	_players_spawn_node.get_node(str(id)).queue_free()
