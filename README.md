# R + Devcontainer = :sparkling_heart:

...  but not by default, and there are some hickups.

## Fast creation of dev containers

Development containers are awesome! They enable teams to work on a project, without the headaches of different package versions, formatter settings, ... you name it.

In `R`, there are some things we need to tune in order to arrive at usable devcontainers -- mainly to minimize setup times coming from `R`'s package building defaults.

This repo showcases how to adjust all needed settings to work quickly.

## Known issues

there are some issues when working with `pak` and `renv`: https://github.com/r-lib/pak/issues/325, https://github.com/rstudio/renv/issues/1628. Until this is resolved, it's necessary to manually execute `renv::restore()` upon starting the devcontainer (instead of this being done in the background upon creation of the container).

## How to
### ... Setup
I enjoy working with [DevPod](https://devpod.sh/). There is a CLI-tool which can be installed according to the [description](https://devpod.sh/docs/getting-started/install).
Once installed, create a ssh provider for example like so:
```bash
devpod provider add ssh --name <NAME> -o HOST=<USER>@HOST -o PORT=22 -o USE_BUILTIN_SSH=true -o INJECT_DOCKER_CREDENTIALS=true -o INJECT_GIT_CREDENTIALS=true
```
and start the devcontainer like so (for VScode):

```bash
devpod up git@github.com:juliopterix/r-devcontainer.git --ide vscode
```

or for positron:
```bash
devpod up git@github.com:juliopterix/r-devcontainer.git --ide positron
```

Then, start a shell with `R` (or `radian` if you like) and execute
```R
renv::restore()
```

and
```R
source("example_usage.R")
```

### ... work in the container

I suggest you work with `renv::install()` instead of `install.packages()` 

## Background

Some information for the future-savvy:

Using such a devcontainer (with a UNIX-distro as basis) allows us to install **prebuilt** `R`-packages. 
This speeds up the setup times immensly: The [Arrow R Package](https://arrow.apache.org/docs/r/) needs about **20 minutes** to install with the default installation configuration.

With `renv`, `pak` and especially by setting the CRAN-repo option to `options(repos = c(CRAN = "https://p3m.dev/cran/__linux__/noble/latest"))`, we arrive at a couple of minutes' installtion time for all packages in the lockfile (with arrow, and the tidyverse!). This is pure joy.

