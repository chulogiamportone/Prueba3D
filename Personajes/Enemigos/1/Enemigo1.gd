extends CharacterBody3D

var curHp : int =3
var maxHp : int =3

var damage : int =1
var attackDist : float = 1.5
var attackRate : float = 1.0

var moveSpeed : float =2.5

var vel : Vector3 =  Vector3()
@onready var timer =get_node("Timer")
@onready var player = get_tree().get_nodes_in_group("../addons/ThirdPersonTemplate/Character/Nodes/PlayerTemplate")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	timer.wait_time = attackRate
	timer.start()
	
	
func _on_Timer_timeout() -> void:
	if get_position_delta().distance_to(player.position)<=attackDist:
		player.take_damage(damage)
		


func _physics_process(delta:float)->void:
	
	if get_position_delta().distance_to(player[3].position)>attackDist:
		var dir = (player.position-get_position_delta()).normalized()
		velocity.x=dir.x
		velocity.y=0
		velocity.z=dir.z
		move_and_slide()











