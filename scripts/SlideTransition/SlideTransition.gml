// SlideTransition(mode, targetRoom)
/// @arg Mode sets transition mode between next, restart and goto.
/// @arg Target sets target room when using the goto mode.
with (OTrans){
	mode = argument[0];
	
	if (argument_count > 1) target = argument[1];
}