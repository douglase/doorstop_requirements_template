
## Guide to continuous integration setup

### Intro

Continuous integration tools such as GitHub Actions allow real-time compilation of the final output PDF and automatic deployment to GitHub Pages, without local installation of dependencies.

[`.github/workflows/ci.yml`](../.github/workflows/ci.yml) and [`requirements.txt`](../requirements.txt) define the CI environment. The workflow installs system packages (texlive, pandoc, graphviz) and Python dependencies, then calls [`deploy.sh`](../deploy.sh), which runs `doorstop_sync.sh` to update the database and generate LaTeX and Markdown outputs. On pushes to `main`, the workflow deploys the `dist/` directory to the `gh-pages` branch using [peaceiris/actions-gh-pages](https://github.com/peaceiris/actions-gh-pages).

### Setup for GitHub Actions on a new copy of the template

1. Fork or copy this repository to your GitHub account.
2. Go to **Settings → Actions → General** and ensure "Read and write permissions" is enabled for `GITHUB_TOKEN` (needed for the GitHub Pages deploy step).
3. Go to **Settings → Pages** and set the source to the `gh-pages` branch (root folder). GitHub Actions will push built artifacts there automatically.
4. Push a commit to `main` to trigger the first CI run. The workflow will build the PDF and deploy the `dist/` directory to `gh-pages`.

No separate CI service account or personal access token is required — the built-in `GITHUB_TOKEN` is sufficient.

> **Migrating from Travis CI:** If you previously used `.travis.yml` with a
> `github_token` secret, that configuration has been replaced by the GitHub
> Actions workflow. The Travis CI integration can be safely disabled in your
> Travis account settings.
