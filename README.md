# Hydra Tests Github Action

Github action for smart contracts automated testing with Hydra.

## What does this action do?

This action will compile your contracts and execute `hydra test` on your project's root directory.

_Run the following commands to initialize your repo, this github action expects the generated structure._

```
mkdir myproject && cd myproject
eosio init -project myproject
mv myproject contracts
hydra init
```

The contracts are automatically compiled using `cmake v3.10`, `eosio.cdt v1.7.0` on `ubuntu v18.04`

## Usage

Define a workflow in `.github/workflows/my-workflow.yml` (or add a job if you already have defined workflows).

:bulb: Read more about [Configuring a workflow](https://help.github.com/en/articles/configuring-a-workflow).

```yaml
on:
  pull_request:
  push:
    branches:
      - master
    tags:
      - "**"

name: "Smart Contracts Tests"

jobs:
  test:
    name: test

    runs-on: ubuntu-latest

    steps:
      - name: "Checkout"
        uses: actions/checkout@master

      - name: "Run hydra test"
        uses: docker://blockmatic/eosio-hydra-action:latest
        env:
          HYDRA_AUTH: ${{ secrets.HYDRA_AUTH }}
```

Running the interactive `hydra login` command is not an option on most CI servers. Instead, we recommend running hydra login locally and passing the resulting JSON authentication payload as a secure environment variable to the CI server.

The JSON authentication payload can be found in the `~/.hydra/auth.json` file after login. It can then be passed as the `HYDRA_AUTH` environment variable to the CI server. The authentication info automatically renews expired authentication tokens as it includes a refresh token, therefore this setup only needs to be done once.

:bulb: Read more about [Creating and storing encrypted secrets](https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets).

### Docker image

As Docker images are automatically built and pushed on a merge to `master` or when a new tag is created in this repository, the recommended way to use this GitHub action is to reference the pre-built Docker image directly, as seen above.

:bulb: The Docker image can also be executed directly by running

```
$ docker run --interactive --rm --tty --workdir=/app --volume ${PWD}:/app -e HYDRA_AUTH=$(cat ~/.hydra/auth.json) blockmatic/eosio-hydra-action:latest
```

For more information, see the [Docker Docs: Docker run reference](https://docs.docker.com/engine/reference/run/).

Instead of using the latest pre-built Docker image, you can also specify a Docker image tag (which corresponds to the tags [released on GitHub](https://github.com/blockmatic/eosio-hydra-action/releases)):

```diff
name: Hydra Tests

on:
  pull_request:
  push:
    branches:
      - master
    tags:
      - "**"

jobs:
  test:
    name: test

    runs-on: ubuntu-latest

    steps:
      - name: "Checkout"
        uses: actions/checkout@master

      - name: "Run hydra test"
-        uses: docker://blockmatic/eosio-hydra-action:latest
+        uses: docker://blockmatic/eosio-hydra-action:1.2.3
         env:
           HYDRA_AUTH: ${{ secrets.HYDRA_AUTH }}
```

## Contributing

Read the [contributing guidelines](https://developers.blockmatic.io/open-source/contributing-guidelines) for details.

## Blockmatic

Blockmatic is building a robust ecosystem of people and tools for the development of blockchain applications.

[blockmatic.io](https://blockmatic.io)

<!-- Please don't remove this: Grab your social icons from https://github.com/carlsednaoui/gitsocial -->

<!-- display the social media buttons in your README -->

[![Blockmatic Twitter][1.1]][1]
[![Blockmatic Facebook][2.1]][2]
[![Blockmatic Github][3.1]][3]

<!-- links to social media icons -->
<!-- no need to change these -->

<!-- icons with padding -->

[1.1]: http://i.imgur.com/tXSoThF.png "twitter icon with padding"
[2.1]: http://i.imgur.com/P3YfQoD.png "facebook icon with padding"
[3.1]: http://i.imgur.com/0o48UoR.png "github icon with padding"

<!-- icons without padding -->

[1.2]: http://i.imgur.com/wWzX9uB.png "twitter icon without padding"
[2.2]: http://i.imgur.com/fep1WsG.png "facebook icon without padding"
[3.2]: http://i.imgur.com/9I6NRUm.png "github icon without padding"

<!-- links to your social media accounts -->
<!-- update these accordingly -->

[1]: http://www.twitter.com/blockmatic_io
[2]: http://fb.me/blockmatic.io
[3]: http://www.github.com/blockmatic

<!-- Please don't remove this: Grab your social icons from https://github.com/carlsednaoui/gitsocial -->
