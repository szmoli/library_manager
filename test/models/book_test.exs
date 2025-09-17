defmodule Models.BookTest do
  use ExUnit.Case
  import Models.Book
  alias Models.Book

  @book Book.new(0, "Test Book", "Test Author", 123, "Test Genre", 1234)

  test "update_status/2" do
    updated = Book.update_status(@book, :borrowed)
    assert updated.status === :borrowed
  end

  test "matches_criteria?/2" do
    assert Book.matches_criteria?(@book, %{title: "Test Book"}) == true
    assert Book.matches_criteria?(@book, %{title: "The Test Book"}) == false
  end
end
