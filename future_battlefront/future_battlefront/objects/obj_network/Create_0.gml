/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

global.frame_real = 0;
global.frame = 0;
global.frame_enemy = 0;
global.buffering = 10;

buffering_now = 0;

inbuf = buffer_create(16, buffer_grow, 1);
act_queue = [[],[]];

function receive_buffer(inbuf)
{
	buffer_seek(inbuf, buffer_seek_start, 0);
	var _frame = buffer_read(inbuf, buffer_u32);
	var index = buffer_read(inbuf, buffer_u16);
	var player = buffer_read(inbuf, buffer_u8);
	
	switch (index)
	{
		case NT.FRAME_UPDATE:
			if(player != global.player_position){global.frame_enemy = _frame;}
		break;
		case NT.UNIT_CREATE:
			var xx = buffer_read(inbuf, buffer_u16);
			var yy = buffer_read(inbuf, buffer_u16);
			var unit = buffer_read(inbuf, buffer_u16);
			array_push(act_queue[player],
				[_frame,method({xx: xx, yy: yy, player: player, unit: unit},function(){unit_create(player,xx,yy,unit)})]
			)
		break;
	}
}

function frame_update()
{	
	global.frame++;
	act(NT.FRAME_UPDATE);
}


enum NT
{
	FRAME_UPDATE,
	UNIT_CREATE
}






















