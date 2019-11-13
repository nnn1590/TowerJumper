extends Control

onready var game = get_node ("Spatial")
onready var width = Globals.get("display/width")

var last_pos = 0
var touchs_vec = {}

func show_break():
	print(get_node("BreakAnimationPlayer").is_active()," r ",get_node("BreakAnimationPlayer").is_playing())
	get_node("BreakAnimationPlayer").play("BreakAnim")
	print(get_node("BreakAnimationPlayer").is_active()," r ",get_node("BreakAnimationPlayer").is_playing())

func _ready():
	get_node("LevelLabel").set_text("LEVEL  " + str(global.level))
	set_process_input(true)

func handle_pos (pos):	
	var rot_pos = ((-(pos - last_pos) * 300) / width)
	if (!game.receive_input (rot_pos)):		
		game.lock_rot();		
		last_pos = pos
		
func _input(event):
	if (event.type==InputEvent.SCREEN_TOUCH):
		if (event.pressed):
			touchs_vec[event.index] = event.pos.x
			if (touchs_vec.size() == 1):
				last_pos = event.pos.x
				game.lock_rot();
			
		else:		
			touchs_vec.erase(event.index)
			if (touchs_vec.size() == 1):
				last_pos = touchs_vec.values()[0]
				game.lock_rot();
		
	elif (event.type==InputEvent.SCREEN_DRAG):
		touchs_vec[event.index] = event.pos.x
		var a = event.pos.x
		if (touchs_vec.size() == 1):
			handle_pos (event.pos.x)
