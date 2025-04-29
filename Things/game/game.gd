class_name Game extends Node

signal game_started
@onready var world = $World
@export var player_scene: PackedScene

func _ready():
	Lobby.player_connected.connect(_on_player_connected)

func _on_host_pressed():
	if %Port.text.is_empty():
		Lobby.create_game()
	else:
		Lobby.create_game(%Port.text)
	start_game()

func _on_join_pressed():
	if %Port.text.is_empty():
		Lobby.join_game()
	else:
		Lobby.join_game(%Address.text, %Port.text)
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
