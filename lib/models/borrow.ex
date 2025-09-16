defmodule Models.Borrow do
  defstruct [:id, :book_id, :member_id, :borrow_date, :due_date, :return_date, :status]
end
