resource "oci_core_vcn" "this" {
  cidr_block     = var.vcn["cidr"]
  compartment_id = var.compartment_id
  display_name   = "vcn-${var.app_name}-${var.env}"
  dns_label      = var.vcn["label"]

  freeform_tags = {
    app         = "${var.app_name}"
    Environment = "${var.env}"
  }
}

resource "oci_core_internet_gateway" "this" {
  compartment_id = var.compartment_id
  display_name   = "ig-${var.app_name}-${var.env}"
  enabled        = var.vcn["internet_gateway_enabled"]
  vcn_id         = oci_core_vcn.this.id

  freeform_tags = {
    app         = "${var.app_name}"
    Environment = "${var.env}"
  }
}

resource "oci_core_nat_gateway" "this" {
  block_traffic  = "false"
  compartment_id = var.compartment_id
  display_name   = "ng-${var.app_name}-${var.env}"
  vcn_id         = oci_core_vcn.this.id

  freeform_tags = {
    app         = "${var.app_name}"
    Environment = "${var.env}"
  }
}

resource "oci_core_route_table" "public" {
  compartment_id = var.compartment_id
  display_name   = "rt-public-${var.app_name}-${var.env}"
  vcn_id         = oci_core_vcn.this.id

  route_rules {
    description       = "traffic to the internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.this.id
  }

  freeform_tags = {
    app         = "${var.app_name}"
    Environment = "${var.env}"
  }
}

resource "oci_core_security_list" "this" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
    stateless   = false
  }

  ingress_security_rules {
    protocol    = "6"
    stateless   = false
    source      = "188.251.216.185/32"
    description = "SSH"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol    = "17"
    stateless   = false
    source      = "0.0.0.0/0"
    description = "wireguard"
    udp_options {
      min = 51820
      max = 51820
    }
  }

  ingress_security_rules {
    protocol    = "6"
    stateless   = false
    source      = "188.251.216.185/32"
    description = "kb8s"
    tcp_options {
      min = 6443
      max = 6443
    }
  }

  ingress_security_rules {
    protocol    = "6"
    stateless   = false
    source      = "188.251.216.185/32"
    description = "rdp"
    tcp_options {
      min = 3389
      max = 3389
    }
  }

  ingress_security_rules {
    protocol    = "6"
    stateless   = false
    source      = "0.0.0.0/0"
    description = "application"
    tcp_options {
      min = 32222
      max = 32222
    }
  }

  display_name = "sl-${var.app_name}-${var.env}"

  freeform_tags = {
    app         = "${var.app_name}"
    Environment = "${var.env}"
  }
}

resource "oci_core_subnet" "this" {

  for_each = var.subnets

  cidr_block                 = each.value["cidr"]
  compartment_id             = var.compartment_id
  display_name               = "${each.key}-${var.app_name}-${var.env}"
  dns_label                  = each.key
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_route_table.public.id
  security_list_ids          = ["${oci_core_security_list.this.id}"]
  vcn_id                     = oci_core_vcn.this.id
  availability_domain        = lookup(var.availability_domain[each.value["adIndex"]], "name")
  dhcp_options_id            = oci_core_vcn.this.default_dhcp_options_id

  freeform_tags = {
    app         = "${var.app_name}"
    Environment = "${var.env}"
  }
}
