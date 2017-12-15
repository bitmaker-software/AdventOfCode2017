defmodule AdventOfCode2017.Day1 do
  @moduledoc """
  Documentation for Day 1 problem.
  """

  @doc """
  Find the sum of consecutive numbers.

  ## Examples

      iex> AdventOfCode2017.Day1.solve_captcha(11111)
      5

  """
  def solve_captcha(number) when is_number(number) do
    number
    |> number_to_list()
    |> sum_consecutives()
  end

  def solve_captcha(number) do
    number
    |> Integer.parse() 
    |> elem(0) 
    |> solve_captcha()
  end

  @doc """
  Find the sum of equal numbers halfway in the circular list.

  ## Examples

      iex> AdventOfCode2017.Day1.solve_captcha_halfway(111111)
      6
  
  """
  def solve_captcha_halfway(number) when is_number(number) do
    number
    |> number_to_list()
    |> sum_halfway()
  end

  def solve_captcha_halfway(number) do
    number
    |> Integer.parse() 
    |> elem(0) 
    |> solve_captcha_halfway()
  end

  defp number_to_list(number), do: Integer.digits(number)
  
  defp sum_consecutives(numbers_list) when is_list(numbers_list) do
    numbers_list
    |> Enum.reduce({0, List.last(numbers_list)}, fn (current, {acc, previous}) ->
      cond do
        current == previous -> {acc + current, current}
        true -> {acc, current}
      end
    end)
    |> elem(0)
  end

  defp sum_halfway(numbers_list) when is_list(numbers_list) do
    numbers_list
    |> Enum.reduce({0, 0, get_element_halfway(numbers_list, 0)}, fn (current, {acc, index, halfway}) ->
      value =
        cond do
          current == halfway -> acc + current
          true -> acc
        end
      {value, index + 1, get_element_halfway(numbers_list, index + 1)}
    end)
    |> elem(0)
  end

  defp get_element_halfway(list, index) do
    size = length(list)
    Enum.at(list, rem(div(size, 2) + index, size))
  end
end