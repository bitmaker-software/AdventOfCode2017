defmodule Day2Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day2

  describe "Day2 Part 1 calculate_checksum/2" do
    test "with example input returns 18" do
      input = """
      5 1 9 5
      7 5 3
      2 4 6 8
      """
      assert AdventOfCode2017.Day2.calculate_checksum(input, " ") == 18
    end
  end

  describe "Day2 Part 2 calculate_checksum_division/2" do
    test "with example input returns 9" do
      input = """
      5 9 2 8
      9 4 7 3
      3 8 6 5
      """
      assert AdventOfCode2017.Day2.calculate_checksum_division(input, " ") == 9
    end
  end
end