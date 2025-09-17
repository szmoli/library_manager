defmodule Models.MemberTest do
  use ExUnit.Case
  import Models.Member
  alias Models.Member
  import Models.Book

  @member Member.new(0, "John Doe", "john@doe.com")

  test "can_borrow?/1" do
    book = Models.Book.new(0, "Test Book", "Test Author", 1234, "Test Genre", 1234)
    updated_member = %Member{@member | borrowed_books: [book, book, book]}
#    IO.inspect updated_member

    assert Member.can_borrow?(@member)
    assert Member.can_borrow?(updated_member) != true
  end

  test "change_membership_type/2" do
    {status, updated_member} = Member.change_membership_type(@member, :paid_membership)
    assert status === :ok
    assert updated_member.membership_type === :paid_membership
    {status, updated_member} = Member.change_membership_type(@member, :asd)
    assert status === :error
  end
end
