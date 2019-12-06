# docker-phpmyadmin-example

This is a project that shows an example project using php, but also running a phpmyadmin instance on top of it. My only purpose with it was to test the functionalities of docker and use multiple containers without using docker compose.

## Containers

This projects uses three different containers, one for the database (`mariadb`), one for your php project (`webapp`) and one for your phpmyadmin instance (`admin`).

### Running mariadb

To run `mariadb` run the following command: `docker run --name mariadb -e MYSQL_ROOT_PASSWORD=complexpassword -d mariadb`.
Bear in mind, that this the attribue `name` (in this case `mariadb`) is important, but also the password (`MYSQL_ROOT_PASSWORD=complexpassword`). The database credentials from the webapp should be as follows:

- host: `mariadb`
- user: `root` (We're connecting to the database using root, which is not a good practice, but good enough for now)
- password: `complexpassword` (This is an example password, if you want to modify it, you can do so by modifying the variable `MYSQL_ROOT_PASSWORD` in the above command)

### Running PHPMYADMIN

To run `admin` (PHPMYADMIN) run the following command: `docker run -d --rm --link mariadb:mysql -p 8081:80 nazarpc/phpmyadmin`

### Running webapp

In order to be able to run it, let's build it first: `docker build --tag webapp .`. **Note**: This step needs to be done everytime (But before you do, stop the container with `docker stop webapp`) you make a change in your code outside the container. If you want to avoid this, you can use volumes when you run the container.

To run your webapp written in PHP, run the following command: `docker run --rm --link mariadb:mysql -p 8080:80 webapp`
