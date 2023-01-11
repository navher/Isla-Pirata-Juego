extends Node2D

func _ready():
	# Reproducimos la música de fondo
	$Sound/Music.play()
	
var coins : int
var consumibles : int

var key : String = '0/1'
