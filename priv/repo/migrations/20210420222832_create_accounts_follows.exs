defmodule Zaryn.Repo.Migrations.CreateAccountsFollows do
  use Ecto.Migration

  def change do
    create table(:accounts_follows, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:follower_id, references(:users, type: :uuid, on_delete: :delete_all))
      add(:followed_id, references(:users, type: :uuid, on_delete: :delete_all))

      timestamps()
    end

    create index(:accounts_follows, [:follower_id])
    create index(:accounts_follows, [:followed_id])
  end
end
