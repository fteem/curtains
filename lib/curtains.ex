defmodule Curtains do
  use Plug.Builder
  import Plug.Conn

  plug Plug.Static, at: "/public", from: :curtains

  def init(_opts) do
  end

  def call(conn, _opts) do
    file = Application.get_env(:curtains, :curtain_file)
    case File.read(file) do
      {:ok, binary } ->
        conn
        |> put_resp_content_type("text/html")
        |> send_resp(200, binary)
        |> halt
      {:error, reason } ->
        IO.inspect reason
        conn
    end
  end
end


