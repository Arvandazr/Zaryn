defmodule Zaryn.Likes.Like do
  use Zaryn.Schema

  schema "likes" do
    field :liked_id, :integer
    belongs_to :user, Zaryn.Accounts.User

    timestamps()
  end
end
