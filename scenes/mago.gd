extends Area2D
var isInsideM = false
@onready var label: PanelContainer = $PanelContainer
var current = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("interact") and isInsideM == true):
		if (Dados.pontuacao < 50):
			$PanelContainer/Label.text = str("Opa jovem... agente precisa de 50 centavos. \n faz o seguinte, planta \n 50 cenouras que eu te pago.")
		else:
			$PanelContainer/Label.text = str("Muito obrigado meu filho \n escuta que essa é braba!")
			match current:
				0:
					current = 1
					$"../AudioStreamPlayer".stop()
					$"../AudioStreamPlayer".stream = load("res://assets/sounds/Alceu Valença - De Teresina a São Luis.mp3")
					$"../AudioStreamPlayer".play()
				1:
					current = 2
					$"../AudioStreamPlayer".stop()
					$"../AudioStreamPlayer".stream = load("res://assets/sounds/Karolina Com K.mp3")
					$"../AudioStreamPlayer".play()
				2:
					current = 3
					$"../AudioStreamPlayer".stop()
					$"../AudioStreamPlayer".stream = load("res://assets/sounds/Pagode Russo.mp3")
					$"../AudioStreamPlayer".play()
				3:
					current = 4
					$"../AudioStreamPlayer".stop()
					$"../AudioStreamPlayer".stream = load("res://assets/sounds/Numa Sala de Reboco.mp3")
					$"../AudioStreamPlayer".play()
				4:
					current = 5
					$"../AudioStreamPlayer".stop()
					$"../AudioStreamPlayer".stream = load("res://assets/sounds/Luiz Gonzaga - Asa Branca ft. Fagner, Sivuca, Guadalupe.mp3")
					$"../AudioStreamPlayer".play()
				5:
					current = 6
					$"../AudioStreamPlayer".stop()
					$"../AudioStreamPlayer".stream = load("res://assets/sounds/LENGO TENGO.mp3")
					$"../AudioStreamPlayer".play()
				
func _on_body_entered(body: Node2D) -> void:
	label.show()
	isInsideM = true
	
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	label.hide()
	isInsideM = false
	pass # Replace with function body.
