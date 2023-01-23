extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var boost = 1
export var addamount = 10
export(NodePath) var drunkpath
onready var drunknode = get_node(drunkpath)
# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Score: 0\nBoost: 1x"


func _process(delta):
	boost = int(drunknode.value / 10)
	text = "Score: " + str(score) + "\nBoost: " + str(boost) + "x"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node2D_addscore():
	score += addamount * boost


func _on_Dialog_window_dialogpass():
	score += addamount
