defmodule Aurel.DBTest do
  use Aurel.DataCase

  alias Aurel.DB

  describe "contacts" do
    alias Aurel.DB.Contact

    @valid_attrs %{email: "some email", firstname: "some firstname", pers: true, pro: true, uuid: "some uuid"}
    @update_attrs %{email: "some updated email", firstname: "some updated firstname", pers: false, pro: false, uuid: "some updated uuid"}
    @invalid_attrs %{email: nil, firstname: nil, pers: nil, pro: nil, uuid: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DB.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert DB.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert DB.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = DB.create_contact(@valid_attrs)
      assert contact.email == "some email"
      assert contact.firstname == "some firstname"
      assert contact.pers == true
      assert contact.pro == true
      assert contact.uuid == "some uuid"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DB.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = DB.update_contact(contact, @update_attrs)
      assert contact.email == "some updated email"
      assert contact.firstname == "some updated firstname"
      assert contact.pers == false
      assert contact.pro == false
      assert contact.uuid == "some updated uuid"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = DB.update_contact(contact, @invalid_attrs)
      assert contact == DB.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = DB.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> DB.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = DB.change_contact(contact)
    end
  end
end
