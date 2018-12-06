defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "compare_strings" do
    assert [1, 3] == Day2.compare_strings({"abcd", "azcz"})
  end

  test "get_all_possible_pairs" do
    expected = [{1, 2}, {1, 3}, {2, 2}, {2, 3}, {3, 2}, {3, 3}]
    assert expected == Day2.get_all_possible_pairs([1, 2, 3])
  end

end
