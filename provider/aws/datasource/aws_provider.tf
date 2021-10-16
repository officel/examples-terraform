provider "aws" {
  default_tags {
    tags = {
      Project = "X"
      Service = "www"
      Env     = "dev"
    }
  }
}

