extends KinematicBody2D

export var vitesse = 500
var velocite = Vector2()

func creer(pos,dir,rotation_degress,sprite):
	position = pos
	velocite = Vector2(vitesse,0).rotated(dir)
	if sprite == "player":
		$AnimatedSprite.play("Balle_Player")
		$AnimatedSprite.scale.x = 1
		$AnimatedSprite.scale.y = 1
	if sprite == "ennemispetit":
		$AnimatedSprite.play("Balle_Ennemis")
		$AnimatedSprite.scale.x = 1
		$AnimatedSprite.scale.y = 1
	if sprite == "ennemisgros":
		$AnimatedSprite.play("Missille_Ennemis")
		$AnimatedSprite.scale.x = 0.5
		$AnimatedSprite.scale.y = 0.5
		$AnimatedSprite.rotation_degrees = (rotation_degress+90)

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
