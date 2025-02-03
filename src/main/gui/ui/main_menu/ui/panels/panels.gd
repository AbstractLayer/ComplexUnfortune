class_name MainMenuPanels extends Panel

@export var multiplayer_panel: PanelsMultiplayerPanel
@export var lobby_panel: PanelsLobbyPanel

var player_name: String

func _ready() -> void:
	multiplayer.allow_object_decoding = true
	multiplayer_panel.host_button.connect("button_down", _on_host_button_down)
	multiplayer_panel.join_button.connect("button_down", _on_join_button_down)
	lobby_panel.connect("player_count_changed", _on_player_count_changed)
	lobby_panel.start_game_button.connect("button_down", _on_start_game_button_down)
	
	MultiplayerManager.connect("player_peer_connect", _on_player_peer_connect)
	MultiplayerManager.connect("player_peer_disconnect", _on_player_peer_disconnect)
	
func _on_host_button_down() -> void:
	player_name = multiplayer_panel.host_name_textedit.get_text()
	MultiplayerManager.create_game(int(multiplayer_panel.host_port_textedit.get_text()))
	multiplayer_panel.hide()
	lobby_panel.show()
	
func _on_join_button_down() -> void:
	player_name = multiplayer_panel.join_name_textedit.get_text()
	MultiplayerManager.join_game(multiplayer_panel.join_ip_textedit.get_text(),int(multiplayer_panel.join_port_textedit.get_text()))
	multiplayer_panel.hide()
	lobby_panel.show()

func _on_player_peer_connect(player_lobby: UIPlayerLobby) -> void:
	rpc_id(multiplayer.get_remote_sender_id(),"_set_player_name", player_lobby)
	lobby_panel.players_connect_container.add_child(player_lobby, true)
	print("Player %s has joined" % [player_lobby.player_name])
	lobby_panel.player_count += 1
	
func _on_player_peer_disconnect(player_id: int) -> void:
	if not lobby_panel.players_connect_container.has_node(str(player_id)):
		return
	lobby_panel.players_connect_container.get_node(str(player_id)).queue_free()
	lobby_panel.player_count -= 1

@rpc("any_peer","call_local","reliable")
func _set_player_name(player_lobby: UIPlayerLobby):
	print(1)
	if player_lobby.player_id == 1:
		player_lobby.player_name = multiplayer_panel.host_name_textedit.get_text()
	else:
		player_lobby.player_name = multiplayer_panel.join_name_textedit.get_text()

@rpc("call_local")
func _on_player_count_changed(player_count: int) -> void:
	lobby_panel.players_count_label.text = str("Players %d/5" % [player_count])

func _on_start_game_button_down() -> void:
	SignalBus.start_game.emit()
	#self.queue_free()
