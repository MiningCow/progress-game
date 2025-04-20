class_name Stat extends Node

signal stat_changed(value)

@export var value: float:
	set(to):
		value = clampf(to, min, max)
		stat_changed.emit(value)
@export var min: float = -INF
@export var max: float = INF
