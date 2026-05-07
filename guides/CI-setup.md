
## Guide to continuous integration setup

### Intro

Continuous integration tools such as GitHub Actions allow real-time compilation of the final output PDF and automatic deployment to GitHub Pages, without local installation of dependencies.

[`.github/workflows/ci.yml`](../.github/workflows/ci.yml) and [`requirements.txt`](../requirements.txt) define the CI environment. The workflow installs system packages (texlive, pandoc, graphviz) and Python dependencies, then calls [`deploy.sh`](../deploy.sh), which runs `doorstop_sync.sh` to update the database and generate LaTeX and Markdown outputs. On pushes to `main`, the workflow deploys the `dist/` directory to GitHub Pages using the official [actions/deploy-pages](https://github.com/actions/deploy-pages) action.

### Setup for GitHub Actions on a new copy of the template

1. Fork or copy this repository to your GitHub account.
2. Go to **Settings → Pages** and set the **Source** to **GitHub Actions** (not "Deploy from a branch"). This is required for the official `actions/deploy-pages` deployment model.
3. Push a commit to `main` to trigger the first CI run. The workflow will build the PDF and deploy the `dist/` directory to GitHub Pages.

No separate CI service account, personal access token, or extra `GITHUB_TOKEN` permissions are required — the workflow uses the built-in `id-token: write` permission granted in the workflow file.

> **Migrating from Travis CI:** If you previously used `.travis.yml` with a
> `github_token` secret, that configuration has been replaced by the GitHub
> Actions workflow. The Travis CI integration can be safely disabled in your
> Travis account settings.
