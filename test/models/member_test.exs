defmodule Models.MemberTest do
  use ExUnit.Case
  import Models.Member
  alias Models.Member

  @member Member.new(0, "John Doe", "john@doe.com")

  test "can_borrow?/1 and borrow_book/2" do
    book = Models.Book.new(0, "Test Book", "Test Author", 1234, "Test Genre", 1234)
    {:ok, updated_member} = Member.borrow_book(@member, book)
    {:ok, updated_member} = Member.borrow_book(updated_member, book)
    {:ok, updated_member} = Member.borrow_book(updated_member, book)
#    updated_member = %Member{@member | borrowed_books: [book, book, book]}
#    IO.inspect updated_member

    assert Member.can_borrow?(@member)
    assert Member.can_borrow?(updated_member) != true
    {status, _} = Member.borrow_book(updated_member, book)
    assert status === :error
  end

  test "change_membership_type/2" do
    {status, updated_member} = Member.change_membership_type(@member, :paid_membership)
    assert status === :ok
    assert updated_member.membership_type === :paid_membership
    {status, _updated_member} = Member.change_membership_type(@member, :asd)
    assert status === :error
  end
end
