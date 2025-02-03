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
