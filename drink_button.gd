extends Node
export(NodePath) var health_bar_path
export var delay = 250
var delay_count = 0
# Declare a variable to store the current health value
var dlevel = 0
var change_active = false
# Declare a reference to the TextureProgress node that will display the health bar
onready var health_bar = get_node(health_bar_path)
var rng = RandomNumberGenerator.new()
export(NodePath) var thispath



# Called when the node enters the scene tree for the first time


# Called when the DecreaseHealth button is clicked
func _on_Button_pressed():
	# Decrease the health value by 10
	delay_count += delay
	get_node(thispath).disabled = true
	
	
	
func _physics_process(delta):
	
	if delay_count > 1:
		delay_count -= 1
	elif delay_count == 1:
		dlevel += rng.randf_range(12, 18.0)
		# Update the health bar to reflect the new health value
		change_active = true
		
		delay_count = 0
		
	if change_active:
		
		if health_bar.value < dlevel:
			health_bar.value += 0.03
		else:
			change_active = false
			get_node(thispath).disabled = false
			

