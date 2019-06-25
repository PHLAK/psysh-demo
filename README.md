PsySh Demo
==========

[PsySh](https://psysh.org/) the runtime developer console, interactive debugger
and REPL for PHP, a demo by [Chris Kankiewicz](https://www.chriskankiewicz.com).

## Requirements

  - [Docker](https://docs.docker.com)
    with [Docker Compose](https://docs.docker.com/compose/)
  - [Make](https://www.gnu.org/software/make/)

## Running the Demo

  1. Clone the repository and change directories
     ```bash
     git clone --recursive git@github.com:PHLAK/psysh-demo.git
     cd psysh-demo
     ```

  2. Build the Docker containers and run the `demo` container
     ```bash
     docker-compose run --rm demo; docker-compose down
     ```

     or
     
     ```bash
     make demo
     ```

  3. Install PHP dependencies
     ```bash
     composer install --ignore-platform-reqs
     ```
