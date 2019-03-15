## <img src="https://cdn.jsdelivr.net/gh/chrishough/my-public-data/my-configurations/database.svg" height="20"> Databases

Type `cmd + space` to launch `iterm2` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.

1. Type `brew tap homebrew/services` to install brew services. Thoughtbot has a great [guide](https://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew) on this tool.
2. Run `brew install postgres` to install [PostgreSQL](https://www.postgresql.org/).
3. Start PostgreSQL via `brew services start postgres` and create your base db via the following command:
```
createdb `whoami`
```
4. If everything worked correctly you can verify this by attaching to Postgres by typing `psql`. Please note this installation of Postgres via Homebrew was adapted from [install-postgresql-on-mac-os-x-via-brew](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/) and this [stackoverflow post](http://stackoverflow.com/questions/17822974/postgres-fatal-database-files-are-incompatible-with-server). Unfortunately my local copy of Postgres was borked so I rebuilt it at one point by going "nuclear" and removing everything.
```
rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8
```
5. Run `brew install redis` to install [Redis](http://redis.io/).
6. Start Redis via `brew services start redis`
7. Start Redis via `brew services start postgresql`
8. Verify we are running the latest versions of our core database technlogies.
```
psql --version
psql -c "SELECT version();"
pg_dump --version
```
9. If everything has been setup correctly, here is an example output of those commands.
```
psql (PostgreSQL) 11.2
 
PostgreSQL 11.2 ...

pg_dump (PostgreSQL) 11.2
```
