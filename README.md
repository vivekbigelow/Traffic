# godot_game


I made a simple game using the Godot Engine. The player controls a car and must avoid the obstacles. 

### Controls

left arrow - move the car to the left  
right arrow - move the car to the right  

### The Car 

I modelled the car in Blender and exported to Godot as a .glb. 

The car.gd script utilizes a velocity vector that is used to translate the car when the player hits the arrow keys. The car starts with a life of 10 that decrements everytime it collides with an obstacle. The car script also keeps track of creating new obstacles. I based this code off of the invaders example for creating bullets, however it would probably make more sense if this code was in the script for the sceneRoot. New obstacles are made when  time_left variable reaches 0. The time_left variable is reset and the make_obstacle() function is called n times creating n obstacles. N is a variable with a random value between 0 and 4. The players score increases by 10xn. In this version the score increases when the obstacles are made, but it would make more sense if the score increased once the player successfully passed the obstacles. Since the car's z position is fixed, I could just increase the score when an obstacle passed the z position of the car. Once the player gets hit 10 times the car is freed from the queue. Since the car creates the obstacles, no more obstacles are created when the car is freed. When the life variable is 0 a Game Over tag and replay button appear.   

One interesting problem I faced was registering sideways collisions. Using move_and_collide(velocity) worked for checking head on collisions, which I used to decrement the players life. However, when the car bumps into the side of the cubes, it collides but does not decrement life. When an obstacle collides with the player it is supposed to be freed from the queue, but this does not happen when a side ways collision occurs. I noticed this behavior when I had the obstacles moving much slower. Now that they are moving quickly it's hard to notice the behavior.

### The Obstacles 
 The obstacles are just simple cubes created from the mesh instance in godot. I would like to go back and model different kinds of traffic cones. 

The obstacles are created with a random x value in the range of the road/floor.

As the game progresses the cubes get faster. To implement this I added an init method to the obstace.gd script that took a Vector3 velocity vector. In the car.gd I pass a velocity vector to the instance of the obstacle when it is created. 

### UI 
The UI is very basic. There is a life and score banner that informs the player of all of the dynamic information. Once the player dies the replay button and game over tag appear. I had an issue where the replay button does not always show up and the players life goes negative. It doesn't happen consistently, but it reappears after I think it's fixed so I don't know why it happens. 

### Exports

I exported for windows, mac, and web. The web export does not work. I don't have a windows so I'm not sure the .exe file works, but the .dmg file is functional. 
