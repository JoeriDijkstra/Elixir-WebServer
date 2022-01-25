defmodule Routing.Router do
  use Plug.Router;

  plug :match
  plug :dispatch

  get "/" do
    load_html(conn, "lib/public_html/index.html")
  end

  get "/hello" do
    load_html(conn, "lib/public_html/hello.html")
  end

  match _ do
    load_html(conn, "lib/public_html/404.html")
  end

  def load_html(conn, html) do
    conn
    |> put_resp_content_type("text/html")
    |> send_file(200, html)
  end
end
