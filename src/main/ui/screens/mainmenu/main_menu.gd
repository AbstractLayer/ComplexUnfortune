class_name UIMainMenu extends Control

@export var multiplayer_panel: UIMultiplayerPanel
@export var lobby_panel: UILobbyPanel

var player_name: String

func _ready() -> void:
	multiplayer_panel.host_button.connect("pressed", _on_host_button_pressed)
	multiplayer_panel.join_button.connect("pressed", _on_join_button_pressed)
	
func _on_host_button_pressed() -> void:
	get_player_name()
	MultiplayerManager.host_game(player_name)
	multiplayer_panel.hide()
	lobby_panel.show()

func _on_join_button_pressed() -> void:
	MultiplayerManager.join_game()
	multiplayer_panel.hide()
	lobby_panel.show()

func get_player_name() -> void:
	if multiplayer_panel.textedit_name.get_line(0) == "":
		player_name = "noname"
	else:
		player_name = multiplayer_panel.textedit_name.get_line(0)
