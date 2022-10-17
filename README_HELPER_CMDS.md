## Mosquitto MQTT Broker (Server)
[Official Doc](https://mosquitto.org/documentation/)

[How-To Guide for Mosquitto MQTT Broker](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-the-mosquitto-mqtt-messaging-broker-on-ubuntu-16-04)
```sh
apt-get install mosquitto mosquitto-clients # install mosquitto

mosquitto_sub -h localhost -t "test" # initialize topic "test" on port 1883

mosquitto_pub -h localhost -t "test" -m "Hello World" # publish message
```

## SenSE
Documentation to [SenSE](https://github.com/ivanzy/SenSE-Sensor-Simulation-Environment/blob/master/README.md)
```sh
# Download and prepare SenSE
git clone git@github.com:ivanzy/SenSE-Sensor-Simulation-Environment.git # clone SenSE
cd SenSE-Sensor-Simulation-Environment
cp SenSE.war /opt/tomcat/apache-tomcat-8.5.83/webapps

cd /opt/tomcat/apache-tomcat-8.5.8
./bin/startup.sh # start tomcat
./bin/shutdown.sh # stop tomcat
```
The SenSE web interface is available at http://localhost:8080/SenSE

## Fiware
Documentation to [Fiware](https://github.com/FIWARE/tutorials.Getting-Started)
```sh
cd /home/natannobre/faculdade/tcc2/tutorials.IoT-over-MQTT
./services start legacy


# Subscribe to a topic
docker run -it --rm --name mqtt-subscriber \
  --network fiware_default efrecon/mqtt-client sub -h mosquitto -t "/#"

# Publish to a topic
docker run -it --rm --name mqtt-publisher \
  --network fiware_default efrecon/mqtt-client pub -h mosquitto -m "HELLO WORLD" -t "/test"

docker run -it --rm --name mqtt-publisher --network \
  fiware_default efrecon/mqtt-client pub -h mosquitto -m "c|1" \
  -t "/ul/4jggokgpepnvsb2uv4s40d59ov/motion001/attrs"

- OBS: topic = /<protocol>/<api-key>/<device-id>/attrs
```
The FIWARE web interface is available at http://localhost:3000/device/monitor
OBS: There is an Network IP confict when `subnet: 172.18.1.0/24` change to `subnet:172.19.1.0/24`

## Possible Commands Needed
```sh
sudo netstat -tulpn | grep LISTEN # checks all ports in use
for name in  $(docker network ls --format '{{.Name}}' ) ; do echo $name ; docker inspect $name --format '{{ .IPAM.Config }}' ; done # checks all docker networks
```

# Initializing application
```sh
cd <your_path_to>/smart-farming
$ docker-compose up

# Request from Rails console to Orion Context Broker after create a subgroup and a device.

# This request is to text comunication between the app and the broker
HTTParty.get('http://orion:1026/v2/entities/urn:ngsd-ld:Motion:001?type=Motion', headers: { 'fiware-service' => 'openiot', 'fiware-servicepath' => '/' })
```
