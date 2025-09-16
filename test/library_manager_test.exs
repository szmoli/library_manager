defmodule LibraryManagerTest do
  use ExUnit.Case
  doctest LibraryManager

  test "greets the world" do
    assert LibraryManager.hello() == :world
  end
end
