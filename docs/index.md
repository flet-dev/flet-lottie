# flet-lottie

[![pypi](https://img.shields.io/pypi/v/flet-lottie.svg)](https://pypi.python.org/pypi/flet-lottie)
[![downloads](https://static.pepy.tech/badge/flet-lottie/month)](https://pepy.tech/project/flet-lottie)
[![license](https://img.shields.io/github/license/flet-dev/flet-lottie.svg)](https://github.com/flet-dev/flet-lottie/blob/main/LICENSE)

A Flet extension package for displaying Lottie animations.

It is based on the [lottie](https://pub.dev/packages/lottie) Flutter package.

## Platform Support

This package supports the following platforms:

| Platform | Supported |
|----------|:---------:|
| Windows  |     ✅     |
| macOS    |     ✅     |
| Linux    |     ✅     |
| iOS      |     ✅     |
| Android  |     ✅     |
| Web      |     ✅     |

## Usage

### Installation

To install the `flet-lottie` package and add it to your project dependencies:

=== "uv"
    ```bash
    uv add flet-lottie
    ```

=== "pip"
    ```bash
    pip install flet-lottie  # (1)!
    ```

=== "poetry"
    ```bash
    poetry add flet-lottie
    ```

1. After this, you will have to manually add this package to your `requirements.txt` or `pyproject.toml`.

## Example

```python title="main.py"
--8<-- "examples/lottie_example/src/main.py"
``` 
