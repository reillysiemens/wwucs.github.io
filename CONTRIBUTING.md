# Contributing to wwucs.github.io
:raised_hands: :tada: We're so glad you want to contribute! :tada: :raised_hands:

Please take a moment to read the following guidelines for contributing to this
project. These are mostly guidelines, not rules. Use your best judgment, and
feel free to propose changes to this document in a pull request.

#### Table of Contents

[Code of Conduct](#code-of-conduct)

[How can I contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Enhancements](#suggesting-enhancements)
  - [Pull Requests](#pull-requests)
  - [Local Development](#local-development)

## Code of Conduct
This project and everyone participating in it is governed by the
[Code of Conduct][code-of-conduct]. By participating, you are expected to
uphold this code. Please report unacceptable behavior to the
[community admins][community-admins].

## How can I contribute?

### Reporting Bugs
If you've found a bug :bug: you can [file an issue][issues]. Please be
sure to include as much detail about the bug and how to reproduce it as
possible. It will also help if you check through [existing issues][issues] to
make sure someone else hasn't already reported your bug.

### Suggesting Enhancements
If you have a suggestion for how this project can be improved you can
[file an issue][issues]. Please be sure to include as much detail about your
suggested enhancement as possible. It will also help if you check through
[existing issues][issues] to make sure someone else hasn't already suggested
your enhancement.

### Pull Requests
We encourage you to provide a fix or enhancement directly if you are able. If
you want to ensure you don't spend a lot of time working on something the
community might reject it won't hurt to
[suggest an enhancement](#suggesting-enhancements) first. You'll also want to
make sure you have a [local development environment](#local-development) set up
before submitting a pull request.

### Local Development

#### Setup
These instructions assume you are using a Unix-like environment
(e.g. macOS, Linux, etc.). Your mileage may vary on Windows and other
platforms.

This project is built using the [Gutenberg][gutenberg] static site generator.
The tool is still young and while it provides several
[installation options][gutenberg-installation] we recommend installing the
latest version from source for which you will need [Rust][rust-lang] and
[Git][git].

These commands will download and install the latest version of Gutenberg
provided you have the aforementioned prerequisistes.
```shell
git clone git@github.com:Keats/gutenberg.git /tmp/gutenberg
pushd /tmp/gutenberg
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
cargo install  # This might take a minute. Grab some coffee.
popd
```

#### Workflow
Once you have [Gutenberg][gutenberg] installed you can simply run `make` to
build the site or you can invoke `gutenberg build` directly.

Gutenberg also supports a `gutenberg watch` subcommand that runs a local
webserver for easier development. It will watch files
(including templates and Sass) and reload your browser while you are making
changes.

#### Branching Strategy
**TL;DR**: The `master` branch is for deployments only. If you try to develop
on it you're going to have a bad time.

This project is deployed using [GitHub Pages][github-pages]. Since we use an
organization page the source of the website **must** be deployed to the
`master` branch. The Markdown, HTML templates, and uncompiled Sass used to
generate the content on the `master` branch live on the `src` branch, which is
the default branch for this repository.

Building the site and getting the output to the `master` branch in a way GitHub
Pages will respect it is something of a pain, so you'll find a `make gh-pages`
target in the project `Makefile` to take the contents of your current branch,
build them, and copy only the relevant artifacts into `master`.

###### Attribution
These contribution guidelines are based on
[Atom's Contribution Guidelines][atom-contribution-guidelines].

[code-of-conduct]: CODE_OF_CONDUCT.md
[community-admins]: https://wwucs.slack.com/account/team
[issues]: https://github.com/wwucs/wwucs.github.io/issues
[gutenberg]: https://www.getgutenberg.io/
[gutenberg-installation]: https://www.getgutenberg.io/documentation/getting-started/installation/
[rust-lang]: https://www.rust-lang.org/
[git]: https://git-scm.com/
[atom-contribution-guidelines]: https://github.com/atom/atom/blob/master/CONTRIBUTING.md
[github-pages]: https://pages.github.com/
