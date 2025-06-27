extends CharacterBody2D

const SPEED = 100  # Velocidade do personagem
const runSpeed = 1.4
@onready var playerTexture = $anim as AnimatedSprite2D
var sideY = 0
var sideX = 0
func _ready():
	playerTexture.play("idle_down")
func read_input():
	var direction = Vector2.ZERO
	
	##Animações de movimento
	if Input.is_action_pressed("up"):
		if Input.is_action_pressed("shift"):
			direction.y -= runSpeed
			playerTexture.play("run_up")
		else:
			playerTexture.play("walk_up")
			direction.y -= 1
	elif Input.is_action_pressed("down"):
		if Input.is_action_pressed("shift"):
			direction.y += runSpeed
			playerTexture.play("run_down")
		else:
			playerTexture.play("walk_down")
			direction.y += 1
		
	elif Input.is_action_pressed("left"):
		playerTexture.scale.x = -1
		if Input.is_action_pressed("shift"):
			direction.x -= runSpeed
			playerTexture.play("run_side")
		else:
			direction.x -= 1
			playerTexture.play("walk_side")
	elif Input.is_action_pressed("right"):
		playerTexture.scale.x = 1
		if Input.is_action_pressed("shift"):
			direction.x += runSpeed
			playerTexture.play("run_side")
		else:
			direction.x += 1
			playerTexture.play("walk_side")
		
	##Animações Idle
	if Input.is_action_just_released("down"):
		playerTexture.play("idle_down")
	if Input.is_action_just_released("up"):
		playerTexture.play("idle_up")
	if Input.is_action_just_released("left"):
		playerTexture.play("idle_side")
	if Input.is_action_just_released("right"):
		playerTexture.play("idle_side")
		
	
	velocity = direction * SPEED
	
func _physics_process(_delta):
	read_input()
	move_and_slide()
	
