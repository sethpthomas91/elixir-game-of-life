# Conway's Game Of Life

## Requirements
Must have elixir installed. Follow instructions at https://elixir-lang.org/install.html .

## Installation

1. Clone repo by running 
```
git clone git@github.com:sethpthomas91/elixir-game-of-life.git
```

## Running

1. Navigate to cloned directory

2.  Compile the project and generate the build file.
```
mix compile
```

3. Enter the mix environment
```
iex -S mix
```

4. Run the following command to play your first game. Feel free to copy and paste some of the examples provided below to see more shapes!
Runner.setup(boardSize, aliveCellArray)
boardSize must be an integer.
aliveCellArray must follow the format below:
[{x,y},{x,y}...]

```
Runner.setup(3, [{1,2}, {2,2}, {3,2}])
```

You can also run a random game:
```
Runner.runRandomGame(40)
```
You can change the size by changing the integer in the brackets.

Fun things to try!
The blinker: 
```
Runner.setup(3, [{1,2}, {2,2}, {3,2}])
```
The toad: 
```
Runner.setup(4, [{2,2}, {3,2}, {4,2}, {1,3}, {2,3}, {3,3}])
```
The beacon: 
```
Runner.setup(4, [{1,1}, {2,1}, {1,2}, {4,4}, {4, 3}, {3,4}])
```


5. Exiting the program
There are two ways that you will exit this program. The first will be if there are no more living cells. The second means that you have a ever living board. In this case hit ctr + c twice to exit the mix environment.

