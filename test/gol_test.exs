defmodule GolTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
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

  test "test world that has no living cells stays dead after one tick" do
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

    expectedWorld = [
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

    assert Gol.tick(oldWorld) == expectedWorld
  end

  test "test one alive cell in dead world dies after one tick" do
    oldWorld = [
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

    expectedWorld = [
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

    assert Gol.tick(oldWorld) == expectedWorld
  end

  test "test one alive cell with two alive neighbors lives after one tick" do
    oldWorld = [
      {{1, 1}, 1},
      {{1, 2}, 1},
      {{1, 3}, 0},
      {{2, 1}, 1},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]

    expectedWorld = [
      {{1, 1}, 1},
      {{1, 2}, 1},
      {{1, 3}, 0},
      {{2, 1}, 1},
      {{2, 2}, 1},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]

    assert Gol.tick(oldWorld) == expectedWorld
  end

  test "test one dead cell with three alive neighbors lives after one tick" do
    oldWorld = [
      {{1, 1}, 1},
      {{1, 2}, 0},
      {{1, 3}, 1},
      {{2, 1}, 0},
      {{2, 2}, 0},
      {{2, 3}, 0},
      {{3, 1}, 1},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]

    expectedWorld = [
      {{1, 1}, 0},
      {{1, 2}, 0},
      {{1, 3}, 0},
      {{2, 1}, 0},
      {{2, 2}, 1},
      {{2, 3}, 0},
      {{3, 1}, 0},
      {{3, 2}, 0},
      {{3, 3}, 0}
    ]

    assert Gol.tick(oldWorld) == expectedWorld
  end

  test "test one dead cell with two alive neighbors stays dead after one tick" do
    oldWorld = [
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

    expectedWorld = [
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

    assert Gol.tick(oldWorld) == expectedWorld
  end

  test "test that a dead world is printed to the terminal" do
    world = [
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

    clearScreen = "\e[H\e[J\n"
    row1 = "000\n"
    row2 = "000\n"
    row3 = "000\n"
    display = clearScreen <> row1 <> row2 <> row3
    assert capture_io(fn -> Gol.display(world) end) == display
  end
end
