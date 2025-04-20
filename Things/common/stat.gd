class_name Stat extends Node

signal stat_changed(value)

@export var value: float:
	set =_set_stat

@export var min: float = -INF
@export var max: float = INF

func _set_stat(to):
	value = clampf(to, min, max)
	stat_changed.emit(value)
