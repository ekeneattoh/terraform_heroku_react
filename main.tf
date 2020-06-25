provider "heroku" {
  email   = var.heroku_username
  api_key = var.heroku_api_key
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

module "react_app" {
  source = "./modules/react_app/"

}