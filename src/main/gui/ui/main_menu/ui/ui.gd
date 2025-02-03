class_name MainMenuUI extends Panel

@export var ui_parallax: ParallaxLayer
@export var ui_parallax_sprite: Sprite2D

@export var ui_buttons: MainMenuButtons
@export var ui_panels: MainMenuPanels

func _ready() -> void:
	# Setup Init
	ui_panels.multiplayer_panel.show()
	ui_panels.lobby_panel.hide()
