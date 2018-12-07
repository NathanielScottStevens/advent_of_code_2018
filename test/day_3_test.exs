defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "parse_input" do
    assert %{id: 1311, x: 420, y: 598, width: 20, height: 26} == Day3.parse_input("#1311 @ 420,598: 20x26")
  end

  test "reduce_to_overlapping" do
    input = [%{id: 1, x: 1, y: 3, width: 4, height: 4},
             %{id: 2, x: 3, y: 1, width: 4, height: 4},
             %{id: 3, x: 5, y: 5, width: 2, height: 2}]
    assert MapSet.new([{3, 3}, {3, 4}, {4, 3}, {4, 4}]) == Day3.reduce_to_overlapping(input)
  end

  test "get_all_coords" do
    expected = MapSet.new([
      {3, 5}, {4, 5},
      {3, 4}, {4, 4},
      {3, 3}, {4, 3}])

    assert expected == Day3.get_all_coords(%{id: 1, x: 3, y: 3, width: 2, height: 3})
  end
end
