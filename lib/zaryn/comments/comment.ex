defmodule Zaryn.Comments.Comment do
  use Zaryn.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :total_likes, :integer, default: 0
    belongs_to :post, Zaryn.Posts.Post
    belongs_to :user, Zaryn.Accounts.User
    has_many :likes, Zaryn.Likes.Like, foreign_key: :liked_id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
