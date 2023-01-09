extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var songs = {0: ["Bank Account - 21 Savage", "res://Music/bankaccount.mp3"], 1: ["More M's - Drake, 21 Savage", "res://Music/morem.mp3"], 2: ["Blinding Lights - The Weeknd", "res://Music/blindinglights.mp3"]}
var current = 0
export(NodePath) var atext

# Called when the node enters the scene tree for the first time.
func _ready():
	atext = get_node(atext)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing:
		
		atext.text = songs[current][0]
	else:
		atext.text = ""


func _on_play_pressed():
	if playing:
		
		stop()
	else:
		
		stream = load(songs[current][1])
		play()
		

func _on_back_pressed():
	if current != 0:
		current -= 1
	else:
		current = songs.size() - 1
	
	stream = load(songs[current][1])
	play()


func _on_forward_pressed():
	if current != songs.size() - 1:
		current += 1
	else:
		current = 0
	
	stream = load(songs[current][1])
	play()
