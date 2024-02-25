defmodule SimpleFormWeb.HomeLive do
  use SimpleFormWeb, :live_view
  alias SimpleForm.Contents
  alias SimpleForm.Contents.Tag

  def render(assigns) do
    ~H"""
    <h1>Welcome to SimpleForm!</h1>
    <.simple_form for={@form} phx-submit="submit">
      <.input field={@form[:name]} type="text" label="Name" />
      <.button>save</.button>
    </.simple_form>
    """
  end

  def mount(_params, _session, socket) do
    change_set = Contents.change_tag(%Tag{})
    form = to_form(change_set)
    socket = assign(socket, form: form)
    {:ok, socket}
  end

  def handle_event("submit", %{"tag" => tag_params}, socket) do
    case Contents.create_tag(tag_params) do
      {:ok, tag} ->
        change_set = Contents.change_tag(%Tag{})
        form = to_form(change_set)
        socket = assign(socket, form: form)
        {:noreply, socket}

      {:error, changeset} ->
        form = to_form(changeset)
        socket = assign(socket, form: form)
        {:noreply, socket}
    end
  end
end
