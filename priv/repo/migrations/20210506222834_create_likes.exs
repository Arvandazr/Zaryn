defmodule Zaryn.Repo.Migrations.CreatePostLikes do
  use Ecto.Migration

  def change do
    create table(:likes, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:liked_id, :integer)
      add(:user_id, references(:users, type: :uuid, on_delete: :delete_all))

      timestamps()
    end

    create index(:likes, [:user_id, :liked_id])
  end
end
