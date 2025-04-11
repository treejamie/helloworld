# Python Hello, World!

The nice thing about python is that you can jump straight in and start writing code. There's no real project structure and it's mostly up to the user and readme to get setup. The bad thing about python is that you can jump straight in and start writing code.
There's no real project structure and it's mostly up to the user and readme to get setup.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Configuration](#configuration)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)

## Installation

Instructions for installing:

```bash
# Clone the repo
git clone git@github.com:treejamie/helloworld.git

# Navigate into the directory
cd helloworld/python
```
## Features

This app will say hello in six different languages

1. English
2. Greek
3. Gaelic
4. Hebrew
5. Macedonian
6. French

These languages were picked purely to play with different character sets. No hidden meanings or secret messages. Attempts were made to see if I could use the [ISO639-1 code](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes) to spell `he`, `ll`, `ow`, `or`, `ld`. But that didn't work out.

```bash
# run the hello world for a random greeting
python hello.py

# run the hello world for a target language
python hello.py [en|el|gd|mk|he|fr]

# do the typical en

# run the tests
python -m unittest discover
```
There's a bonus feature if you open the the file in a python shell and call `greeting` with a non-supported language code. This requires `ipython`, which is detailed in the [development](#development) section.

```
ipython
from hello import greeting
greeting('lol')
'HELLO, WORLD!'  # English people have a magic ability to shout in English and it transforms into any target language
quit


## Development

I've been using [`uv`](https://docs.astral.sh/uv/) because I'm rogue. But equally you can stick with the standard python tooling (`pip`), or whatever you're used to.
 

```bash
# make a virtualenv
uv venv .python

# activate
source .python/bin/activate

# install requirements
uv pip install -r requirements.txt

# fire up ipython (_poor mans iex_)
ipython

# and do this for autoreload goodness and great benefit
%load_ext autoreload
%autoreload 2

```

## Contributing

Pull requests are welcomed if:

1. You can make any implementation jokes funnier.
2. You stick to the [CONTRIBUTION](../CONTRIBUTING.md) guidelines.


## License

[MIT © 2025 Jamie Curle](../LICENSE.md)
