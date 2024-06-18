extends Node

signal stat_change

var laser_amount: int = 20:
	set(value):
		laser_amount = value
		stat_change.emit()
		
var grenade_amount: int = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()
		
var hp: int = 60:
	set(value):
		hp = value
		stat_change.emit()
