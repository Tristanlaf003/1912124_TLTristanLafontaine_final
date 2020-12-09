extends Node2D
var audio = AudioStreamPlayer.new()
var ennemies = preload("res://Scenes/Enemies.tscn")
var rng = RandomNumberGenerator.new()
export var nombre_ennemies = 4
var nombre_ennemies_tue = 0
var count = 0
var position_x = 200
var position_y = 300
var rotation_ennemis
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize()
	if count < nombre_ennemies:
		count = count + 1
		var my_random_number = rng.randi() % 3
		rotation_ennemis = rng.randi() % 361
		print(rotation_ennemis)
		position_x = rng.randf_range(0,3000)
		position_y = rng.randf_range(0,2000)
		spawn_ennemies(my_random_number)

func spawn_ennemies(my_random_number):
	var ennemies_new = ennemies.instance()
	add_child(ennemies_new)
	ennemies_new.position.x = position_x
	ennemies_new.position.y = position_y
	ennemies_new.rotation2 = rotation_ennemis
	if my_random_number == 0:
		ennemies_new.sprite = "ennemispetit"
	elif my_random_number == 1:
		ennemies_new.sprite = "ennemisgros"
	elif my_random_number == 2:
		ennemies_new.sprite = "ennemis"

func elimination():
	nombre_ennemies_tue += 1
	print(nombre_ennemies_tue)
	if nombre_ennemies_tue == (nombre_ennemies * 2):
		get_tree().change_scene("res://Scenes/Level2.tscn")
