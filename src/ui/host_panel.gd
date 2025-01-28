extends Panel

@onready var ui_canvas: CanvasLayer = $"../../../.."

func _on_debug_host_pressed() -> void:
	MultiplayerManager.host_game()
	ui_canvas.hide()
	
func _on_debug_join_pressed() -> void:
	MultiplayerManager.join_game()
	ui_canvas.hide()
	
