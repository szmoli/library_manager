defmodule Services.BookManagementTest do
  use ExUnit.Case
  import Models.Book
  import Models.Library
  import Services.BookManagement

  @library create_library("Test Library")


end
