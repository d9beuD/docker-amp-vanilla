# Docker AMP Vanilla

The purpose of this template project is to provide a quick and easy way to get 
a vanilla PHP project up and running with Docker. Ths project uses Apache, MySQL
and PHP.

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

```bash
make init
```

### Or, step by step

You can run the following command to build the containers:

```bash
make build # or `docker-compose build` if you don't have `make`
```

An image with [PHP](https://www.php.net), [Apache](https://httpd.apache.org), [MariaDB](https://mariadb.org) and [Composer](https://getcomposer.org) ready to use will be built.

After that, you can run the following command to start the containers:

```bash
make up # or `docker-compose up -d` if you don't have `make`
```

Apache should be ready to serve your files. You can enter the Apache container by running the following command:

```bash
make exec # or `docker-compose exec apache bash` if you don't have `make`
          # it will open a bash session inside the container
```

You can now access your project at `http://localhost:8080`.

Remember that every time you want to run a Composer command, you should run it
inside the container thanks to the `make exec` command.
