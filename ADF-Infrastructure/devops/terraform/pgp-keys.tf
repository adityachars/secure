
provider "pgp" {
  # Configuration options
}

# pgp key

resource "pgp_key" "sebpgp" {
  name    = "Rohan reddy"
  email   = "rohan.reddy@securitas.com"
  comment = "Generated PGP Key"
  
}
resource "pgp_key" "polandpgp" {
  name    = "Rohan reddy"
  email   = "rohan.reddy@securitas.com"
  comment = "Generated PGP Key"
  
}

resource "pgp_key" "dnbpgp" {
  name    = "Rohan reddy"
  email   = "rohan.reddy@securitas.com"
  comment = "Generated PGP Key"
}

resource "pgp_key" "polandprodpgp" {
  name    = "Rohan reddy"
  email   = "rohan.reddy@securitas.com"
  comment = "Generated PGP Key"
}
