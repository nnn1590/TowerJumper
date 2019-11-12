extends "res://abstract_platform.gd"
onready var notifier = preload("res://Scenes/Break.tscn")

func _on_Area_body_enter( body ):
	print(get_node("input_handler"))
	var aux = notifier.instance()
	aux.set_pos(OS.get_window_size()/2)
	print(get_parent().get_parent().get_parent().get_name(), " | ", get_parent().get_parent().get_parent().get_children())
	print(get_parent().get_parent().get_parent().get_child(7).get_name(), " | GO is GOD")
	print(get_parent().get_parent().get_parent().get_child(7).get_name(), ": ", get_parent().get_parent().get_parent().get_child(7).get_animation_list())
	#print(get_tree().quit())
	get_parent().get_parent().get_parent().get_child(7).play("BreakAnim")
	#get_parent().get_parent().get_parent().add_child(aux)
	
	body.get_parent().end_animation()
	
	if (global.sound_enabled):	
		get_node("StreamPlayer").play(1)
	disconnect("body_enter", self, "_on_Area_body_enter")
	set_enable_monitoring(false)
	get_node("Timer").start()	
	for child in get_node("Children").get_children():
		child.explode()
	
func _ready():
	for i in range(0, SEGMENTS):
		var aux = segment.instance()
		aux.set_material (global.mat_player)
		aux.rotate_y(deg2rad((offset * i)))
		get_node("Children").add_child(aux)

func meteorize():
	pass

func _on_Timer_timeout():	
	global.handle_win()
