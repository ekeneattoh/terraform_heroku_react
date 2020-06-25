provider "heroku" {
  email   = var.heroku_username
  api_key = var.heroku_api_key
}

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

resource "heroku_build" "herokuapp" {
  app = heroku_app.herokuapp.id

  source = {
    # A local directory, changing its contents will
    # force a new build during `terraform apply`

    path = var.source_code_path
  }
}

resource "heroku_formation" "herokuapp" {
  app        = heroku_app.herokuapp.id
  type       = "web"
  quantity   = 1
  size       = "Standard-1x"
  depends_on = [heroku_build.herokuapp]
}