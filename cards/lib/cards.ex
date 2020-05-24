defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of string representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle a given `deck`.

  ## Examples
      iex> deck = Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
      "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds",
      "Five of Diamonds"]

      iex> Cards.shuffle(deck)
      ["Two of Diamonds", "Three of Clubs", "Four of Hearts",
      "Three of Diamonds", "Four of Clubs", "Two of Spades", "Five of Hearts",
      "Ace of Spades", "Two of Hearts", "Four of Diamonds", "Five of Clubs",
      "Three of Hearts", "Two of Clubs", "Four of Spades", "Ace of Diamonds",
      "Five of Spades", "Three of Spades", "Ace of Clubs", "Five of Diamonds",
      "Ace of Hearts"]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Return `true` if the `deck` has the `card`, return `false` otherwise. 
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save deck to filesystem. `deck` argument is the returned deck 
    from `Cards.create_deck` and `filename` is the name to save file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Load deck from filesystem. `filename` is the name of file.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "Tha file does not exist"
    end
  end

  @doc """
    Create a deck, shuffle and deal. `hand_size` is the number of cards.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
