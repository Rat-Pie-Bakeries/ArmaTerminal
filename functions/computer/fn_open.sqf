/**
	Creates a new computer instance with all necessary variables and blacks out screen for text.
*/
private [_target,_caller,_actionID,_users,_files,_devMode];

_target = _this select 0;					//Computer
_caller = _this select 1;					//Player Activating computer
_actionID = _this select 2;					//Action ID
_users = _this select 3;					//Users registered with computer
_files = _this select 4;					//Starting File Structure
_devMode = _this select 5;					//Boolean for weather or not armaTerminal is in dev mode

 _screenBlack = {										//fades the screen to black
	cutText ["", "BLACK FADED",0];						//fade screen to black
};

_callScreenBlack = [] call _screenBlack;		//turns screen black
_caller enableSimulation false;					//Disables *most* player activity while in terminal

_target removeAction _actionID;					//Removes open action to prevent the competing console bug

//Var Init
_currentUser = "PUBLIC";				//UserID or PUBLIC (If no user logged in)
_computerName = "ION Secure Device";	//Name of the computer
_state = "COMMANDLINE";					//State that the computer is in (COMMANDLINE, EDITOR, QUIT)
_commandLine = [] call CommandLine_fnc_newCommandLine;	//Creates the command line for the system
_color = "#33CC33";						//Text color (by default green) (can be toggled to white)
_textEditor = ["NO DOCUMENT",[""],"PUBLIC"] call Steed_fnc_newSteed;	//Strategic TExt EDitor for editing text and code files


[
	_users,		//All users registered on the computer
	_files,		//All files on the computer
	_currentUser,
	_computerName,
	_state,
	_commandLine,
	_color,
	_textEditor,
	_devMode
];