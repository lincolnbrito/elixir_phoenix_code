defmodule ElixirCardsTest do
  use ExUnit.Case
  doctest ElixirCards

  test "greets the world" do
    assert ElixirCards.hello() == :world
  end
end
