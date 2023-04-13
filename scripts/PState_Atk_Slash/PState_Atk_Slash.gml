/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 426FEB83
/// @DnDArgument : "code" "function PState_Atk_Slash(){$(13_10)	ProcessAttack(SKingAtk,SKingAtkHB);$(13_10)	if (animation_end())$(13_10)	{$(13_10)		hsp = 0;$(13_10)		vsp = 0;$(13_10)		sprite_index = sKing;$(13_10)		state = PSTATE.FREE;$(13_10)	}$(13_10)}"
function PState_Atk_Slash(){
	ProcessAttack(SKingAtk,SKingAtkHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sKing;
		state = PSTATE.FREE;
	}
}