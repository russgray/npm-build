# npm-build
This is a base image for building [node.js][node.js] [npm][npm]
repositories. It is largely based on
https://github.com/nubs/docker-npm-build but builds on the official
node9 docker image.

## Purpose
This docker image builds on top of a base node9-alpine image for the
purpose of building projects using npm. Access to the build location
will be in the volume located at `/code`. This directory will be the
default working directory.

## Usage
This library is useful with simple `package.json`'s from the command line.
For example:

```bash
docker run -it --rm -v /tmp/my-code:/code russgray/npm-build
```

This will execute the default command (`npm install`) and update your
code directory with the result (i.e., `node_modules`).

Other commands can also be executed.  For example, to update
dependencies:

```bash
docker run -it --rm -v /tmp/my-code:/code russgray/npm-build npm update
```

If you are running this on e.g. a vagrant VM with a Windows host, you
may hit problems related to symlinks and fsevent. It is usually possible
to work around this with a pair of additional arguments:

```bash
docker run -it --rm -v /tmp/my-code:/code russgray/npm-build npm install --no-bin-links --no-optional
```
