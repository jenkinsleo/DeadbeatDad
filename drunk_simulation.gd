extends ProgressBar

export var main_count = 500
var count = 0
var rng = RandomNumberGenerator.new()
var active_run = false
var active_frames = 10
var count1 = 0
var count2 = true
export(NodePath) var world_env_path
export(NodePath) var car_path

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _physics_process(delta):
	get_node(world_env_path).environment.dof_blur_near_amount = value / 450
	
	if value > 40:
		get_node(car_path).max_forward_velocity = 800
		get_node(car_path).acceleration = 23
		
	if count < main_count:
		count += 1
	else:
		count = 0
		
		if value != 0:
			if Input.is_action_pressed("left") or Input.is_action_pressed("right") != true:
				
				if count2 == true:
					Input.action_press("left")
				else:
					Input.action_press("right")
			print("started")
			main_count = rng.randf_range(300, 1000)
			active_run = true
			if value < 10:
				active_frames = 0
			elif value < 25:
				active_frames = 5
			elif value < 45:
				active_frames = 9
			else:
				active_frames = 12
			
			
	if active_run:
		count1 += 1
		
		if count1 >= active_frames:
			if count2 == true:
				Input.action_release("left")
			else:
				Input.action_release("right")
				
			count2 = not count2

			print("stopped")
			
			count1 = 0
			active_run = false
			
			
			
			
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
