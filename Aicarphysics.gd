extends RigidBody2D

export(NodePath) var healthbarpath
onready var health = get_node(healthbarpath)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var run = true
var runkill = false
var counttodeath = 1000
var counttodeathact = counttodeath

# Called when the node enters the scene tree for the first time.
func _ready():
		pass
		
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if runkill:
		if counttodeath == 0:
			queue_free()
		else:
			counttodeath -= 1
	if run:
		
		set_linear_velocity(Vector2(cos(rotation), sin(rotation)) * 200)
		
		



func _on_RigidBody2D_body_entered(body):
	if body.name == "Car":
		if runkill:
			counttodeath = 100
			runkill = false
		
		if run:
			
			health.crash(body._velocity.length())
			
			get_child(0).crash(body._velocity.length())
		run = false
		
		
	
		

func rotate(position):
	look_at(position)


func _on_Aicar_body_exited(body):
	if body.name == "Car":
		runkill = true
