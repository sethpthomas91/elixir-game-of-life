import Gol

defmodule Runner do
  def setup(size, aliveCells) do
    blankBoard = createNewWorld(size)
    setAliveCells(blankBoard, aliveCells)
    |> runGame()
  end

  def runGame(board) do
    if (!worldEmpty?(board)) do
      newBoard = tick(board)
      display(board)
      :timer.sleep(500)
      runGame(newBoard)
    else
      IO.puts("GAME OVER")
    end
  end

  def randomBoard(size) do
    Enum.map(1..size, fn _num ->
      {Enum.random(0..size),Enum.random(0..size)}
    end)
  end

  def runRandomGame(size) do
    setup(size, randomBoard(size))
  end

end
