import dataclasses
import logging
import os

import flet as ft

import flet_lottie as fl

logging.basicConfig(level=logging.INFO)
os.environ["FLET_PLATFORM"] = "macos"


def main(page: ft.Page):
    page.add(
        ft.Text("Lottie Example"),
    )


ft.run(main, port=8550)
