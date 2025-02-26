class_name MainMenuPanels extends Panel

@export var multiplayer_panel: PanelsMultiplayerPanel
@export var lobby_panel: PanelsLobbyPanel

@onready var player_lobby_scene: PackedScene = preload("uid://yb0u3rclvn4g")

func _ready() -> void:
	### CAUTION: TEST PROPOSAL -> multiplayer.allow_object_decoding = true
	multiplayer_panel.host_button.connect("button_down", _on_host_button_down)
	multiplayer_panel.join_button.connect("button_down", _on_join_button_down)
	
func _on_host_button_down() -> void:
	MultiplayerManager.create_game(int(multiplayer_panel.host_port_textedit.get_text()))
	multiplayer_panel.hide()
	lobby_panel.show()
	
func _on_join_button_down() -> void:
	MultiplayerManager.join_game(multiplayer_panel.join_ip_textedit.get_text(),int(multiplayer_panel.join_port_textedit.get_text()))
	multiplayer_panel.hide()
	lobby_panel.show()
