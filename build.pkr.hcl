build {
  sources = ["source.amazon-ebs.linux"]

  provisioner "shell" {
    environment_vars = [
      "VARIABLE=value"
      ]
    inline = [
      "CMD"
    ]
  }
}
