/client
		//////////////////////
		//BLACK MAGIC THINGS//
		//////////////////////
	parent_type = /datum
		////////////////
		//ADMIN THINGS//
		////////////////
	var/datum/admins/holder = null
	var/datum/admins/deadmin_holder = null

		/////////
		//OTHER//
		/////////
	var/datum/preferences/prefs = null
	var/adminobs		= null

	// Runechat messages
	var/list/seen_messages

	///datum that controls the displaying and hiding of tooltips
	var/datum/tooltip/tooltips

	var/adminhelped = 0

	var/staffwarn = null

	/// List that stores the object and parameters related to the selected target during mouse events in the client. Allows the client to remember the target selected during a "MouseDown" event or update the selection during a "MouseDrag" event.
	var/list/selected_target[2]

		///////////////
		//SOUND STUFF//
		///////////////

	/// Whether or not the client is currently playing the "ship hum" ambience sound.
	var/playing_vent_ambience = FALSE

	/// The next threshold time for the client to be able to play basic ambience sounds.
	var/next_ambience_time = 0


		////////////
		//SECURITY//
		////////////
	// comment out the line below when debugging locally to enable the options & messages menu
	//control_freak = 1

	var/received_irc_pm = -99999
	var/irc_admin			//IRC admin that spoke with them last.
	var/mute_irc = 0
	var/warned_about_multikeying = 0	// Prevents people from being spammed about multikeying every time their mob changes.

		////////////////////////////////////
		//things that require the database//
		////////////////////////////////////
	var/player_age = "Requires database"	//So admins know why it isn't working - Used to determine how old the account is - in days.
	var/related_accounts_ip = "Requires database"	//So admins know why it isn't working - Used to determine what other accounts previously logged in from this ip
	var/related_accounts_cid = "Requires database"	//So admins know why it isn't working - Used to determine what other accounts previously logged in from this computer id

	/*
	As of byond 512, due to how broken preloading is, preload_rsc MUST be set to 1 at compile time if resource URLs are *not* in use,
	BUT you still want resource preloading enabled (from the server itself). If using resource URLs, it should be set to 0 and
	changed to a URL at runtime (see client_procs.dm for procs that do this automatically). More information about how goofy this broken setting works at
	http://www.byond.com/forum/post/1906517?page=2#comment23727144
	*/
	preload_rsc = 0

	var/fullscreen = FALSE


	    //////////
		//ASSETS//
		//////////

 	///world.time they connected
	var/connection_time
 	///world.realtime they connected
	var/connection_realtime
 	///world.timeofday they connected
	var/connection_timeofday
