extends Area2D

@export var speed: int
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta
