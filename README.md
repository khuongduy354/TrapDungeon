# Implementation\
[X] DarkRoom
[X] Sandwich
[] Stranger Things


### Fly
- top crushing down 
- bottom pushing up
- alarm on
- fly through channel
- zig zag dodge 
- but top malfunction and drop (troll)

### boss room 
- enter gungeon boss
- door open portal randomly and go through the other, go throughg X times to exit  

### boss 2 
- same above but 2 of it 
- 2 dmg each other 
- lure until 1 dies 
- 1 spread + 1 shoot and withdraw 

### tetris
 



make a map, s.t it is a tunnel, combines all above 
- gravity switch + static with diff sizes to force player 

### Stranger Thing
- take middle switch to reverse gravity
- random things run either on top or bottom
+ up down spider
+ up but shoot down ( vice versa )
+ casual 
- bottom pushing up (vice versa)
- troll reverse card  (dodge, drop on face) 

# Done

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

The arrow
2 plats 
1 jumpable 2nd fake disappear when jump 

1st arrow shoot straifht pause shoot plat fast then bounce right at player pos. When reach player pos, fly horizontal according to player

2nd arrow shoot pause shoot vr fast, only trigger when on platform, move left, or player attemp to jump over (100% hit) 
Have to run fast to 1st platform (but it move a bit)


# Components  
- Tilemap  
- Player   
- Troll stuffs: dark room (animated), aiming missile (physics), 100% (animated + physics), EtG bullet spread (animated + physics) 
/* - Input layer (as control get changed frequently)    */
- BaseLevel   
- Different level logics


