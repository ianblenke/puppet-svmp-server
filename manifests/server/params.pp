# == Class: svmp::server::params
#
# === Copyright
#
# Copyright (c) 2012-2014, The MITRE Corporation, All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class svmp::server::params {
    $user          = 'svmp_server'
    $group         = 'svmp_server'
    $home_dir      = '/var/lib/svmp_server'
    $conf_dir      = '/etc/svmp-server'
    $conf_file     = 'config-local.yaml'
    $conf_template = 'svmp/server/config-local.yaml.erb'
    $service_name  = 'svmp-server'

    case $::osfamily {
        'Debian': {
            $init_template = 'svmp/svmp-init-debian.erb'
        }
        'RedHat': {
            $init_template = 'svmp/svmp-init-rh.erb'
        }
        default: {
            fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
        }
    }

    $port   = 8080

    # SSL options
    $enable_ssl         = false

    # User authentication options
    $cert_user_auth       = false
    $behind_reverse_proxy = false

    $log_dir       = '/var/log/svmp-server'
    $log_file      = 'svmp-server.log'
    $log_level     = 'info'
    $log_filter    = [ 'SENSOREVENT', 'TOUCHEVENT' ]

    $version  = 'svmp-2.0.0'
    $npm_name = 'git+https://github.com/SVMP/svmp-server'

}
