extends Node

var zoom = Vector2(1,1)
var newZoom = 1

#not currently used but we can bring back if needed
#var playerHP = 1


func adjustZoom(defaultValue, marketpliers):
	newZoom = defaultValue * marketpliers
	zoom = Vector2(newZoom,newZoom)
	return zoom
