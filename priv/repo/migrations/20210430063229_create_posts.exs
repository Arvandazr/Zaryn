defmodule Zaryn.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:url_id, :string)
      add(:description, :text)
      add(:photo_url, :string)
      add(:total_likes, :integer, default: 0)
      add(:total_comments, :integer, default: 0)
      add(:user_id, references(:users, type: :uuid, on_delete: :delete_all))

      timestamps()
    end

    create index(:posts, [:user_id])
    create unique_index(:posts, [:url_id])
  end
end
