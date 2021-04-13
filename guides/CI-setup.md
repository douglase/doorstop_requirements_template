
## Guide to continuous integration setup

### Intro

Continuous integration tools such as Travis CI, allow real-time compilation of the final output PDF without local installation of dependencies.

[.travis.yml](../.travis.yml) and [requirements.txt](requirements.txt)  defines the system for compilation and lists dependencies and calls [deploy.sh](../deploy.sh), which  installs the preferred version of the doorstop library and runs  _doorstop_sync.sh_ which updates the datebase and generates LaTeX and Markdown outputs them to a new branch called gh-pages, which you can configure to publish publically or not in your repository settings.

### setup for Travis CI on new copy of the template

- create Travis CI account by configuring app: https://github.com/apps/travis-ci
- link your requirements repository to account
- add [github personal access token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token), named `github_token` to repo setup on travis CI as shown in screenshot below


![image](https://user-images.githubusercontent.com/1025951/113973312-f5664e80-97f0-11eb-8e14-45d2498cafb6.png)

For [security](https://blog.travis-ci.com/2017-05-08-security-advisory), I created a new "machine" user , made it a collaborator on the repo, and used the machine user's token on Travis instead of my primary user's token. this isn't required.
