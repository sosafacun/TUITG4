extends StaticBody2D
class_name HittableContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
signal open(spawn_point, direction)


func hit():
	$HittableContainerLid.hide()
	var spawn_point = $SpawnPoints.get_child(randi()%$SpawnPoints.get_child_count()).global_position
	open.emit(spawn_point, current_direction)
