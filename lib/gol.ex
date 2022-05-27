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

  def setAliveCells(_oldWorld, [], accum) do
    accum
  end

  def setAliveCells(oldWorld, aliveCells, accum) do
    [head | tail] = aliveCells

    Enum.each(oldWorld, fn cell ->
        grid = elem(cell, 0)
        if (grid != head) do
          [{grid, 0} | accum]
        else
          [{grid, 1} | accum]
        end
      end)

    setAliveCells(oldWorld, tail, accum)
  end

  def setAliveCells(oldWorld, aliveCells) do
    setAliveCells(oldWorld, aliveCells, [])
  end


end
