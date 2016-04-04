listor-rails
====

> ROR app to manage your recruiting pipeline.

### Getting started

```
$ clone repo && cd listor-rails
$ bundle install
```

Create a **config/secrets.yml**

```
development:
  secret_token: 8ff532f2a7cd70372d910d4222aa57c7959faf683420aae287e1b364fceb829d827253e90af602316032368affa85d1310e081abe23abca0cb6852ed0357bdb1
  secret_key_base: SOMEKEY
```

```
$ rake db:migrate
$ rails s
```

### Docker
[Install Docker](https://docs.docker.com/engine/installation/)

#### Start Docker
```
$ cd ~/listor-rails
$ mv config/database.docker.yml config/database.yml
$ docker build . 
$ docker-compose run web rake db:create db:setup
$ docker-compose up
```

#### Stop Docker
```
$ docker-compose down
$ docker rmi -f $(docker images -q)
```

### Technologies used

- Ruby On Rails
- Devise for Authentication
- Docker
