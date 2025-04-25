from typing import Dict, Optional

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
    enable_merge_paths: bool = False
    enable_layers_opacity: bool = False
    background_loading: Optional[bool] = None
    filter_quality: Optional[ft.FilterQuality] = None
    fit: Optional[ft.ImageFit] = None
    headers: Optional[Dict[str, str]] = None
    error_content: ft.OptionalControl = None
    on_error: ft.OptionalControlEventCallable = None

    def before_update(self):
        super().before_update()
        assert self.src or self.src_base64, "either src or src_base64 must be provided"
