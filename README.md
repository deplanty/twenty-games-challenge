# The 20 Games Challenge
The 20 Games Challenge from https://20_games_challenge.gitlab.io/challenge/

## Game #1: Pong

<b>Goals:</b>

- Create an arena with two walls and a divider.
- Add a paddle on either end of the play field. Use player inputs to move the paddles up and down.
- Add a ball that moves around the playfield and bounces off of the paddles and walls.
- Detect when the ball leaves the playfield. Assign a point to the player who scored.
- Track and display the score for each player.

<b>Stretch goals:</b>

- Write an AI script that can follow the ball so you can play with only one player.
- Hint: Following the ball with a paddle is easy, but it makes the opponent impossible to beat. You might want to make the AI less than perfect somehow.
- Add a menu and allow the player to reset the game.
- Add some basic sounds. Play a sound every time the ball collides with something, and every time a player scores.


## Game #2: Breakout

<b>Goal:</b>

- Create a game space with walls and a ceiling.
- Add a paddle that can be moved left and right via player inputs.
- Add a ball that will bounce off of the paddle, walls, and ceiling.
- Add square game objects (bricks) into the top of the game space. (The original game had eight rows of 16 bricks each, though you can change the number of bricks depending on the size of the game space)
- Enable the ball to bounce off of the bricks. When the ball bounces, the brick should disappear.
    - Breaking a brick should add to the player’s score.
    - The ball’s speed should increase as bricks are broken.
- The score should be displayed, as well as a life counter. The player starts with three lives. If the player misses the ball, a life should be subtracted. When all lives are used, the game ends.

<b>Stretch goal:</b>

- Save the high score between play sessions and display it alongside the player score.
- Add different colors to the bricks in the rows. (The original game was black-and-white, but had a colored film on the screen, simulating colored rows of bricks)
- The paddle should get narrower once the ball reaches the ceiling.

<b>Result:</b>
![image](https://github.com/deplanty/twenty-games-challenge/assets/38189611/5ecf4d74-864c-4794-afa5-318ac6e8a288)


## Game #3: River Raid - WIP

<b>Goal:</b>

- Create and animate a jet fighter. The screen will scroll vertically, and the jet can move side to side. The player can accelerate or brake, which will change the vertical scrolling speed.
- Add a river bank on both sides of the level. The river can vary in size, or even split into two streams. Hitting the river bank will kill the player.
- Divide the game into levels. Between levels, the river will narrow, and there will be a bridge crossing it. Bridges act as checkpoints. The player must shoot the bridge, colliding with it will kill the player.
- Add some enemies! Boats and helicopters will move back and forth across the river. Jets will cross the entire screen. Colliding with an enemy will kill the player.
- Add fuel depots. Flying over these will replenish the player’s fuel reserves. The player can shoot and destroy fuel depots, but colliding with them doesn’t kill the player.
- Add a UI with a life counter, score, and fuel gauge. The fuel gauge will drain slowly, and the player will die if it reaches “empty”.
- Give the player the ability to shoot things! Shooting things increases the player score.

<b>Stretch goal:</b>

- Not sure how to make the game infinitely long? The easy way would be to create multiple hand-crafted levels that start and end with a bridge. The fun way would be to generate the levels dynamically on the fly.
- The Atari 2600 could only display limited sprites. Modern computers are capable of creating massive particle effect explosions. You know what to do.
