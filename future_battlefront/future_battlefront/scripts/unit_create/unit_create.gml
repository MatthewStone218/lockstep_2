// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function unit_create(player,xx,yy,unit){
	instance_create_depth(xx,yy,0,unit,{player: player});
}