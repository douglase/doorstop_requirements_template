
## Guide to continuous integration setup

### Intro

Continuous integration tools such as Travis CI, allow real-time compilation of the final output PDF without local installation of dependencies.

[.travis.yml](../.travis.yml) defines the system for compilation and lists dependencies and calls [deploy.sh](../deploy.sh), which  installs the preferred version of the doorstop library and runs  _doorstop_sync.sh which updates the datebase and generates LaTeX and Markdown outputs.

### setup for Travis CI on new branch

- create Travis CI account
- link repository to account
- add github token to repo setup on travis CI:

![image](https://user-images.githubusercontent.com/1025951/113973312-f5664e80-97f0-11eb-8e14-45d2498cafb6.png)

For [security](https://blog.travis-ci.com/2017-05-08-security-advisory), I created a new "machine" user , made it a collaborator on the repo, and used the machine user's token on Travis instead of my primary user's token.
