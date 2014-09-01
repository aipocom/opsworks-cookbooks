name        "mysql"
description "Installs and configures MySQL"
maintainer  "Aimluck,Inc."
license     "Apache 2.0"
version     "1.0.0"

recipe "kousoku-mysql::client", "Installs MySQL"
recipe "kousoku-mysql::server", "Installs MySQL"
