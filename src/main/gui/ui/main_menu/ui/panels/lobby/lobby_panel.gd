class_name PanelsLobbyPanel extends Panel

signal player_count_changed(player_count: int)

@export var lobby_multiplayer_spawner: MultiplayerSpawner 

@export var players_connect_container: HBoxContainer
@export var players_position_container: HBoxContainer
@export var players_count_label: Label
@export var lobby_options_button: Button
@export var start_game_button: Button

@export var player_count: int = 0:
	set(count):
		player_count = clamp(count,0,5)
		player_count_changed.emit(player_count)

@onready var player_lobby_scene: PackedScene = preload("uid://yb0u3rclvn4g")

func _ready() -> void:
	lobby_multiplayer_spawner.spawn_function = _on_player_peer_connected
	
	MultiplayerManager.connect("player_peer_connected", _on_player_peer_connected)
	MultiplayerManager.connect("player_peer_disconnected", _on_player_peer_disconnected)
	
	player_count_changed.connect(_on_player_count_changed)
	
	start_game_button.connect("button_down",_on_start_game_button_down)
	
func _on_player_peer_connected(id: int):
	var player_lobby: UIPlayerLobby = player_lobby_scene.instantiate()
	player_lobby.name = str(id)
	player_count += 1
	MultiplayerManager.registered_players[player_count] = id
	return player_lobby
	
func _on_player_peer_disconnected(id: int) -> void:
	if not players_connect_container.has_node(str(id)):
		return
	players_connect_container.get_node(str(id)).queue_free()
	print("Player %s has disconnected")
	player_count -= 1
	
func _on_player_count_changed(player_count: int) -> void:
	_player_count_update(player_count)
	rpc("_player_count_update", player_count)

@rpc("any_peer")
func _player_count_update(player_count: int) -> void:
	players_count_label.text = str("Players %d/5" % [player_count])

func _on_start_game_button_down() -> void:
	print(MultiplayerManager.registered_players)
	_all_peers_start_game()
	rpc("_all_peers_start_game")

@rpc("any_peer")
func _all_peers_start_game() -> void:
	SignalBus.start_game.emit()
