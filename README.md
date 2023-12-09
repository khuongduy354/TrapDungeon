# Implementation
[X] DarkRoom
[X] Sandwich
[] Stranger Things
[X] Arrow
[X] Fly 
[X] Water
[X] Missile
[X] Bouncer

[X] Tetris
[] Boss 



### Chasing Boss 
- platforms: moving, jump to drop, jump to up
- boss shoot platform down 
- large boss sprite 
- dodge platform
- reverse potion 
- slide down
- sections: normal run section, continous drop section, rich section but shoot, top down reverse section, 




 


### Stranger Thing
- gravity switch + static with diff sizes to force player 
- take middle switch to reverse gravity
- random things run either on top or bottom
+ up down spider
+ up but shoot down ( vice versa )
+ casual 
- bottom pushing up (vice versa)
- troll reverse card  (dodge, drop on face) 

# Done
### Fly
- slider (top, bottom) 
// - space to push up fly 
- alarm on
- fly through channel
- zig zag dodge static trap 
- but top malfunction and drop (troll)
### tetris

### Water 
- space to change direction, up down 
- mobs placements to make pathway 
- mobs in path attack 
- mobs from bottom, top 

### Bouncer 
- Ball bounce
- bounce twice when target player  
- 4 buttons
- player lure so that 3 buttons are pressed.
- last button dodge troll
 
### Dark Room 
- Mobs run left right 
- Jump through hole to get to top level

Basic -> 1 Connected Holes -> 2 troll move right -> 3 troll right fake, left real, when get on top right real

### Sandwich
Top and bottom sweep
2 mobs at side shoot, so that it destroy platforms 
Platforms middle 
Top stuck when reach certain 
Bottom kill mobs then leave 2 holes for jumping
Mobs block entrance -> win

# Ideas 

- Pokemon Unbound left right dark room   H
// below - aiming missile: shoot at player -> stop shoot on platform -> missed? return to player bottom then when straight up   H 
// - prev level high plat -> new level low plat, wall approaching, only way jump to prev level (while wall falling),
but doing so leave empty space H    

- Enter gungeon underwater bullet king spread (let it not spread to dodge first then spread)    VH  
- Returning missle: like aiming, shooting -> missed -> do other hard dodging things -> missile return unexpectedly  VH
// - wall fall same as above, but present a new enemy after switching level, shoot in the face, 
only way is to trigger enemy first then run toward a (hidden) hole (hole fall after X secs).  
then enemy shoot hole which explodes (run out of bullet) Vh  
- Gungeon up down smashing, but drop midway (randomize)

- Same as Gungeon above but use SPACE and has mana I
- OCD tetris, lure until reach the top I, chance to explode tetris and drop right on face 


- randomize for nearly impossible 
- nearly done -> alarm on  
- see a way out? -> NO 





 

  Sandwich 
Top and bottom sweep
2 mobs at side shoot 
Platform middle
Wasd 
Mob shoot = sweep plat 
Top stuck when reach certain 
Bottom kill mobs
Mobs block entrace

Missile
Wall sweep, when pass collapse 
Hole up as fake
Real hole bottom show when close enough 
Go to prev run trigger shooter
Beware Missile! 
Trick: trigger missle asap while wall til far
Lie down the hole b4 sweep
Wall collapse right on hole
Missile shoot hole
Then throw gun as last attemp



# Components  
- Tilemap  
- Player   
- Troll stuffs: dark room (animated), aiming missile (physics), 100% (animated + physics), EtG bullet spread (animated + physics) 
/* - Input layer (as control get changed frequently)    */
- BaseLevel   
- Different level logics


