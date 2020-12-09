extends KinematicBody2D
#export (int) var vitesse = 150
#export (PackedScene) var balle
#onready var canon = $Canon
#var velocite = Vector2()
#var joueur
#var can_shoot = false
#export var sprite = "ennemisgros";
# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#$AnimatedSprite.global_rotation_degrees = (joueur.global_rotation_degrees + 90)
	#if	joueur and can_shoot:
	#	can_shoot = false
	#	var b = balle.instance()
	#	var rotation_degree = global_rotation_degrees
	#	b.creer(canon.global_position,rotation, rotation_degree,sprite)
	#	get_parent().add_child(b)

func _physics_process(delta):
	#var dir = get_global_mouse_position() - global_position
	#rotation = (dir.angle() + 90)
	#velocite = move_and_slide(velocite)
	pass
func _on_Area2D_body_entered(body):
	#joueur = body
	#print(joueur.global_rotation_degrees)
	#print(body.name)
	pass


func _on_GlobalCoolDownTire_timeout():
#	can_shoot = true
	pass
