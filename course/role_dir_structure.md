## Here is the full directory tree
```
$ tree ansible-elasticsearch-master
ansible-elasticsearch-master
├── CHANGELOG.md
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── Makefile
├── README.md
├── ansible.cfg
├── defaults
│   └── main.yml
├── docs
│   ├── multi-instance.md
│   └── ssl-tls-setup.md
├── files
│   └── systemd
│       └── elasticsearch_override.conf
├── filter_plugins
│   └── custom.py
├── handlers
│   └── main.yml
├── helpers
│   └── bumper.py
├── meta
│   └── main.yml
├── tasks
│   ├── compatibility-variables.yml
│   ├── elasticsearch-Debian.yml
│   ├── elasticsearch-RedHat-version-lock.yml
│   ├── elasticsearch-RedHat.yml
│   ├── elasticsearch-config.yml
│   ├── elasticsearch-optional-user.yml
│   ├── elasticsearch-parameters.yml
│   ├── elasticsearch-plugins.yml
│   ├── elasticsearch-ssl.yml
│   ├── elasticsearch-template.yml
│   ├── elasticsearch.yml
│   ├── java.yml
│   ├── main.yml
│   ├── snapshot-release.yml
│   └── xpack
│       ├── elasticsearch-xpack.yml
│       └── security
│           ├── elasticsearch-security-file.yml
│           ├── elasticsearch-security-native.yml
│           ├── elasticsearch-security.yml
│           ├── elasticsearch-xpack-activation.yml
│           └── elasticsearch-xpack-trial-activation.yml
├── templates
│   ├── elasticsearch.j2
│   ├── elasticsearch.repo
│   ├── elasticsearch.yml.j2
│   ├── jvm.options.j2
│   ├── override.conf.j2
│   └── security
│       ├── role_mapping.yml.j2
│       ├── roles.yml.j2
│       └── users_roles.j2
├── test
│   ├── integration
│   │   ├── debug.yml
│   │   ├── files
│   │   │   ├── certs
│   │   │   │   ├── keystore-password-ca.p12
│   │   │   │   ├── keystore-password.p12
│   │   │   │   ├── shared-store-no-password-ca.p12
│   │   │   │   ├── shared-store-no-password.p12
│   │   │   │   ├── truststore-password-ca.p12
│   │   │   │   └── truststore-password.p12
│   │   │   ├── custom_config
│   │   │   │   ├── elasticsearch
│   │   │   │   ├── jvm.options
│   │   │   │   └── log4j2.properties
│   │   │   ├── templates-6.x
│   │   │   │   └── basic.json
│   │   │   └── templates-7.x
│   │   │       └── basic.json
│   │   ├── helpers
│   │   │   └── serverspec
│   │   │       ├── Gemfile
│   │   │       ├── issue_test_spec.rb
│   │   │       ├── oss_spec.rb
│   │   │       ├── oss_to_xpack_upgrade_spec.rb
│   │   │       ├── oss_upgrade_spec.rb
│   │   │       ├── shared_spec.rb
│   │   │       ├── spec_helper.rb
│   │   │       └── xpack_upgrade_spec.rb
│   │   ├── issue-test
│   │   │   ├── issue-test.yml
│   │   │   └── serverspec
│   │   │       └── default_spec.rb
│   │   ├── issue-test.yml
│   │   ├── oss
│   │   │   ├── oss.yml
│   │   │   └── serverspec
│   │   │       └── default_spec.rb
│   │   ├── oss-to-xpack-upgrade
│   │   │   ├── oss-to-xpack-upgrade.yml
│   │   │   └── serverspec
│   │   │       └── default_spec.rb
│   │   ├── oss-to-xpack-upgrade.yml
│   │   ├── oss-upgrade
│   │   │   ├── oss-upgrade.yml
│   │   │   └── serverspec
│   │   │       └── default_spec.rb
│   │   ├── oss-upgrade.yml
│   │   ├── oss.yml
│   │   ├── xpack
│   │   │   ├── serverspec
│   │   │   │   └── default_spec.rb
│   │   │   └── xpack.yml
│   │   ├── xpack-upgrade
│   │   │   ├── serverspec
│   │   │   │   └── default_spec.rb
│   │   │   └── xpack-upgrade.yml
│   │   ├── xpack-upgrade-trial -> xpack-upgrade
│   │   ├── xpack-upgrade-trial.yml
│   │   ├── xpack-upgrade.yml
│   │   └── xpack.yml
│   └── matrix.yml
└── vars
    ├── Debian.yml
    ├── RedHat.yml
    └── main.yml

36 directories, 86 files
```
You can also view on [github](https://github.com/elastic/elasticsearch)
