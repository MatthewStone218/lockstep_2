/// @description Insert description here
// You can write your code in this editor

function update()
{
	var incy = instance_nearest(x,y,obj_unit_bionic_short);
	if(instance_exists(incy))
	{
		x += lengthdir_x(1,point_direction(incy.x,incy.y,x,y));
		y += lengthdir_y(1,point_direction(incy.x,incy.y,x,y));
	}
}