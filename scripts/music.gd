extends AudioStreamPlayer

const title_music = preload("res://assets/music/track3.ogg")
const level_music_1 = preload("res://assets/music/track1.ogg")
const level_music_2 = preload("res://assets/music/track2.ogg")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()

func play_title_music():
	_play_music(title_music)

func play_level_music_1():
	_play_music(level_music_1)

func play_level_music_2():
	_play_music(level_music_2)
