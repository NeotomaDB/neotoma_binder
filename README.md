[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![NSF-1948926](https://img.shields.io/badge/NSF-1948926-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1948926)
# Neotoma Binder

Repository Template to create a Binder with the Neotoma2 package.   
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/NeotomaDB/neotoma_binder/main?urlpath=rstudio)

## Contributors

This project is an open project, and contributions are welcome from any individual.  All contributors to this project are bound by a [code of conduct](CODE_OF_CONDUCT.md).  Please review and follow this code of conduct as part of your contribution.

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--7926--4935-brightgreen.svg)](https://orcid.org/0000-0002-7926-4935) [Socorro Dominguez Vidana](https://sedv8808.github.io/)

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--2700--4605-brightgreen.svg)](https://orcid.org/0000-0002-2700-4605) [Simon Goring](http://goring.org)

### Tips for Contributing

Issues and bug reports are always welcome.  Code clean-up, and feature additions can be done either through pull requests to [project forks]() or branches.

All products of the Throughput Annotation Project are licensed under an [MIT License](LICENSE) unless otherwise noted.

## How to use this repository

In order to set up a Neotoma2 Binder, there needs to exist 3 files:
- runtime.txt
- install.R
- apt.txt

The `runtime.txt` file will help us specify the version of the runtime. 
The only line that you need to add in `runtime.txt` is the date of when you are building the Binder in the following format:
```
r-YYYY-MM-DD
```

For example:
```R
r-2022-04-12
```

The `install.R` is used to install R libraries pinned to a snapshot on MRAN (we set the date of the snapshot in the `runtime.txt` file earlier)

An example of the `install.R` file would be as follows:
```R
install.packages("tidyverse")
install.packages("analogue")
install.packages("remotes")
remotes::install_github('NeotomaDB/neotoma2@production')
```

Note that because **neotoma2** is not in CRAN yet, we need to install the `remotes` library and use its `install_github` command. 
You can change the branch where you want to pull your package from after the `@` symbol.

Finally, we need to specify the `apt.txt` file. This file installs a list of Debian packages. The base image used is usually the latest released version of Ubuntu. **NOTE:** The *neotoma2* library `apt.txt` has several geographic dependencies, it is extremely important to specify the following ones using the `apt.txt` file. 

The `apt.txt` file in a *neotoma2* Binder should look like this:

```R
libudunits2-dev
libgdal-dev
libgeos-dev
libproj-dev
libglpk-dev
```
### Deploying to Binder

Once you have your three *configuration files* set up, it is up to you to add the data or the .Rmd files that you will want to work on. 

Then, set up the Binder as you would usually do.  

If you would like to open the Binder using Rstudio, follow these steps:

1. Go to mybinder.org
2. Fill in the information about your repository URL
3. Select which branch you want to use for your Binder
4. Change the option `path to notebook file` to `URL`
5. Write `rstudio` in the URL box
6. Launch your Binder
