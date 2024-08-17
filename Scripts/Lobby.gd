extends Node
class_name Lobby

var LobbyCode : String 
var HostId : int
var Players : Dictionary = {}

func _init(_id,_lobbyCode):
	HostId = _id
	LobbyCode = _lobbyCode
	
