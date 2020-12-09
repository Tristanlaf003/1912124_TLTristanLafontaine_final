extends HBoxContainer
export (PackedScene) var joueur

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$TextureProgress.rect_position.x = 104
	$Count/Background.rect_size.x = 100
