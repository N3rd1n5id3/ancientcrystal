	object_const_def

PewterMuseumOfScience2F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseumOfScience2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 5

	def_coord_events

	def_bg_events
	bg_event  3,  6, BGEVENT_READ, Museum2FMoonStoneSignpostScript
	bg_event  6,  3, BGEVENT_READ, OmastarFossilSignpostScript

	def_object_events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, jumptextfaceplayer, Museum2FScientistScript, -1
	object_event  1,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, jumptextfaceplayer, Museum2FYoungsterScript, -1
	object_event  2,  1, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, jumptextfaceplayer, Museum2FBeautyScript, -1
	object_event 12,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum2FCooltrainerMScript, -1
	
	Museum2FScientistScript:
	faceplayer
	opentext
	writetext Museum2FScientistText
	
	Museum2FYoungsterScript:
	faceplayer
	opentext
	writetext Museum2FChildText
	
	Museum2FBeautyScript:
	faceplayer
	opentext
	writetext Museum2FBeautyText
	
	Museum2FCooltrainerMScript:
	faceplayer
	opentext
	writetext Museum2FCooltrainerMText
	
	Museum2FMoonStoneSignpostScript:
	faceplayer
	opentext
	writetext Museum2FMoonStoneSignpostText
	
	OmastarFossilSignpostScript:
	refreshscreen
	pokepic OMASTAR
	waitbutton
	closepokepic
	opentext
	writetext OmastarFossilSignpostText
	
	Museum2FScientistText:
	text "Meteorites struck"
	line "Mt.Moon near"
	cont "Pewter City."

	para "We have one"
	line "on display."

	para "It seems to emit"
	line "strange energy…"
	done
	
	Museum2FChildText:
	text "Stuff and rocks"
	line "and rocks and"

	para "stuff. Can we go"
	line "already?"
	done
	
	Museum2FBeautyText:
	text "#mon revived"
	line "from fossils are"

	para "all part Rock-"
	line "type."

	para "Were they always"
	line "that way, or is it"

	para "a result of the"
	line "fossilization"
	cont "process?"
	done
	
	Museum2FCooltrainerMText:
	text "This space shuttle"
	line "used to fly 250"

	para "kilometers above"
	line "the earth, defy-"
	cont "ing gravity!"

	para "You know what else"
	line "can defy gravity?"

	para "Seismic Toss,"
	line "of course!"
	done
	
	Museum2FMoonStoneSignpostText:
	text "Meteorite that"
	line "fell on Mt.Moon."
	cont "(Moon Stone)"
	done
	
	OmastarFossilSignpostText:
	text "Omastar Fossil"
	line "(Helix)"

	para "A primitive and"
	line "rare #mon."
	done

