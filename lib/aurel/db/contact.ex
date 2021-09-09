defmodule Aurel.DB.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :email, :string
    field :firstname, :string
    field :pers, :boolean, default: false
    field :pro, :boolean, default: false
    field :uuid, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:uuid, :firstname, :email, :pro, :pers])
    |> validate_required([:uuid, :firstname, :email, :pro, :pers])
  end
end
