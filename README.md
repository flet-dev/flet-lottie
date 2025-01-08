# Lottie control for Flet

`Lottie` control for Flet.

## Usage

Add `flet-lottie` as dependency (`pyproject.toml` or `requirements.txt`) to your Flet project.

## Example

```py

import flet as ft

import flet_lottie as fl

def main(page: ft.Page):
    page.add(
        fl.Lottie(
            src='https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
            reverse=False,
            animate=True
        )
    )

ft.app(main)
```