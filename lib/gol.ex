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

  def getCellValueAt(grid, world) do
    matchedCell = Enum.find(world, fn cell ->
      newCellGrid = elem(cell, 0)
      grid == newCellGrid
    end)

    if matchedCell == nil, do: 0, else: elem(matchedCell, 1)
  end

  def getNeighborGridList(grid) do
    x = elem(grid, 0)
    y = elem(grid, 1)
    [
      {x-1, y-1},
      {x , y-1},
      {x+1, y-1},
      {x-1, y},
      {x+1, y},
      {x-1, y+1},
      {x, y+1},
      {x+1,y+1}
    ]
  end

  def getSumOfAliveNeighbors(neighborList, world) do
    neighborValList = Enum.map(neighborList, fn grid ->
      getCellValueAt(grid, world)
    end)

    Enum.reduce(neighborValList, fn value, sum -> value + sum end )
  end

  def tick(oldWorld) do
    tick(oldWorld, [])
  end

  def tick(oldWorld, newWorld) do

    newWorld = Enum.map(oldWorld, fn cell ->
      neighbors = getNeighborGridList(elem(cell, 0))
      aliveNeighbors = getSumOfAliveNeighbors(neighbors, oldWorld)
      oldCellGrid = elem(cell, 0)
      oldCellValue = elem(cell, 1)
      if (oldCellValue == 1) do
        handleAliveCell(oldCellGrid, aliveNeighbors)
      else
        handleDeadCell(oldCellGrid, aliveNeighbors)
      end
    end)
    newWorld
  end

  def handleAliveCell(grid, numAliveNeighbors) do
    if (numAliveNeighbors == 2 || numAliveNeighbors == 3) do
      {grid, 1}
    else
      {grid, 0}
    end
  end

  def handleDeadCell(grid, numAliveNeighbors) do
    if (numAliveNeighbors == 3) do
      {grid, 1}
    else
      {grid, 0}
    end
  end

end
