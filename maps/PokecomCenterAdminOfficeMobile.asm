	object_const_def
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3
	const POKECOMCENTERADMINOFFICEMOBILE_NURSE
	const POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST
	const POKECOMCENTERADMINOFFICEMOBILE_GAMEBOY_KID
	const POKECOMCENTERADMINOFFICEMOBILE_LASS
	const POKECOMCENTERADMINOFFICEMOBILE_POKEFAN_F

PokecomCenterAdminOfficeMobile_MapScripts:
	def_scene_scripts
	scene_const SCENE_POKECOMCENTERADMINOFFICEMOBILE_GS_BALL

	def_callbacks

GoldenrodPokecomCenterSign:
        jumptext GoldenrodPokecomCenterSignText

PokecomCenterAdminOfficeMobileNurseScript:
        jumpstd PokecenterNurseScript

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text
	
PokecomCenterAdminOfficeMobileReceptionistScript:
        jumptextfaceplayer GoldenrodPokecomCenterWelcomeToTradeCornerText
	
PokecomCenterAdminOfficeMobileGameboyKidScript:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileGameboyKidText

PokecomCenterAdminOfficeMobileLassScript:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileLassText
	
PokecomCenterAdminOfficeMobile_GSBallSceneLeft:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST, 0, 7
	disappear POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST
	appear POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST, PokecomCenterAdminOfficeMobileLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext PokecomCenterAdminOfficeMobileLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext PokecomCenterAdminOfficeMobileLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST, PokecomCenterAdminOfficeMobileLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

PokecomCenterAdminOfficeMobile_GSBallSceneRight:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST, 0, 7
	disappear POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST
	appear POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST, PokecomCenterAdminOfficeMobileLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext PokecomCenterAdminOfficeMobileLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext PokecomCenterAdminOfficeMobileLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST, PokecomCenterAdminOfficeMobileLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear POKECOMCENTERADMINOFFICEMOBILE_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end
		
PokecomCenterAdminOfficeMobilePokefanFScript:
	faceplayer
	opentext
	writetext PokecomCenterAdminOfficeMobilePokefanFDoYouHaveEonMailText
	waitbutton
	writetext PokecomCenterAdminOfficeMobileAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext PokecomCenterAdminOfficeMobilePlayerGaveAwayTheEonMailText
	waitbutton
	writetext PokecomCenterAdminOfficeMobilePokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext PokecomCenterAdminOfficeMobilePokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext PokecomCenterAdminOfficeMobilePokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext PokecomCenterAdminOfficeMobilePokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

PokecomCenterAdminOfficeMobileLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

PokecomCenterAdminOfficeMobileLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

PokecomCenterAdminOfficeMobileLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

PokecomCenterAdminOfficeMobileLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end
	
PokecomCenterAdminOfficeMobileScientist1Text:
        text "Hello there!"
	done
	
PokecomCenterAdminOfficeMobileScientist2Text:
        text "Hello there!"
	done
	
PokecomCenterAdminOfficeMobileScientist3Text:
        text "Hello there!"
	done

GoldenrodPokecomCenterWelcomeToTradeCornerText:
	text "Hello! Welcome to"
	line "#COM CENTER"
	cont "TRADE CORNER."

	para "You can trade"
	line "#MON with other"
	cont "people far away."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText: ; unreferenced
	text "To make a trade,"
	line "we must hold your"
	cont "#MON."

	para "Would you like to"
	line "trade?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText: ; unreferenced
	text "What kind of"
	line "#MON do you"
	cont "want in return?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText: ; unreferenced
	text "Fine. We will try"
	line "to trade your"

	para "@"
	text_ram wStringBuffer3
	text " for"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "We'll have to hold"
	line "your #MON"
	cont "during the trade."

	para "Please wait while"
	line "we prepare the"
	cont "room for it."
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText: ; unreferenced
	text "Fine. We will try"
	line "to trade your"

	para "@"
	text_ram wStringBuffer3
	text " for a"
	line "#MON that you"
	cont "have never seen."

	para "We'll have to hold"
	line "your #MON"
	cont "during the trade."

	para "Please wait while"
	line "we prepare the"
	cont "room for it."
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText: ; unreferenced
	text "Your trade #MON"
	line "has been received."

	para "It will take time"
	line "to find a trade"

	para "partner. Please"
	line "come back later."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText: ; unreferenced
	text "Oh? You have only"
	line "one #MON in"
	cont "your party. "

	para "Please come back"
	line "once you've in-"
	cont "creased the size"
	cont "of your party."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText: ; unreferenced
	text "We hope to see you"
	line "again."
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Communication"
	line "error…"
	done

GoldenrodPokecomCenterCantAcceptLastMonText: ; unreferenced
	text "If we accept that"
	line "#MON, what will"
	cont "you battle with?"
	done

GoldenrodPokecomCenterCantAcceptEggText: ; unreferenced
	text "Sorry. We can't"
	line "accept an EGG."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText: ; unreferenced
	text "Sorry, but your"
	line "#MON appears to"

	para "be abnormal. We"
	line "can't accept it."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText: ; unreferenced
	text "Oh? Aren't we"
	line "already holding a"
	cont "#MON of yours?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText: ; unreferenced
	text "We'll check the"
	line "rooms."

	para "Please wait."
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText: ; unreferenced
	text "Thank you for your"
	line "patience."

	para "A trade partner"
	line "has been found."
	done

GoldenrodPokecomCenterItsYourNewPartnerText: ; unreferenced
	text "It's your new"
	line "partner."

	para "Please take care"
	line "of it with love."

	para "We hope to see you"
	line "again."
	done

GoldenrodPokecomCenterYourPartyIsFullText: ; unreferenced
	text "Uh-oh. Your party"
	line "is already full."

	para "Please come back"
	line "when you have room"
	cont "in your party."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText: ; unreferenced
	text "It's unfortunate,"
	line "but no one has"

	para "come forward as a"
	line "trade partner."

	para "Would you like"
	line "your #MON back?"
	done

GoldenrodPokecomCenterReturnedYourMonText: ; unreferenced
	text "We have returned"
	line "your #MON."
	done

GoldenrodPokecomCenterYourMonIsLonelyText: ; unreferenced
	text "It's unfortunate,"
	line "but no one has"

	para "come forward as a"
	line "trade partner."

	para "We've held your"
	line "#MON for a long"

	para "time. As a result,"
	line "it is very lonely."

	para "Sorry, but we must"
	line "return it to you."
	done

PokecomCenterAdminOfficeMobileWeHopeToSeeYouAgainText_2: ; unreferenced
	text "We hope to see you"
	line "again."
	done

GoldenrodPokecomCenterContinueToHoldYourMonText: ; unreferenced
	text "Fine. We will"
	line "continue to hold"
	cont "your #MON."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText: ; unreferenced
	text "Oh? You left your"
	line "#MON with us"
	cont "only recently."

	para "Please come back"
	line "later."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText: ; unreferenced
	text "We'll SAVE before"
	line "connecting to the"
	cont "CENTER."
	done

GoldenrodPokecomCenterWhichMonToTradeText: ; unreferenced
	text "Which #MON do"
	line "you want to trade?"
	done

GoldenrodPokecomCenterTradeCanceledText: ; unreferenced
	text "Sorry, but we must"
	line "cancel the trade."
	done

GoldenrodPokecomCenterEggTicketText: ; unreferenced
	text "Oh!"

	para "I see you have an"
	line "EGG TICKET!"

	para "It's a coupon that"
	line "special people can"

	para "redeem for a"
	line "special #MON!"
	done

GoldenrodPokecomCenterOddEggBriefingText: ; unreferenced
	text "Let me give you a"
	line "quick briefing."

	para "Trades held at the"
	line "TRADE CORNER are"

	para "between two"
	line "trainers who don't"

	para "know each other's"
	line "identity."

	para "As a result, it"
	line "may take time."

	para "However, an ODD"
	line "EGG is available"
	cont "just for you."

	para "It will be sent to"
	line "you right away."

	para "Please choose one"
	line "of the rooms in"

	para "the CENTER."
	line "An ODD EGG will be"

	para "sent from the"
	line "chosen room."
	done

GoldenrodPokecomCenterPleaseWaitAMomentText: ; unreferenced
	text "Please wait a"
	line "moment."
	done

GoldenrodPokecomCenterHereIsYourOddEggText: ; unreferenced
	text "Thank you for"
	line "waiting."

	para "We received your"
	line "ODD EGG."

	para "Here it is!"

	para "Please raise it"
	line "with loving care."
	done

GoldenrodPokecomCenterNoEggTicketServiceText: ; unreferenced
	text "I'm awfully sorry."

	para "The EGG TICKET"
	line "exchange service"
	cont "isn't running now."
	done

GoldenrodPokecomCenterNewsMachineText: ; unreferenced
	text "It's a #MON"
	line "NEWS MACHINE."
	done

GoldenrodPokecomCenterWhatToDoText: ; unreferenced
	text "What would you"
	line "like to do?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText: ; unreferenced
	text "#MON NEWS is"
	line "news compiled from"

	para "the SAVE files of"
	line "#MON trainers."

	para "When reading the"
	line "NEWS, your SAVE"

	para "file may be sent"
	line "out."

	para "The SAVE file data"
	line "will contain your"

	para "adventure log and"
	line "mobile profile."

	para "Your phone number"
	line "will not be sent."

	para "The contents of"
	line "the NEWS will vary"

	para "depending on the"
	line "SAVE files sent by"

	para "you and the other"
	line "#MON trainers."

	para "You might even be"
	line "in the NEWS!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText: ; unreferenced
	text "Would you like to"
	line "get the NEWS?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText: ; unreferenced
	text "Reading the latest"
	line "NEWS… Please wait."
	done

GoldenrodPokecomCenterNoOldNewsText: ; unreferenced
	text "There is no old"
	line "NEWS…"
	done

GoldenrodPokecomCenterCorruptedNewsDataText: ; unreferenced
	text "The NEWS data is"
	line "corrupted."

	para "Please download"
	line "the NEWS again."
	done

GoldenrodPokecomCenterMakingPreparationsText: ; unreferenced
	text "We're making"
	line "preparations."

	para "Please come back"
	line "later."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText: ; unreferenced
	text "We will SAVE your"
	line "progress before"

	para "starting the NEWS"
	line "MACHINE."
	done

GoldenrodPokecomCenterPerson1Text: ; unreferenced
	text "Whoa, this #MON"
	line "CENTER is huge."

	para "They just built"
	line "this place. They"

	para "installed lots of"
	line "new machines too."
	done

GoldenrodPokecomCenterPerson2Text: ; unreferenced
	text "I thought up a fun"
	line "new thing for the"
	cont "TRADE CORNER!"

	para "I make a PIDGEY"
	line "hold MAIL, then"

	para "put it up for"
	line "trade for another"
	cont "one!"

	para "If everyone did"
	line "that, MAIL could"

	para "be traded with all"
	line "sorts of people!"

	para "I call it PIDGEY"
	line "MAIL!"

	para "If it becomes"
	line "popular, I might"

	para "make lots of new"
	line "friends!"
	done

GoldenrodPokecomCenterPerson3Text: ; unreferenced
	text "They said you can"
	line "trade #MON with"

	para "total strangers up"
	line "here."

	para "But they're still"
	line "adjusting things."
	done

GoldenrodPokecomCenterPerson4Text: ; unreferenced
	text "Some girl I don't"
	line "know sent me her"

	para "HOPPIP."
	line "You should trade"

	para "for a #MON that"
	line "you want."
	done

GoldenrodPokecomCenterPerson5Text: ; unreferenced
	text "I received a"
	line "female HOPPIP, but"
	cont "its named STANLEY!"

	para "That's my dad's"
	line "name!"
	done

GoldenrodPokecomCenterPerson6Text: ; unreferenced
	text "What is the NEWS"
	line "MACHINE?"

	para "Does it get news"
	line "from a wider area"
	cont "than the radio?"
	done

GoldenrodPokecomCenterPerson7Text: ; unreferenced
	text "The #COM CENTER"
	line "will link with all"

	para "#MON CENTERS in"
	line "a wireless net."

	para "That must mean"
	line "I'll be able to"

	para "link with all"
	line "sorts of people."
	done

GoldenrodPokecomCenterPerson8Text: ; unreferenced
	text "The machines here"
	line "can't be used yet."

	para "Still, it's nice"
	line "coming to a trendy"

	para "place before other"
	line "people."
	done

GoldenrodPokecomCenterPerson9Text: ; unreferenced
	text "My friend was in"
	line "the NEWS a while"

	para "back. I was really"
	line "surprised!"
	done

GoldenrodPokecomCenterPerson10Text: ; unreferenced
	text "I get anxious if I"
	line "don't check out"
	cont "the latest NEWS!"
	done

GoldenrodPokecomCenterPerson11Text: ; unreferenced
	text "If I get in the"
	line "NEWS and become"

	para "famous, I bet I'll"
	line "be adored."

	para "I wonder how I"
	line "could get in the"
	cont "NEWS?"
	done

PokecomCenterAdminOfficeMobileGameboyKidText:
	text "The COLOSSEUM"
	line "upstairs is for"
	cont "link battles."

	para "Battle records are"
	line "posted on the"

	para "wall, so I can't"
	line "afford to lose."
	done

GoldenrodPokecomCenterPerson12Text: ; unreferenced
	text "I came over here"
	line "when I got word"

	para "that GOLDENROD's"
	line "#MON CENTER has"

	para "new machines that"
	line "no one's ever seen"
	cont "before."

	para "But it looks like"
	line "they're still busy"

	para "with all their"
	line "preparations…"
	done

GoldenrodPokecomCenterPerson13Text: ; unreferenced
	text "Just seeing all"
	line "these new things"

	para "here makes me feel"
	line "younger!"
	done

PokecomCenterAdminOfficeMobileLassText:
	text "A higher level"
	line "#MON doesn't"
	cont "always win."

	para "After all, it may"
	line "have a type dis-"
	cont "advantage."

	para "I don't think"
	line "there is a single"

	para "#MON that is"
	line "the toughest."
	done

PokecomCenterAdminOfficeMobileLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>, isn't it?"

	para "Congratulations!"

	para "As a special deal,"
	line "a GS BALL has been"
	cont "sent just for you!"

	para "Please accept it!"
	done

PokecomCenterAdminOfficeMobileLinkReceptionistPleaseDoComeAgainText:
	text "Please do come"
	line "again!"
	done

GoldenrodPokecomCenterSignText: ; unreferenced
	text "#COM CENTER"
	line "1F INFORMATION"

	para "Left:"
	line "ADMINISTRATION"

	para "Center:"
	line "TRADE CORNER"

	para "Right:"
	line "#MON NEWS"
	done

GoldenrodPokecomCenterNewsMachineNotYetText: ; unreferenced
	text "It's a #MON"
	line "NEWS MACHINE!"

	para "It's not in"
	line "operation yet…"
	done

PokecomCenterAdminOfficeMobilePokefanFDoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have something"
	cont "named EON MAIL?"

	para "My daughter is"
	line "after one."

	para "You can part with"
	line "one, can't you?"
	done

PokecomCenterAdminOfficeMobileAskGiveAwayAnEonMailText:
	text "Give away an EON"
	line "MAIL?"
	done

PokecomCenterAdminOfficeMobilePokefanFThisIsForYouText:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

PokecomCenterAdminOfficeMobilePokefanFDaughterWillBeDelightedText:
	text "My daughter will"
	line "be delighted!"
	done

PokecomCenterAdminOfficeMobilePokefanFTooBadText:
	text "Oh? You don't have"
	line "one? Too bad."
	done

PokecomCenterAdminOfficeMobilePokefanFAnotherTimeThenText:
	text "Oh… Well, another"
	line "time, then."
	done

PokecomCenterAdminOfficeMobilePlayerGaveAwayTheEonMailText:
	text "<PLAYER> gave away"
	line "the EON MAIL."
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15
	warp_event  0, 15, POKECENTER_2F, 1
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0, 31, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  1, 31, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1

	def_coord_events

	def_bg_events
	bg_event  2,  9, BGEVENT_READ, GoldenrodPokecomCenterSign
	
	def_object_events
	object_event  7,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileNurseScript, -1
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
	object_event 16,  8, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileReceptionistScript, -1
	object_event 10, 12, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileGameboyKidScript, -1
	object_event 21,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileLassScript, -1
	object_event 19, 12, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobilePokefanFScript, -1
