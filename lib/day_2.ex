defmodule Day2 do
  @doc ~S"""
  Parses input of a newline separated file into
  a list of strings.

  ## Examples

  iex> Day2.parse_input("abc\ndef")
  ["abc", "def"]
  """
  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
  end

  @doc ~S"""
  Returns a hash of each character's frequency in
  the given string.

  Keys are given as the character's ascii equivalent.

  iex> Day2.get_character_frequency("abbccc")
  %{97 => 1, 98 => 2, 99 => 3}
  """
  def get_character_frequency(string) do
    string
    |> String.to_charlist
    |> Enum.reduce(%{}, fn (x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end) 
  end

  @doc ~S"""
  Returns a checksum based upon character frequency.

  checksum = [num of freq = 2] * [new of freq = 3]

  iex> Day2.get_checksum(["aabc", "abbc", "abccc"])
  2 * 1
  """
  def get_checksum(strings) do
    # Get character frequencies
    {two_count, three_count} = strings
    |> Enum.map(&get_character_frequency/1)
    |> Enum.map(&map_freq_to_tuple/1)
    |> Enum.reduce(fn {two, three}, {twos_sum, threes_sum} -> {twos_sum + two, threes_sum + three} end)

    two_count * three_count
  end

  def map_freq_to_tuple(list) do
    Enum.reduce(list, {0, 0}, fn
      {_, 2}, {_twos, threes} -> {1, threes}
      {_, 3}, {twos, _threes} -> {twos, 1}
      _, acc -> acc
    end)
  end

  def part_a() do
    File.read!("data/day2.txt")
    |> String.split("\n")
    |> get_checksum
  end
end

