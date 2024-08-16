extends Node

var zoom = Vector2(5,5)

func adjustZoom(newZoom):
	zoom = Vector2(newZoom,newZoom)
	return zoom
