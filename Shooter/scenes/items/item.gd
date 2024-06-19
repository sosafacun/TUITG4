extends Area2D

@export var rotation_speed: int = 3
@export var available_options = ['laser', 'laser', 'laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]

func _ready():
	if (type == 'laser'):
		$Sprite2D.modulate = Color('00c8c9')
	if (type == 'grenade'):
		$Sprite2D.modulate = Color('ff1c2e')
	if (type == 'health'):
		$Sprite2D.modulate = Color('006b14')

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	if (type == 'laser'):
		Globals.laser_amount += 5
	if (type == 'grenade'):
		Globals.grenade_amount += 1
	if (type == 'health'):
		Globals.hp += 10
	queue_free()