extends Node

@export var spawn_points_node: Array[Marker2D]
@export var background_node: Node2D
@export var players_node: Node2D

@onready var player_crawler = preload("uid://b5avsotejgg6b")

var player_count = 0

func _ready() -> void:
	for lobby_players in MultiplayerManager.registered_players.keys():
		var player = player_crawler.instantiate()
		player.player_id = MultiplayerManager.registered_players[lobby_players]
		player.global_position = spawn_points_node[player_count].global_position
		players_node.add_child(player, true)
		player_count += 1
