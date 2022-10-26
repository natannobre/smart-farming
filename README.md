# Smart Farming

[Rails Guide](https://guides.rubyonrails.org/)

## Project setup

### Instalar o Git

```sh
sudo apt-get install git
```

### Instalar Bibliotecas

```sh
sudo apt-get install -y build-essential libpq-dev nodejs git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
```

### Instalar o Rbenv
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
```

### Instalar o ruby-build
```
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
```

### Instalar uma versão específica do ruby
```
rbenv install 3.0.2
rbenv global 3.0.2
ruby -v
```

### Instalar Docker

- Instalar pacote docker.io:

```sh
sudo apt install docker.io
```

- Inicializa o Docker e configura para inicializar com o sistema:

```sh
sudo systemctl enable --now docker
```

- Teste:

```sh
sudo docker run hello-world
```

### Instalar Docker-Compose

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

```sh
sudo chmod +x /usr/local/bin/docker-compose
```

### Instalar o Yarn

- Primeiramente é necessário adicionar os repositórios:

```sh
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

- Depois disso, basta instalar o yarn:

```sh
sudo apt update
sudo apt install yarn
```

## Configurar SSH para acessar Github

Caso você não tenha configurado, você pode fazer isso seguindo 2 passos:

- [Criar uma chave SSH](https://docs.github.com/pt/enterprise-server@3.0/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

- [Adicionando essa chave na sua conta do Github](https://docs.github.com/pt/enterprise-server@3.0/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

## Baixar e executar localmente o projeto

Você vai baixar e configurar os projetos de acordo com o que você for precisar.

---

### Smart Farming

```sh
git clone git@github.com:natannobre/smart-farming.git
```

### Inicializar o projeto

- Vá para o diretório do projeto:

```sh
cd <your_path_to>/smart-farming
```

- Crie um arquivo __env_variables__ com as variáveis de ambiente:

```sh
cp config/env_variables_example.yml config/env_variables.yml
# Inside this file you need to set the variable API_KEY
```

- Configure os containers:

```sh
docker-compose build
```

- Execute o container:

```sh
docker-compose up
```

- Crie um *Service Group*

OBS: Coloque sua API_KEY no campo "apikey"

```sh
curl --location --request POST 'http://localhost:4041/iot/services' \
--header 'fiware-service: openiot' \
--header 'fiware-servicepath: /' \
--header 'Content-Type: application/json' \
--data-raw '{
 "services": [
   {
     "apikey":      "<YOUR_API_KEY>",
     "cbroker":     "http://orion:1026",
     "entity_type": "Thing",
     "resource":    ""
   }
 ]
}'
```
