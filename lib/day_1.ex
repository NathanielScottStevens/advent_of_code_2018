defmodule Day1 do
  @doc ~S"""
  Parses input of a newline separated file into
  a list of positive or negative integers.

  ## Examples

  iex> Day1.parse_input("+15\n-5\n+20\n")
  [15, -5, 20]
  """
  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn {x, _} -> x end)
  end

  @doc ~S"""
  Sums list of integers.
  ## Examples

  iex> Day1.sum([5, -5, 10])
  10 
  """
  def sum(values) do
    values
    |> Enum.reduce(&Kernel.+/2)
  end

  @doc """ 
  Find first repeating frequency.

  ## Examples

  iex> Day1.first_repeated_freq([1, -1])
  0

  iex> Day1.first_repeated_freq([3, 3, 4, -2, -4])
  10

  iex> Day1.first_repeated_freq([-6, 3, 8, 5, -6])
  5

  iex> Day1.first_repeated_freq([7, 7, -2, -7, -4])
  14
  """
  def first_repeated_freq(values) do
    values
    |> Stream.cycle
    |> Enum.reduce_while([0], &repeated_freq_reducer/2)
  end

  def repeated_freq_reducer(x, frequencies) do
    new_freq = List.last(frequencies) + x

    if Enum.any?(frequencies, fn x -> x == new_freq end) do
      {:halt, new_freq}
    else
      {:cont, frequencies ++ [new_freq]}
    end
  end

end
