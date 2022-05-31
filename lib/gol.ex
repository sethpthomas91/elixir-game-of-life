defmodule Gol do

  def createNewWorld(size) do
    for col <- 1..size, row <- 1..size, into: [], do: {{col, row}, 0}
  end

  def worldEmpty?(world) do
    not Enum.any?(world, fn cell -> cellAlive?(cell) end)
  end

  def cellAlive?(cell) do
    elem(cell, 1) == 1
  end

  def setAliveCells(oldWorld, []) do
    oldWorld
  end

  def setAliveCells(oldWorld, aliveCells) do
    [head | remainingCells ] = aliveCells

    newWorld = Enum.map(oldWorld, fn cell ->
        grid = elem(cell, 0)
        if (grid == head) do
          {grid, 1}
        else
          cell
        end
      end)
    setAliveCells(newWorld, remainingCells)
  end


end
