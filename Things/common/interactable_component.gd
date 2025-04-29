class_name Interactable extends Area2D

signal interacted(actor: Node)
@export var object: Node

@rpc("call_local", "any_peer")
func interact(actor_path: NodePath):
	interacted.emit(get_node(actor_path))
