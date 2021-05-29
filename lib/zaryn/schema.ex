defmodule Zaryn.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      # changing the id type to binary
      @primary_key {:id, Ecto.UUID, autogenerate: true}
      @foreign_key_type Ecto.UUID
      @derive {Phoenix.Param, key: :id}
    end
  end
end
