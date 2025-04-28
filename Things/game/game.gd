class_name Game extends Node

signal game_started
const PORT := 6006
@onready var world = $World
@export var player_scene: PackedScene

func _ready():
	Lobby.player_connected.connect(_on_player_connected)

func _on_host_pressed():
	Lobby.create_game()
	start_game()

func _on_join_pressed():
	Lobby.join_game(%Address.text)
	start_game()

#Called on my game by everyone else's game when we make a connection
func _on_player_connected(peer_id, player_info):
	var player: Player = player_scene.instantiate()
	player.name = str(peer_id)
	world.add_child(player)
	player.load_player_info(player_info)

func start_game():
	game_started.emit()
	$UILayer/Menu.hide()

func _on_username_text_changed():
	Lobby.player_info.name = %Username.text
