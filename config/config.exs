import Config

config :doma_recaptcha,
  verify_url: "https://www.google.com/recaptcha/api/siteverify",
  timeout: 5000,
  public_key: {:system, "RECAPTCHA_PUBLIC_KEY"},
  secret: {:system, "RECAPTCHA_PRIVATE_KEY"}

config :doma_recaptcha, :json_library, Jason

import_config "#{Mix.env()}.exs"

secret_cfg = "#{Mix.env()}.secret.exs"

IO.inspect("Searching for #{inspect secret_cfg}")
if File.exists?("./config/" <> secret_cfg) do
  IO.inspect("Found secret config! Wink")
  import_config secret_cfg
end
