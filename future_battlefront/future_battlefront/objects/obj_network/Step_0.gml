/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

while(steam_net_packet_receive())
{
	steam_net_packet_get_data(inbuf);
	receive_buffer(inbuf);
}

if(global.frame_real <= min(global.frame,global.frame_enemy)-global.buffering)
{
	//if(array_length(act_queue[0]) > 0){show_message($"{act_queue[0][0]}\n{global.frame_real}")}
	while(array_length(act_queue[0]) > 0 and act_queue[0][0][0] == global.frame_real)
	{
		var func = act_queue[0][0][1];
		func();
		array_delete(act_queue[0],0,1);
	}
	
	while(array_length(act_queue[1]) > 0 and act_queue[1][0][0] == global.frame_real)
	{
		var func = act_queue[1][0][1];
		func();
		array_delete(act_queue[1],0,1);
	}
	
	with(all)
	{
		if(variable_instance_exists(id,"update"))
		{
			update();
		}
	}
	
	global.frame_real++;
}



















