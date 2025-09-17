defmodule Models.Book do
  alias Models.Book

  defstruct [:id, :title, :author, :isbn, :genre, :publication_year, :status]

  def new(id, title, author, isbn, genre, publication_year) do
    %Book{
      id: id,
      title: title,
      author: author,
      isbn: isbn,
      genre: genre,
      publication_year: publication_year,
      status: :available
    }
  end

  def update_status(book, new_status) do
    %Book{book | status: new_status}
  end

  def matches_criteria?(book, criteria) when is_map(criteria) do
    Enum.all?(criteria, fn {key, value} -> Map.get(book, key) == value end)
  end
  def matches_criteria?(book, criteria), do: book == criteria
end
