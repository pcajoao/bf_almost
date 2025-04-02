# pre requisitos

necessario ter o docker for windows instalado na maquina caso esteja executando a aplicação via WSL
https://medium.com/@habbema/guia-de-instala%C3%A7%C3%A3o-do-docker-no-wsl-2-com-ubuntu-22-04-9ceabe4d79e8

necessário para o acesso as funcionalidades do projeto, é necessário ter instalado em sua máquina o Docker Compose, segue o [tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-pt) para a instalação e configuração em sua máquina.


## Usando o Docker Compose

Após a instalação, agora é a vez de rodar alguns comandos para a criação do seu ambiente de desenvolvimento, mas antes é necessário a criação do arquivo `/.env` no diretório do seu projeto, coloque nesse arquivo as variáveis de ambiente necessárias para o acesso ao banco de desenvolvimento.

```

DATABASE_NAME=bf_almost_development
DATABASE_USER=bfalmost
DATABASE_PASSWORD=bfalmost
DATABASE_HOST=database

Feito isso, está na hora de subir seu ambiente de desenvolvimento, para isso rode o seguinte comando dentro do seu projeto:

```
docker-compose up
```

Após a inicialização do ambiente é necessário criar o banco e um workspace inicial, para isso é necessário rodar os seguintes comandos:

```
docker-compose exec app rake db:create
docker-compose exec app rake db:migrate
docker-compose exec app rake db:seed
```

Após a inicialização do ambiente, agora é possível rodar alguns comandos do RAILS em sua máquina, para isso é necessário especificar alguns comandos, por exemplo para rodar o console do rails:


```
docker-compose exec app rails c
```

Para fechar o seu ambiente de desenvolvimento, rode o seguinte comando:

```
docker-compose down
```

Para fechar o seu ambiente removendo todas as imagens criadas, rodde o seguinte comando:

```
docker-compose down --rmi all --volumes
```
