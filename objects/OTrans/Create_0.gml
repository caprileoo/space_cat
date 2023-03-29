/**Size var and mode setup**/

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;
enum TRANS_MODE //unchanged variables
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room; //target room set
p_target = 1.05; //drawing percentage (if exceed 1 it will fill more than borders when reset)
