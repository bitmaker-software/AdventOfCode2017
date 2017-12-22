defmodule AdventOfCode2017.Day2 do
  @moduledoc """
  Documentation for Day 2 problem.
  """

  @doc """
  Parse and calculate the checksum of a given `spreadsheet` with a certain
  `separator`.

  ## Example

      iex> AdventOfCode2017.Day2.calculate_checksum("1 2 3", " ")
      2

  """
  def calculate_checksum(spreadsheet, separator) do
    spreadsheet 
    |> get_lines() 
    |> get_lines_differences(separator)
    |> Enum.sum()
  end

  @doc """
  Parse and calculate the checksum of a given `spreadsheet` with a certain
  `separator` of the only two divisible numbers.

  ## Example

      iex> AdventOfCode2017.Day2.calculate_checksum_division("3 4 2", " ")
      2

  """
  def calculate_checksum_division(spreadsheet, separator) do
    spreadsheet
    |> get_lines()
    |> Enum.map(fn x ->
      row = parse_row(x, separator)
      get_division(row, 0)
    end)
    |> Enum.sum()
  end

  defp get_division(row, index) do
    {value, rest} = List.pop_at(row, index)
    case evaluate_integer_division(value, rest, 0) do
      nil -> get_division(row, index + 1)
      value -> value
    end
  end

  defp evaluate_integer_division(value, list, index) do
    cond do
      length(list) <= index -> nil
      rem(value, Enum.at(list, index)) == 0 -> div(value, Enum.at(list, index))
      true -> evaluate_integer_division(value, list, index + 1)
    end
  end

  defp get_lines(spreadsheet) do
    String.split(spreadsheet, "\n", trim: true) 
  end

  defp get_lines_differences(lines, separator) do
    Enum.map(lines, fn line -> 
      line
      |> parse_row(separator)
      |> max_min_difference()
    end)
  end

  defp parse_row(row, separator) do
    row
    |> String.split(separator) 
    |> Enum.map(fn number ->
      Integer.parse(number) |> elem(0)
    end)
  end

  defp max_min_difference(numbers) do
    {min, max} = Enum.min_max(numbers)
    max - min
  end
  
end