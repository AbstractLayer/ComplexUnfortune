class_name MainMenuButtons extends VBoxContainer

@export var continue_button: Button
@export var multiplayer_button: Button
@export var acervo_button: Button
@export var options_button: Button
@export var exit_button: Button

func _ready() -> void:
	continue_button.connect("button_down",_on_continue_button_down)
	multiplayer_button.connect("button_down",_on_multiplayer_button_down)
	acervo_button.connect("button_down",_on_acervo_button_down)
	options_button.connect("button_down",_on_options_button_down)
	exit_button.connect("button_down",_on_exit_button_down)
	
func _on_continue_button_down() -> void:
	print("continue")
	
func _on_multiplayer_button_down() -> void:
	print("multiplayer")
	
func _on_acervo_button_down() -> void:
	print("acervo")
	
func _on_options_button_down() -> void:
	print("options")
	
func _on_exit_button_down() -> void:
	print("exit")
