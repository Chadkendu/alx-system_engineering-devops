# Manifest kills the process

exec {'pkill':
    command => '/usr/bin/pkill killmenow'
}
