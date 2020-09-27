# AMI Builder

This repo contains the base to create an Aws AMI builder with packer.

## Inputs

| Name                | Description                                         | Type                                                                                                                                                          | Default                                                                                                                                                | Required |
| ------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | :------: |
| ami\_name           | Your aws AMI name                                   | `string`                                                                                                                                                      | n/a                                                                                                                                                    |   yes    |
| os\_version         | Your aws AMI version                                | `string`                                                                                                                                                      | n/a                                                                                                                                                    |   yes    |
| subnet\_id          | The subnet Id to use to build your aws AMI          | `string`                                                                                                                                                      | n/a                                                                                                                                                    |   yes    |
| vpc\_id             | The vpc Id to use to build your aws AMI             | `string`                                                                                                                                                      | n/a                                                                                                                                                    |   yes    |
| communicator        | The configuration for the ssh communicator          | <pre>object({<br>    communicator = string<br>    port         = number<br>    username     = string<br>  })</pre>                                            | <pre>{<br>  "communicator": "ssh",<br>  "port": 22,<br>  "username": "ec2-user"<br>}</pre>                                                             |    no    |
| instance\_type      | The instance type to use to build your aws AMI      | `string`                                                                                                                                                      | `"t3.micro"`                                                                                                                                           |    no    |
| profile             | Your aws profile (Must have the EC2 access right)   | `string`                                                                                                                                                      | `"default"`                                                                                                                                            |    no    |
| region              | The aws region where you want to build your aws AMI | `string`                                                                                                                                                      | `"eu-west-1"`                                                                                                                                          |    no    |
| source\_ami\_filter | The filter parameters to find the source aws AMI    | <pre>object({<br>    virtualization = string<br>    regex          = string<br>    device         = string<br>    owners         = list(string)<br>  })</pre> | <pre>{<br>  "device": "ebs",<br>  "owners": [<br>    "amazon"<br>  ],<br>  "regex": "amzn2-ami-hvm-2.0.*-gp2",<br>  "virtualization": "hvm"<br>}</pre> |    no    |
| tags                | Your aws AMI tags                                   | `map(string)`                                                                                                                                                 | `{}`                                                                                                                                                   |    no    |

## Files

### Source

This file contains the packer builder ready to setup the build.
All the information must be provided into a `.pkvars.hcl` to define each required variable value.

### Variable

This file contains every variable defintion with the type and default value.

### Build

This file contains the different provider you want to use to setup your AMI.

### Pkvars

This file contains every value you want to set to your build and to configure your aws AMI.
You can create a `.auto.pkvars.hcl` if you want packer read it automatically.

## More information

You can find more information about Hashicorp Packer [here](https://www.packer.io/docs).
