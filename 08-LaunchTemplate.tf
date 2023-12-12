resource "aws_launch_template" "app1_LT" {
  name_prefix   = "app1_LT"
  image_id      = "ami-0e01e66dacaf1454d"  
  instance_type = "t3.micro"

  #If you like to use a previously created key-pair from the AWS console you may insert it into the "key_name" field below after removing the hash mark
  #otherwise the key-pair will be automatically created with the Keys.tf module (*Note: This key-pair will be saved in your directory and not in your aws console!) 
  #key_name = "Seoul"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Malgus Clan</h1>
    <h1>Invades Seoul</h1>

    <br>
    <img src="https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExYWNqMmVvYWttdHF5M2RqbWgxN3o3NzdmenBlbTVheGU4ZmZ3ZDFubSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/lZHm3ORB0bUHn6Jt0Z/giphy.gif" alt="Malgus_Seoul" width="1024" height="1024">
    <br>
      
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_LT"
      Service = "application1"
      Owner   = "Malgusclan"
      Planet  = "Dromundkaas"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
