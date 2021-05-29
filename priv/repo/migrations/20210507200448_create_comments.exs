defmodule Zaryn.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:body, :text)
      add(:post_id, references(:posts, type: :uuid, on_delete: :delete_all))
      add(:user_id, references(:users, type: :uuid, on_delete: :delete_all))

      timestamps()
    end

    create index(:comments, [:post_id])
    create index(:comments, [:user_id])
  end
end
