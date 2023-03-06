PewterMuseumOfScience2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, Museum2FMoonStoneSignpostScript
	bg_event  2,  6, BGEVENT_READ, OmastarFossilSignpostScript

	def_object_events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FScientistText, -1
	object_event  0,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FYoungsterText, -1
	object_event  2,  1, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FBeautyText, -1
	object_event 12,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FTeacherText, -1


Museum2FMoonStoneSignpostScript:
	jumptext Museum2FMoonStoneSignpostText