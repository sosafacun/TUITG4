extends EnemyContainer

func enemy_engage():
	$BugAnimations.stop()
	$BugAnimations.play("attack")

func _process(_delta):
	if(player_detected):
		move()
	if (can_enemy_shoot && player_nearby):
		enemy_engage() #I have to work on this.

func move(): #bug movement with an animation. It works
	look_at(Globals.player_position)
	var direction: Vector2 = (Globals.player_position - position).normalized()
	velocity = direction * speed
	$BugAnimations.play("walk")
	move_and_slide()

func _on_bug_animations_animation_finished():
	Globals.player_hp -= damage
