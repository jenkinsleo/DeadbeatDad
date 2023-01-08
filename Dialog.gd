extends ColorRect
export(NodePath) var leftbuttonpath
export(NodePath) var rightbuttonpath

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var leftbutton = get_node(leftbuttonpath)
onready var rightbutton = get_node(rightbuttonpath)

#left is 0
#right is 1
var active
var rng = RandomNumberGenerator.new()

signal dialogpass
signal dialogfail
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	visible = false # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Cop_startmessage():
	
	visible = true
	active = rng.randi_range(0,10)
	print(active)
	if active <= 5:
		leftbutton.text = "No sir I've had nothing to drink today"
		rightbutton.text = "Yes sir I've had a few"
		active = 0
	elif active > 5:
		leftbutton.text = "Yes sir I've had a few"
		rightbutton.text = "No sir I've had nothing to drink today"
		active = 1


func _on_Button_pressed():
	if active == 0:
		emit_signal("dialogpass")
		visible = false
	else:
		emit_signal("dialogfail")


func _on_Button2_pressed():
	if active == 1:
		emit_signal("dialogpass")
		visible = false
	else:
		emit_signal("dialogfail")
