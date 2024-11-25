# Docker AMP Symfony

The purpose of this template project is to provide a quick and easy way to get 
a Symfony project up and running with Docker. Ths project uses Apache, MySQL and
PHP.

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Composer](https://docs.docker.com/compose/)
- [Make](https://www.gnu.org/software/make/manual/make.html) (optional — [install `make` for Windows](https://stackoverflow.com/questions/2532234/how-to-run-a-makefile-in-windows))

## Usage

The first thing to do is to change a little bit the `compose.yml` file. You can
change the `MYSQL_ROOT_PASSWORD` and `MYSQL_DATABASE` environment variables to
whatever you want. You really should change the `name` of the container to
something more meaningful.

```diff
# compose.yml
- name: project-name
+ name: name-of-your-project
```

Then, you can run the following command if you have `make`.

It will:
- Build the containers
- Start the containers
- Create a new Symfony project in an empty directory
- Move the Symfony project to the root directory
- Remove the temporary project directory
- Warm up the Symfony cache

```bash
make init
```

### Or, step by step

You can run the following command to build the containers:

```bash
make build # or `docker-compose build` if you don't have `make`
```

An image with [PHP](https://www.php.net), [Apache](https://httpd.apache.org), [Composer](https://getcomposer.org) and [Symfony CLI](https://symfony.com/download) ready to use will be built.

After that, you can run the following command to start the containers:

```bash
make up # or `docker-compose up -d` if you don't have `make`
```

Apache should be ready to serve, but you don't have a Symfony project yet. You
can create one by entering the Apache container and running the following command:

```bash
make exec # or `docker-compose exec apache bash` if you don't have `make`
          # it will open a bash session inside the container
```

Then, you can create a new Symfony project in the root directory by running the `init-symfony.sh` script:

```bash
./init-symfony.sh
```

You can now access your Symfony project at `http://localhost:8080`.

Remember that every time you want to run a Symfony command, you should run it
inside the container thanks to the `make exec` command.
