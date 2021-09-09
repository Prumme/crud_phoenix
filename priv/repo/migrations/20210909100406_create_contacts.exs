defmodule Aurel.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :uuid, :string
      add :firstname, :string
      add :email, :string
      add :pro, :boolean, default: false, null: false
      add :pers, :boolean, default: false, null: false

      timestamps()
    end

  end
end
