extends Resource
class_name EntityInfo

var entity_names : Dictionary[String, String] = {
	"Name": "Lars",
	"Fuction": "Offensive"
}

var entity_skin : Dictionary[String, int] = {
	"Head": 1,
	"Body": 1,
	"Footer": 1,
}

var entity_core : Dictionary[String, int] = {
	"Health": 10,
	"Precision": 65,
	### FIXME: ADD MORE
}

var entity_resistances: Dictionary[String, int] ={
	"Bleed" = 55,
	"Poison" = 55,
	### FIXME: ADD MORE
}

var entity_habilities: Dictionary[String, String] ={
	"HAB_1" = "Golpe Baixo"
	### FIXME: ADD MORE
}

var entity_custom_properties: Dictionary[String, Array] ={
	"BUFFs" = ["Animado"],
	"DEBUFFs" = ["Medo de Abelha"],
	"CUSTOM" = ["LOW_CHANCE = Ao passar nas penumbras, pode ganha fazer um assobio"]
}
