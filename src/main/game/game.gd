class_name Game extends Node

func _ready() -> void:
	SignalBus.start_game.connect(_on_start_game)
	
func _on_start_game() -> void:
	SceneManager.load_new_scene("res://assets/main/game/dungeoncrawler/dungeon_crawler_screen.tscn", self)
