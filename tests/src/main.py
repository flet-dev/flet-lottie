import flet as ft

import flet_lottie as ftl


def main(page: ft.Page):
    page.add(
        ftl.Lottie(
            src="https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json",
            reverse=False,
            animate=True,
            error_content=ft.Placeholder(ft.Text("Error loading Lottie2")),
            on_error=lambda e: print(f"Error loading Lottie1: {e.data}"),
        ),
        ftl.Lottie(
            src="sample2.json",
            reverse=False,
            animate=True,
            enable_merge_paths=True,
            enable_layers_opacity=True,
            error_content=ft.Placeholder(ft.Text("Error loading Lottie2")),
            on_error=lambda e: print(f"Error loading Lottie2: {e.data}"),
        ),
    )


ft.run(main, assets_dir="assets")
