variable "heroku_username" {
    type = string
    default = "nchetaeu@gmail.com"
    //default var, if none is supplied at run time
}

variable "heroku_api_key" {
    type = string
}

variable "heroku_app_name" {
    type = string
}

variable "heroku_region" {
    type = string
    default = "europe"
}

variable "backend_url" {
    type = string
}

variable "source_code_path" {
    type = string
}
