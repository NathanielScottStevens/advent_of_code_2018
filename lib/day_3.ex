defmodule Day3 do
  def part_a() do
    File.read!("data/day3.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_input/1)
    |> reduce_to_overlapping
    |> Enum.count
  end

  def parse_input(string) do
    # Sample Input: #1311 @ 420,598: 20x26
    Regex.named_captures(~r/#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/, string)
    |> Enum.map(fn {k, v} -> {String.to_atom(k), elem(Integer.parse(v), 0)} end)
    |> Enum.into(%{})
  end

  def get_all_coords(bounds) do
    for x <- get_range(bounds.x, bounds.width), y <- get_range(bounds.y, bounds.height) do
      {x, y}
    end
    |> MapSet.new()
  end

  def get_range(start, length) do
    terminate = start + length - 1
    start..terminate
  end

  def reduce_to_overlapping(bounds) do
    {all_used_coords, overlapping_coords} =
      bounds
      |> Enum.reduce({MapSet.new(), MapSet.new()},
          fn x, {used_acc, duplicate_acc} ->
            current_coords = get_all_coords(x)
            current_duplicates = MapSet.intersection(current_coords, used_acc)

            {MapSet.union(used_acc, current_coords), MapSet.union(duplicate_acc, current_duplicates)}
          end)

    overlapping_coords
  end
end
