# ps-ghostferry
[Ghostferry](https://github.com/Shopify/ghostferry) is a library that enables you to selectively copy data from one mysql instance to another with minimal amount of downtime.

It is inspired by Github's [gh-ost](https://github.com/github/gh-ost),
although instead of copying data from and to the same database, Ghostferry
copies data from one database to another and have the ability to only
partially copy data.

There is an example application called ghostferry-copydb included (under the
`copydb` directory) that demonstrates this library by copying an entire
database from one machine to another.


Overview of How it Works
------------------------

An overview of Ghostferry's high-level design is expressed in the TLA+
specification, under the `tlaplus` directory. It maybe good to consult with
that as it has a concise definition. However, the specification might not be
entirely correct as proofs remain elusive.

On a high-level, Ghostferry is broken into several components, enabling it to
copy data. This is documented at
https://shopify.github.io/ghostferry/master/technicaloverview.html

For a detailed tutorial, see the [documentation](https://shopify.github.io/ghostferry).

Development Setup
-----------------

Install:

- Have Docker installed
- Clone the repo
- `docker-compose up -d mysql-1 mysql-2`


Test copydb locally:
- `mysql --protocol=tcp -u root -P 29291 < sql/n1create.sql` to create databases on the source server
- `mysql --protocol=tcp -u root -P 29291 < sql/n1users.sql` to create ghostferry user on source server
- `mysql --protocol=tcp -u root -P 29292 < sql/n2users.sql` to create ghostferry user on destination server
- `docker run --name ghostferry -p 8000:8000 -v $(pwd)/log:/log -v $(pwd)/config:/config pasientskyhosting/ps-ghostferry ghostferry-copydb -verbose -dryrun config/examplerun.json` to perform a dry run
- `docker run --name ghostferry -p 8000:8000 -d -v $(pwd)/log:/log -v $(pwd)/config:/config pasientskyhosting/ps-ghostferry ghostferry-copydb -verbose config/examplerun.json` to start the run
- You can access the web UI on port 8000
- Log and state dump can be found in the `log` directory
- For a more detailed tutorial, see the
  [documentation](https://shopify.github.io/ghostferry).
