extends Node

@onready var count: Label = %Count


var zoom = Vector2(1,1)
var newZoom = 1
var playerHP = 1
var gameWin = false
var timeCanChangeMax: int = 3
var timeCanChange: int = 3
var changeCameraSize = false

#Three player sizes, 2 is default, 1 is small, 3 is large
var playerSize = 2

#Player can change size except in certain areas
var canChangeSize = true

#Sets every value to default
func gameStart(maxTimeChanges):
	gameManager.playerSize = 2
	gameManager.canChangeSize = true
	gameManager.playerHP = 1
	gameManager.timeCanChangeMax = maxTimeChanges
	gameManager.timeCanChange = timeCanChangeMax

func adjustZoom(defaultValue, marketpliers):
	newZoom = defaultValue * marketpliers
	zoom = Vector2(newZoom,newZoom)
	return zoom
