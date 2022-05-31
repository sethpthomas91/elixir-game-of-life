defmodule GolTest do
  use ExUnit.Case
  doctest Gol

  test "tests a dead world is empty" do
    newWorld = [
      {{1, 1}, 0},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    assert Gol.worldEmpty?(newWorld) == true
  end

  test "tests a world with an alive world is not empty" do
    newWorld = [
      {{1, 1}, 0},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 1},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    assert Gol.worldEmpty?(newWorld) == false
  end

  test "tests set alive sets a cell to 1" do
    oldWorld = [
      {{1, 1}, 0},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    aliveCells = [
      {1, 1}
    ]
    expect = [
      {{1, 1}, 1},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    assert Gol.setAliveCells(oldWorld, aliveCells) == expect
  end

  test "tests set alive sets a cells to 1" do
    oldWorld = [
      {{1, 1}, 0},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    aliveCells = [
      {1, 1},
      {2, 2}
    ]
    expect = [
      {{1, 1}, 1},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 1},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    assert Gol.setAliveCells(oldWorld, aliveCells) == expect
  end

  test "tests handles wrong cell inputs" do
    oldWorld = [
      {{1, 1}, 0},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    aliveCells = [
      {1, 1},
      {3, 1},
      {0, 1}
    ]
    expect = [
      {{1, 1}, 1},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 1},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]
    assert Gol.setAliveCells(oldWorld, aliveCells) == expect
  end


end
