defmodule Models.Member do
  alias Models.Member

  @borrow_limits %{
    default_membership: 3,
    paid_membership: 5
  }

  @membership_types [:default_membership, :paid_membership]

  defstruct [:id, :name, :email, :join_date, :membership_type, :borrowed_books]

  def new(id, name, email) do
    %Member{
      id: id,
      name: name,
      email: email,
      join_date: DateTime.utc_now(),
      membership_type: :default_membership,
      borrowed_books: []
    }
  end

  def can_borrow?(member) do
    book_count = Kernel.length(member.borrowed_books)
    book_count < Map.get(@borrow_limits, member.membership_type)
  end

  def change_membership_type(member, new_membership_type) do
    case new_membership_type in @membership_types do
      true -> {:ok, %Member{member | membership_type: new_membership_type}}
      false -> {:error, :invalid_membership_type}
    end
  end
end
