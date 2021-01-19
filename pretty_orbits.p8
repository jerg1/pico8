pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
pi=3.14159

earth={}
earth.sprite=1
earth.width=1
earth.height=1
earth.x=0
earth.y=0
earth.angl=0
earth.speed=0.3

sun={}
sun.sprite=16
sun.width=4
sun.height=4
sun.xi=63
sun.yi=63
sun.x=63
sun.y=63
sun.angl=0
sun.t=0

moon={}
moon.sprite=2
moon.width=1
moon.height=1
moon.x=20
moon.y=53
moon.angl=pi/2
moon.speed=1

stars={}
stars.x={}
stars.y={}
stars.num=100

function _init()
	_init_stars(stars)
end

function _update()
	_shake(stars)
	_bob(sun,10,0.02)
	_orbit(earth,sun,40)
	_orbit(moon,earth,10)
end

function _draw()
	cls()
	_draw_stars(stars)
	_draw_sprite(sun)
	_draw_sprite(moon)
	_draw_sprite(earth)
	_draw_line(earth,sun,8)
	_draw_line(earth,moon,10)
	line(63,63,sun.x,sun.y,0)
	line(63,63,moon.x,moon.y,11)
end

-->8
--sprite & stars
function _draw_sprite(obj)
	spr(obj.sprite,obj.x-obj.width*4,obj.y-obj.height*4,obj.width,obj.height)
end

function _draw_stars(obj)
	for i=0,obj.num,1 do
	 pset(obj.x[i],obj.y[i],7)
	end
end

function _init_stars(obj)
	for i=0,obj.num,1 do
		obj.x[i]=rnd(127)
		obj.y[i]=rnd(127)
	end
end

function _shake(obj)
	for i=0,obj.num,1 do
		obj.x[i]+=1
		if obj.x[i] > 127 then
			obj.x[i] = 1
		end
	end
end
-->8
--orbit

--function _orbit(obj,x,y,rad)
--	r=sqrt(abs((obj.x-x)^2+(obj.y-y)^2))
--	angl=atan2((obj.y-y),(obj.x-x))
--	
--	v=0.1
--	vx=-v*cos(angl)
--	vy=v*sin(angl)
--	obj.x+=vx
--	obj.y+=vy
--end

--obj1 orbits obj2 with radius r
function _orbit(obj1,obj2,r)
	obj1.angl+=obj1.speed*pi/180
	obj1.x=obj2.x+r*1.2*cos(obj1.angl)
	obj1.y=obj2.y+r*0.8*sin(obj1.angl)
end
-->8
--sun bob

function _bob(obj,amp,rate)
	obj.y=obj.yi+amp*1.2*sin(obj.t)
	obj.x=obj.xi+amp*0.8*cos(obj.t)
	obj.t+=rate
end
-->8
--draw line

function _draw_line(a,b,col)
	line(a.x,a.y,b.x,b.y,col)
end
__gfx__
0000000000c771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000003c6c1300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700333cc3310006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700033cc33130055660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000c3cccc330011550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700c333cc130001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c33cc100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000a999a9990aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000a00999a999a99999aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000a9999aaaaaaa99999a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a000aa9999aaaaaaaaaa99aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa099a999aaaaaaa999a99aa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000a99a999aaaaaaaaa999a9a999000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000aa9aa99aaaaaaaaaaaaa99999900a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0099a9aa99aaaaaaaaaaa9aaaa9999a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0099a9aaaaaaaaaaaaaaaa9aaa999aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0999a9aaaaaaaaaaaaaaaaaa9aa99a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
099999aaaa99aaaaaaaaaa9aaaa99990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09aa9aaaa9999aaaaaaaaa9aaaaa9990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaaaaaaa9999aaaaaaaaaaaaaaa9999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaa9aaaa9999aaaaaaaaaaaaaaaa999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999aaaaaa99aaaaaaaaaaaaaaaaa999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
999aaaaaaaaaaaaaa99aaaaaaaaaa999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
999aaaaaaaaaaaaaa99aaaaaaaaaa999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
999aaaaaaaaaaaaaa99aaaaaaaaaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
999aaaaaaaaaaaaaa99aaaaaaaaa99aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a9aaaaaaaaaaaaaa99aaaa9aaaa9999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa9aaa99aaaaaaaaaaaaaaaaaaaaa990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a99aa9999aaaaaaaaaaaaaaaaaa99990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaa9a9999aaaaaaaaaaaaaaaaaa99990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a99a99aaaaaaaaaaaaaaaaaaaa9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a99999aaaaaaaaaaaaa9aaaaaa9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00099aaaaaaaaaaaaaaaa9aaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa9a99aaaaaa999a9aaaa9999a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a009999aaaaaa999a9a9999a900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa0999aaaaa9999a999aa9aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000a0099a999999a99999a990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000a000999999aa999aaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000099aa9999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
