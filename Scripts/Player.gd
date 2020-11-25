extends KinematicBody2D
export (int) var vitesse = 100
var velocite = Vector2()
export (PackedScene) var balle
onready var canon = $Canon
var can_shoot = true 
var sprite = "player";
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 512
	position.y = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var shoot_sound = Input.is_action_just_pressed("Tire")
	if shoot_sound and can_shoot:
		can_shoot = false
		$ShootStreamPlayer.play(0)
		var b = balle.instance()
		var rotation_degree = global_rotation_degrees
		b.creer(canon.global_position,rotation, rotation_degree,sprite)
		get_parent().add_child(b)

func _physics_process(delta):
	get_input()
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		velocite = move_and_slide(velocite)


func _on_BlobalCoolDown_timeout():
	can_shoot = true

func get_input():
	velocite = Vector2()
	var avance = Input.is_action_pressed("Avance")
	var recule = Input.is_action_pressed("Recule")
	var gauche = Input.is_action_pressed("Gauche")
	var droite = Input.is_action_pressed("Droite")
	if droite:
		velocite.x += 1
	if gauche:
		velocite.x -= 1
	if recule:
		velocite.y += 0.5
	if avance:
		velocite.y -= 1
	velocite = velocite.normalized() * vitesse
	
