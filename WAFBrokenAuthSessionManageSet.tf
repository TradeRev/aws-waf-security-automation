resource "aws_waf_byte_match_set" "URI-set-1" {
  name = "URL-set-1"

  byte_match_tuples {
    "field_to_match" {
      type = "URI"
    }
    positional_constraint = "CONTAINS"
    text_transformation = "URL_DECODE"
    target_string = "/#!/login"
  }
}

resource "aws_waf_byte_match_set" "URI-set-2" {
  name = "URI-set-2"

  byte_match_tuples {
    "field_to_match" {
      type = "URI"
    }
    positional_constraint = "CONTAINS"
    text_transformation = "HTML_ENTITY_DECODE"
    target_string = "/#!/login"
  }
}

resource "aws_waf_byte_match_set" "Header-set-1" {
  name = "Header-set-1"

  byte_match_tuples {
    "field_to_match" {
      type = "HEADER"
      data = "cookie"
    }
    positional_constraint = "CONTAINS"
    text_transformation = "URL_DECODE"
    target_string = "Session ID"
  }
}

resource "aws_waf_byte_match_set" "Header-set-2" {
  name = "Header-set-2"

  byte_match_tuples {
    "field_to_match" {
      type = "HEADER"
      data = "authorization"
    }
    positional_constraint = "CONTAINS"
    text_transformation = "HTML_ENTITY_DECODE"
    target_string = "JWT token"
  }
}

resource "aws_waf_byte_match_set" "Header-set-3" {
  name = "Header-set-3"

  byte_match_tuples {
    "field_to_match" {
      type = "HEADER"
      data = "cookie"
    }
    positional_constraint = "CONTAINS"
    text_transformation = "HTML_ENTITY_DECODE"
    target_string = "Session ID"
  }
}

resource "aws_waf_byte_match_set" "Header-set-4" {
  name = "Header-set-4"

  byte_match_tuples {
    "field_to_match" {
      type = "HEADER"
      data = "authorization"
    }
    positional_constraint = "CONTAINS"
    text_transformation = "URL_DECODE"
    target_string = "JWT token"
  }
}