resource "aws_s3_bucket" "test" {
  force_destroy = true
}

resource "aws_s3_object" "index_page" {
  bucket       = aws_s3_bucket.test.id
  key          = "index.html"
  source       = "files/index.html"
  content_type = "text/html"
  etag         = filemd5("files/index.html")
}

resource "aws_s3_object" "error_page" {
  bucket       = aws_s3_bucket.test.id
  key          = "error.html"
  source       = "files/error.html"
  content_type = "text/html"
  etag         = filemd5("files/error.html")
}
