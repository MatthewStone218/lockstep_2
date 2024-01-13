/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(buffering_now == 0)
{
	if(global.frame-global.frame_enemy < 10)
	{
		frame_update();
	}
	else
	{
		buffering_now = 1;
	}
}
else
{
	if(global.frame_enemy >= global.frame)
	{
		buffering_now = 0;
	}
}



















