extends StaticBody2D
class_name HittableContainer

signal open(spawn_point, direction)

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
@export var item_spawn_count: int = 0
var opened: bool = false

func hit():
	$HittableContainerLid.hide()
	if not opened:
		for i in range (item_spawn_count):
			var spawn_point = $SpawnPoints.get_child(randi()%$SpawnPoints.get_child_count()).global_position
			open.emit(spawn_point, current_direction)
		opened = true
