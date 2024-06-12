from typing import Callable


def with_signature(message: str) -> str:
    SIGNATURE = "TEMPLATE >>> "
    if message == "":
        raise ValueError("Message is empty")
    return SIGNATURE + message


def template_main(printer: Callable[[str], None]):
    printer(with_signature("I am here!"))


if __name__ == "__main__":
    template_main(printer=print)
