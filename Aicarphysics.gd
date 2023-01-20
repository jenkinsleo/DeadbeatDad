extends RigidBody2D

export(NodePath) var healthbarpath
onready var health = get_node(healthbarpath)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var run = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	
	if run:
		
		set_linear_velocity(Vector2(0,10000 * delta))
		
		



func _on_RigidBody2D_body_entered(body):
	if body.name == "Car":
		run = false
		
	
		

