class_name HealthStat extends Stat

signal died

func _set_stat(to):
	super._set_stat(to)
	if value <= 0: died.emit()
