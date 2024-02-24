defmodule SimpleForm.Repo do
  use Ecto.Repo,
    otp_app: :simple_form,
    adapter: Ecto.Adapters.Postgres
end
