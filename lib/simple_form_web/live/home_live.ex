defmodule SimpleFormWeb.HomeLive do
  use SimpleFormWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to SimpleForm!</h1>
    """
  end
end
