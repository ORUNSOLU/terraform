project_id  = var.project_id
server_name = "foreach"

network = "my-network"

subnets = {
    moncks = {"region": "us-east1", "ip_cidr_range":"192.168.2.0/24"},
    virgina = {"region":"us-east4", "ip_cidr_range":"192.168.1.0/24"},
    ohio ={"region":"us-east5", "ip_cidr_range":"192.168.3.0/14"}
}

firewall = [
    {
        "name": "allow-all-internal",
        "direction": "INGRESS",
        "allow": {
            "protocol": "all",
            "ports": []
        },
        "source_ranges": ["192.168.0.0/16"],
        "target_tags": [],
    },
    {
        "name": "allow-http",
        "direction": "INGRESS",
        "allow": {
            "protocol": "tcp",
            "ports": ["80"]
        },
        "source_ranges": ["0.0.0.0/0"],
        target_tags: ["http-server"]
    }
]