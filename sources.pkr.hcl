source "amazon-ebs" "linux" {
    communicator = var.communicator["communicator"]
    ssh_port = var.communicator["port"]
    ssh_username = var.communicator["username"]

    profile = var.profile
    region = var.region

    instance_type = var.instance_type
    vpc_id = var.vpc_id
    subnet_id = var.subnet_id

    ami_name = "${var.ami_name}-{{isotime \"2006-01-02\"}}"

    source_ami_filter {
        filters = {
            virtualization-type = var.source_ami_filter["virtualization"]
            name = var.source_ami_filter["regex"]
            root-device-type = var.source_ami_filter["device"]
        }
        owners = var.source_ami_filter["owners"]
        most_recent = true
    }

    run_tags = merge({
            "Name" = "packer-build-${var.ami_name}-{{isotime \"2006-01-02-15-04-05\"}}"
        },
        var.tags
    )

    tags = merge({
            Name = "${var.ami_name}-{{isotime \"2006-01-02\"}}"
            OS_Version = var.os_version
            Release = var.release
            Base_AMI_Name = "{{ .SourceAMIName}}"
        },
        var.tags
    )
}