extends Node

signal game_started

func _on_host_pressed():
	start_game()

func _on_join_pressed():
	pass # Replace with function body.

func start_game():
	game_started.emit()
	$UILayer/Menu.hide()
