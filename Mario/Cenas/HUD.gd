extends CanvasLayer

func _ready():
	update_hud()

func update_hud():
	$Moedas.text = str(Global.score)
	$vidas.text = str(Global.vidas)
