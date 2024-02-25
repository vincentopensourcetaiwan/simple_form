defmodule SimpleFormWeb.HomeLive do
  use SimpleFormWeb, :live_view
  alias SimpleForm.Contents
  alias SimpleForm.Contents.Tag

  def render(assigns) do
    ~H"""
    <h1>Welcome to SimpleForm!</h1>
    <.simple_form for={@form}>
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
end
