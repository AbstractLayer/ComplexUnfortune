class_name MainMenuPanels extends Panel

@export var multiplayer_panel: PanelsMultiplayerPanel
@export var lobby_panel: PanelsLobbyPanel

@onready var player_lobby_scene: PackedScene = preload("uid://yb0u3rclvn4g")

func _ready() -> void:
	#multiplayer.allow_object_decoding = true
	multiplayer_panel.host_button.connect("button_down", _on_host_button_down)
	multiplayer_panel.join_button.connect("button_down", _on_join_button_down)
	lobby_panel.connect("player_count_changed", _on_player_count_changed)
	lobby_panel.start_game_button.connect("button_down", _on_start_game_button_down)
	
	MultiplayerManager.connect("player_peer_connect", _on_player_peer_connect)
	MultiplayerManager.connect("player_peer_disconnect", _on_player_peer_disconnect)
	
func _on_host_button_down() -> void:
	MultiplayerManager.create_game(int(multiplayer_panel.host_port_textedit.get_text()))
	multiplayer_panel.hide()
	lobby_panel.show()
	
func _on_join_button_down() -> void:
	MultiplayerManager.join_game(multiplayer_panel.join_ip_textedit.get_text(),int(multiplayer_panel.join_port_textedit.get_text()))
	multiplayer_panel.hide()
	lobby_panel.show()

func _on_player_peer_connect(id: int) -> void:
	var player_lobby: UIPlayerLobby = player_lobby_scene.instantiate()
	player_lobby.player_id = id
	player_lobby.name = str(id)
	player_lobby.player_name = str(id)
	lobby_panel.players_connect_container.add_child(player_lobby, true)
	print("Player %s has joined" % [player_lobby.player_name])
	lobby_panel.player_count += 1
	MultiplayerManager.registered_players[lobby_panel.player_count] = id
	
func _on_player_peer_disconnect(player_id: int) -> void:
	print("disconnected")
	if not lobby_panel.players_connect_container.has_node(str(player_id)):
		return
	lobby_panel.players_connect_container.get_node(str(player_id)).queue_free()
	lobby_panel.player_count -= 1

func _on_player_count_changed(player_count: int) -> void:
	_player_count_update(player_count)
	
	rpc("_player_count_update", player_count)

@rpc("any_peer")
func _player_count_update(player_count: int) -> void:
	lobby_panel.players_count_label.text = str("Players %d/5" % [player_count])
	
func _on_start_game_button_down() -> void:
	print(MultiplayerManager.registered_players)
	SignalBus.start_game.emit()
	rpc("all_peers_start_game")

@rpc("any_peer")
func all_peers_start_game() -> void:
	SignalBus.start_game.emit()
