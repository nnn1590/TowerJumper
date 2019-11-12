extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func set_number(n):
	get_node("Position2D/LabelPoints").set_text(n)

func _ready():
	pass

func _on_Timer_timeout():
	queue_free()


func _on_AnimationPlayer_animation_started( name ):
	print(get_node("Position2D").get_pos())
	get_node("Position2D").set_pos(OS.get_window_size())
	print(get_node("Position2D").get_pos())
	print(OS.get_window_size())
	print(OS.get_window_size()/2)
