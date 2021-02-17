# EI-SE5_2020-2021_CrazyBaby

Notre projet consiste à réaliser un système de soins pour bébé en cas d’absence de ses parents. 
Selon les différents serveurs utilisés, l'ensemble de notre projet est divisé en deux parties. La version 1 est basée sur le serveur fourni par Home Assistant, qui nous offre la possibilité de développer des projets IoT plus rapidement et plus facilement. La version 2 est basée sur notre serveur self-made, qui nous permet de mettre en pratique ce que nous avons appris pendant le cours IOT. Pour une introduction détaillée, veuillez consulter le cahier des charges et les documents listés.

### Les documents listés incluent:
- Cahier des charges_crazybaby.pdf         *Cahier des charges de notre projet*
- version1 home_assistant.pdf              *Le registre qui atteste les travails réalisés dans la version home assistant* 
- version2 serveur_python.pdf              *Le registre de la deuxième version qui utilisent le serveur en Python* 


### Les codes utilisés dans le projet en utilisant homeAssistance:
À ce stade, nous n'avons téléchargé que le code de la version un, et lui et la version deux doivent être améliorés.

| Nom du code   | Uploader vers  | Fonction réalisée | Protocole  |      |
| ---------- | :-----------:  | :-----------: | :-----------: | :-----------: |
| homeassistant_video|  ESP32 CAM| Initialisation du module vidéo: ESP32 CAM Pour Home assistant | http|Accès via adresse IP |
| homeassistant_sensor|ESP32_berceau| Dans le sens montant vers home assistant: DHT11, accéléromètre, détecteur sonore; Dans le sens descendant: activer LED depuis une interface web| mqtt |Broker: homeassistant|
| parent_receive    | ESP32_parent|Réception du signal buzzer du côté parent | mqtt    |Broker:hivemq|



### Les codes utilisés dans le projet en utilisant notre propre serveur:

| Nom du code   | Uploader vers  | Fonction réalisée | Protocole  |      |
| ---------- | :-----------:  | :-----------: | :-----------: | :-----------: |
| video.ino|  ESP32 CAM| Initialisation du module vidéo: ESP32 CAM Pour Home assistant | http|Accès via adresse IP |
| version3.ino|ESP32_berceau| Dans le sens montant vers home assistant: DHT11, capteur de pression de l'aire, accéléromètre, détecteur sonore; Dans le sens descendant: activer LED depuis une interface web| mqtt |Broker: mosquitto en raspberry|
| esp32Recv.ino    | ESP32_parent|Réception du signal buzzer du côté parent | mqtt    |Broker: mosquitto en raspberry|
| serveur.py    | Raspberry |Sreveur en raspberry | http et mqtt    |Broker: mosquitto en raspberry|
| crazyBaby.sql    | Raspberry  |database | nan    |Broker: nan|
