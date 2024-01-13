// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function act(cmd){
	for(var a = 0 ; a < steam_lobby_get_member_count() ; a++)
	{
		var player = steam_lobby_get_member_id(a);
		
		if(steam_get_user_steam_id() == player)
			continue;
		
		var buff = buffer_create(1, buffer_grow, 1);
		buffer_seek(buff, buffer_seek_start, 0);
		buffer_write(buff , buffer_u32, global.frame);
		buffer_write(buff , buffer_u16, cmd);
		buffer_write(buff , buffer_u8, global.player_position);
		for(var i = 1; i < argument_count; i++)
		{
			buffer_write(buff , argument[i][0], argument[i][1]);
		}
		steam_net_packet_send(player, buff )
		buffer_delete(buff );
	}
	
	var buff = buffer_create(1, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff , buffer_u32, global.frame);
	buffer_write(buff , buffer_u16, cmd);
	buffer_write(buff , buffer_u8, global.player_position);
	for(var i = 1; i < argument_count; i++)
	{
		buffer_write(buff , argument[i][0], argument[i][1]);
	}
	with(obj_network)
	{
		inbuf = buff;
		buffer_seek(inbuf, buffer_seek_start, 0);
		receive_buffer(inbuf);
	}
}