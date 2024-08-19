extends Node

var zoom = Vector2(1,1)
var newZoom = 1

#Three player sizes, 2 is default, 1 is small, 3 is large
var playerSize = 2

#Player can change size except in certain areas
var canChangeSize = true

#Sets every value to default
func gameStart():
	gameManager.playerSize = 2
	gameManager.canChangeSize = true

#not currently used but we can bring back if needed
#var playerHP = 1


func adjustZoom(defaultValue, marketpliers):
	newZoom = defaultValue * marketpliers
	zoom = Vector2(newZoom,newZoom)
	return zoom
