from typing import Optional

import flet as ft

__all__ = ["Lottie"]


@ft.control("Lottie")
class Lottie(ft.ConstrainedControl):
    """
    Displays lottie animations.

    -----

    Online docs: https://flet.dev/docs/controls/lottie
    """

    src: Optional[str] = None
    src_base64: Optional[str] = None
    repeat: bool = True
    reverse: bool = False
    animate: bool = True
    background_loading: Optional[bool] = None
    filter_quality: Optional[ft.FilterQuality] = None
    fit: Optional[ft.ImageFit] = None
    on_error: ft.OptionalControlEventCallable = None

    def before_update(self):
        super().before_update()
        assert self.src or self.src_base64, "either src or src_base64 must be provided"
