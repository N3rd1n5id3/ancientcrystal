	object_const_def

PewterMuseumOfScience1F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseumOfScience1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 6
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, KabutopsFossilSignpostScript
	bg_event  2,  6, BGEVENT_READ, AerodactylFossilSignpostScript
	bg_event 12,  1, BGEVENT_READ, Museum1FBookshelfSignpostText
	bg_event 13,  1, BGEVENT_READ, Museum1FBookshelfSignpostText
	bg_event 14,  1, BGEVENT_READ, Museum1FBookshelfSignpostText
	bg_event 15,  1, BGEVENT_READ, Museum1FBookshelfSignpostText
	bg_event 17,  1, BGEVENT_READ, Museum1FBookshelfSignpostText

	def_object_events
	object_event 18,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Museum1FFossilScientistScript, -1
	object_event 12,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FReceptionistScript, -1
	object_event 17,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, jumptextfaceplayer, Museum1FScientistText, -1
	object_event  1,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, jumptextfaceplayer, Museum1FGrampsText, -1
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PAL_NPC_RED, OBJECTTYPE_SCRIPT, jumptextfaceplayer, Museum1FYoungsterText, -1

	object_const_def
	const PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2
	
Museum1FFossilScientistScript:
	faceplayer
	opentext
	writetext Museum1FFossilScientistText
	waitbutton
	checkitem HELIX_FOSSIL
	iftrue .own_helix
	checkitem DOME_FOSSIL
	iftrue .own_dome
	checkitem OLD_AMBER
	iftrue .own_old_amber
	checkitem FOSSIL_EGG
	iftrue .ask_fossil_egg
	jumptext NoFossilsText

.own_helix
	checkitem DOME_FOSSIL
	iftrue .own_helix_dome
	checkitem OLD_AMBER
	iftrue .own_helix_dome_amber
	checkitem FOSSIL_EGG
	iftrue .ask_helix_dome_amber_egg
	writetext AskHelixFossilText
	yesorno
	iftrue ResurrectHelixFossil
	sjump .maybe_later

.own_dome
	checkitem OLD_AMBER
	iftrue .own_dome_amber
	checkitem FOSSIL_EGG
	iftrue .ask_dome_amber_egg
	writetext AskDomeFossilText
	yesorno
	iftrue ResurrectDomeFossil
	sjump .maybe_later
	
.own_old_amber
        checkitem FOSSIL_EGG
	iftrue .ask_amber_egg
	writetext AskOldAmberText
	yesorno
	iftrue ResurrectOldAmber
	sjump .maybe_later
	
.ask_fossil_egg
        writetext AskOldAmberText
	yesorno
	iftrue ResurrectFossilEgg
	sjump .maybe_later
	
.own_helix_dome
	checkitem OLD_AMBER
	iftrue .own_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectHelixFossil
	ifequal $2, ResurrectDomeFossil
	sjump .maybe_later
	
.own_helix_dome_amber
        checkitem FOSSIL_EGG
	iftrue .ask_helix_dome_amber_egg
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectHelixFossil
	ifequal $2, ResurrectDomeFossil
	ifequal $3, ResurrectOldAmber
        sjump .maybe_later

.ask_amber_egg
        loadmenu AmberEggMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectOldAmber
	ifequal $2, ResurrectFossilEgg
	sjump .maybe_later

.ask_helix_amber
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectHelixFossil
	ifequal $2, ResurrectOldAmber
	sjump .maybe_later

.own_dome_amber
	checkitem FOSSIL_EGG
	iftrue .ask_dome_amber_egg
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectDomeFossil
	ifequal $2, ResurrectOldAmber
	sjump .maybe_later
	
.ask_dome_amber_egg
        loadmenu DomeAmberEggDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectDomeFossil
	ifequal $2, ResurrectOldAmber
	ifequal $3, ResurrectFossilEgg
	sjump .maybe_later

.ask_helix_dome_amber_egg
	loadmenu HelixDomeAmberEggMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectHelixFossil
	ifequal $2, ResurrectDomeFossil
	ifequal $3, ResurrectOldAmber
	ifequal $4, ResurrectFossilEgg
.maybe_later:
	jumptext MaybeLaterText

HelixDomeMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Cancel@"

HelixAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Old Amber@"
	db "Cancel@"

DomeAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"
	
AmberEggMenuDataHeader:
        db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Old Amber@"
	db "Fossil Egg@"
	db "Cancel@"

HelixDomeAmberMenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"
	
DomeAmberEggDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Dome Fossil@"
	db "Old Amber@"
	db "Fossil Egg@"
	db "Cancel@"
	
HelixDomeAmberEggMenuDataHeader:
        db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 5 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Old Amber@"
	db "Fossil Egg@"
	db "Cancel@"

ResurrectHelixFossil:
	takeitem HELIX_FOSSIL
	scall ResurrectAFossilScript
	givepoke OMANYTE, 20
	sjump FinishResurrect

ResurrectDomeFossil:
	takeitem DOME_FOSSIL
	scall ResurrectAFossilScript
	givepoke KABUTO, 20
	sjump FinishResurrect

ResurrectOldAmber:
	takeitem OLD_AMBER
	scall ResurrectAFossilScript
	givepoke AERODACTYL, 20
	
ResurrectFossilEgg:
	takeitem FOSSIL_EGG
	scall ResurrectAFossilScript
	givepoke LARVITAR, 20
FinishResurrect:
	ifequal PARTY_LENGTH, NoRoomForFossilPokemonText
	jumptext TakeGoodCareOfItText

ResurrectAFossilScript:
	writetext ResurrectingPokemonText
	waitbutton
	closetext
	turnobject PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2, RIGHT
	pause 15
	playsound SFX_BOOT_PC
	waitsfx
	pause 30
	playsound SFX_4_NOTE_DITTY
	waitsfx
	pause 5
	waitsfx
	pause 30
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	faceplayer
	opentext
	end

Museum1FReceptionistScript:
	readvar VAR_FACING
	ifequal DOWN, .Sneak
	ifequal LEFT, .Sneak
	faceplayer
	opentext
	writetext Museum1FReceptionistWelcome
	waitbutton
	closetext
	end

.Sneak:
	jumptextfaceplayer Museum1FReceptionistSneak

KabutopsFossilSignpostScript:
	refreshscreen
	pokepic KABUTOPS
	waitbutton
	closepokepic
	opentext
	writetext KabutopsFossilSignpostText
	closetext
	end

AerodactylFossilSignpostScript:
	refreshscreen
	pokepic AERODACTYL
	waitbutton
	closepokepic
	opentext
	writetext AerodactylFossilSignpostText
	closetext
	end

Museum1FScientistText:
	text "We are proud of"
	line "three fossils of"

	para "rare, prehistoric"
	line "#mon."

	para "I helped assemble"
	line "them!"
	done

Museum1FFossilScientistText:
	text "Did you know that"
	line "you can extract"

	para "#mon from"
	line "fossils?"

	para "If you ever need"
	line "to, let me take"
	cont "care of it!"
	done

Museum1FGrampsText:
	text "That is one"
	line "magnificent"
	cont "fossil!"
	done

Museum1FYoungsterText:
	text "There are two"
	line "places that I"
	cont "love!"

	para "One is the Ruins"
	line "of Alph in Johto."

	para "The other is the"
	line "Pewter Museum!"

	para "I get a sense of"
	line "history from both"
	cont "of them."
	done

Museum1FBookshelfSignpostText:
	text "Thick and well-"
	line "read books!"

	para "Archaeology Man-"
	line "ual, Lost #mon,"
	cont "#mon Ancestors,"

	para "Caring at the"
	line "Loamy Layer of"
	cont "Kanto…"
	done

AskHelixFossilText:
	text "Do you want to"
	line "resurrect the"
	cont "Helix Fossil?"
	done

AskDomeFossilText:
	text "Do you want to"
	line "resurrect the"
	cont "Dome Fossil?"
	done

AskOldAmberText:
	text "Do you want to"
	line "resurrect the"
	cont "Old Amber?"
	done
	
AskFossilEggText:
	text "Do you want to"
	line "resurrect the"
	cont "Fossil Egg?"
	done

NoFossilsText:
	text "Hey! You don't"
	line "have any fossils."
	done

MaybeLaterText:
	text "Just talk to me"
	line "if you change"
	cont "your mind."
	done

ResurrectingPokemonText:
	text "OK! I'll resurrect"
	line "the #mon!"
	done

NoRoomForFossilPokemonText:
	text "Hey! You can't"
	line "carry another"
	cont "#mon, and your"
	cont "box is full, too!"
	done

TakeGoodCareOfItText:
	text "Take good care"
	line "of it!"
	done
	
Museum1FReceptionistWelcome:
        text "Welcome!"

	para "Thanks to a gene-"
	line "rous donation"
	cont "by Silph Co.,"

	para "admission is free"
	line "of charge!"

	para "Please go ahead."
	done
	
Museum1FReceptionistSneak:
        text "You can't sneak"
	line "in the back way!"
	done
	
KabutopsFossilSignpostText:	
        text "Kabutops Fossil"
	line "(Dome)"

	para "A primitive and"
	line "rare #mon."
	done
	
AerodactylFossilSignpostText:	
	
	text "Aerodactyl Fossil"

	para "A primitive and"
	line "rare #mon."
	done
