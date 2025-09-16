defmodule Models.Library do
  alias Models.Library

  defstruct [
    :name,
    :books,
    :members,
    :borrows
  ]

  def create_library(name), do: %Library{name: name, books: [], members: [], borrows: []}
end
