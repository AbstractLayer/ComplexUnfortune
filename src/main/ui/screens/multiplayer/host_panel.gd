extends Panel

func _on_debug_host_pressed() -> void:
	MultiplayerManager.host_game()
	
func _on_debug_join_pressed() -> void:
	MultiplayerManager.join_game()
	
