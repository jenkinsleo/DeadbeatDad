extends Node2D

var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var missions = {-1: "Drop off at home",1: "Pick up the kids from school", 2: "Go to church", 3: "Go for a checkup at the doctors", 4: "Stop by and get a gift from your friend", 5: "Go for some drinks at the bar"}
export var missiond = [1,2,3,4,5]
export var current = 0
var oldcurrent = 0

var housepos = Vector2(-5340, 47)
export(NodePath) var arrownode
export(NodePath) var textpath
export(NodePath) var playernode
var textnode
# Called when the node enters the scene tree for the first time.
func _ready():
	arrownode = get_node(arrownode)
	playernode = get_node(playernode)
	randomize()
	missiond.shuffle()
	textnode = get_node(textpath)
	textnode.text = "None"
	print(missiond)
	
			
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MainHouse_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		current = oldcurrent + 1

#2
func _on_Hospital_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if missiond[current] == 3:
			current += 1

#0
func _on_School_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if missiond[current] == 1:
			oldcurrent = current
			current = -1

#4
func _on_Bar_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if missiond[current] == 5:
			current += 1

#1
func _on_Church_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print(missiond[current])
		if missiond[current] == 2:
			print("help")
			current += 1

#3
func _on_Friend_input_event(viewport, event, shape_idx):
	
	if (event is InputEventMouseButton && event.pressed):
		if missiond[current] == 4:
			
			oldcurrent = current
			current = -1

func _physics_process(delta):
	pass
	
func _process(delta):
	#print(current)
	if current >= 0:
		textnode.text = missions[missiond[current]]
	else:
		textnode.text = missions[current]
