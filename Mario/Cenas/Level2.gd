extends Node2D


func _ready():
	$AudioFundo.play()
	$Portal.SubirDescer()




func _on_Player_morreu():
	$Player.morte()
	$AudioFundo.stop()
	$morte.play()
