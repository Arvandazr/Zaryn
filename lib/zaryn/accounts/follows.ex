defmodule Zaryn.Accounts.Follows do
  use Zaryn.Schema

  alias Zaryn.Accounts.User

  schema "accounts_follows" do
    belongs_to :follower, User
    belongs_to :followed, User

    timestamps()
  end
end
