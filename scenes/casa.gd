extends Area2D
var podeInteragir = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (podeInteragir == true) and Input.is_action_just_pressed("interact"):
		Dados.residencial = true
		Dados.posicaoPlayer = $"../Player".position
		
		Dados.animation_player = $"../AnimationPlayer"
		Dados.currentTimePos = Dados.animation_player.current_animation
		var resultado = get_tree().change_scene_to_file("res://scenes/mundo_2.tscn")
		if resultado != OK:
			push_error("Falha ao trocar de cena. Código de erro: %s" % resultado)
	if (Dados.chave == true):
		Dados.chave = false
		Dados.animation_player.current_animation = Dados.currentTimePos
	print(Dados.residencial)
	


func _on_body_entered(_body: Node2D) -> void:
	$Label2.show()
	podeInteragir = true
	Dados.residencial = true
	print(podeInteragir)

func _on_body_exited(_body: Node2D) -> void:
	$Label2.hide()
	podeInteragir = false
	Dados.residencial = false
	print(podeInteragir)
