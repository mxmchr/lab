git clone -b dev-idx601-series --single-branch https://github.com/miskcoo/ugreen_leds_controller
cd ugreen_leds_controller/cli
make
scp ugreen_leds_cli [truenas_user]@[truenas_ip]:/tmp/ugreen_leds_cli.gt