import flet as ft

import flet_lottie as fl

def main(page: ft.Page):
    page.add(
        ft=fl.Lottie(
            src='https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
            reverse=False,
            animate=True
        )
    )

ft.app(main)