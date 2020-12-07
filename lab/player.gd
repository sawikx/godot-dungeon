extends KinematicBody2D

var current_anim = ""
var new_anim = "standing"
const m =150
func _physics_process(delta):
	var ruch = Vector2();
	if Input.is_action_pressed("lewo"):
		ruch += Vector2(-1, 0) ;
		new_anim = "walk_left"
		#move_and_slide(ruch*m)
		#print("KEY_LEFT")
	if Input.is_action_pressed("gura") :
		ruch += Vector2(0, -1) 
		new_anim = "walk_up"
		#move_and_slide(ruch*m)
		#print("KEY_UP")
	if Input.is_action_pressed("prawo") :
		ruch += Vector2(1, 0)
		new_anim = "walk_right"
		#move_and_slide(ruch*m)
		#print("KEY_RIGHT")
	if Input.is_action_pressed("dul"):
		ruch += Vector2(0, 1)   
		new_anim = "walk_down"
		
		#print("KEY_DOWN")
	if ruch.length() >0:
		$charwalk.hide()
		$run.show()
		move_and_slide(ruch*m)
		if new_anim != current_anim:
			current_anim = new_anim
			get_node("ani").play(current_anim)
	else:
		$run.hide()
		$charwalk.show()
		current_anim = "standing"
		get_node("ani").play(current_anim)
		
		
func _ready():
	pass
