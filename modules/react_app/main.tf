resource "heroku_app" "herokuapp" {
  name   = var.heroku_app_name
  region = var.heroku_region

  config_vars = {
    REACT_APP_PRD_BACKEND_URL = var.backend_url
  }

  buildpacks = [
    "heroku/nodejs"
  ]
}
