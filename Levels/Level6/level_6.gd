extends BaseLevel



func _initialize_(_p: Player): 
	super._initialize_(_p)
	p.input_mode = BaseInputHandler.InputMode.updown
