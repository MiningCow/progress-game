class_name Interactable extends Area2D

signal interacted(actor: Node)
@export var object: Node


func interact(actor: Node) -> Node:
	interacted.emit(actor)
	return object
