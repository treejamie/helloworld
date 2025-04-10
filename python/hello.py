"""
A minimal and jovial implementation of Hello, world!.
"""
import random
import sys


# use ISO 639 codes as keys
# https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes
languages_we_understand = {
    "en": "Hello, world!",
    "el": "Γειά σου, κόσμε!",
    "gd": "Halò, a shaoghail!",
    "mk": "Здраво, свету!",
    "he": "שלום, עולם!",
    "fr": "Bonjour, le monde!"
}


def greeting(iso_639_1_code: str) -> str:
    """Returns a greeting string"""
    # let's just try and return the target language.
    # However, if we don't have that language, then
    # in true English fashion, if we cannot understand
    # the language because we don't speak it, then we
    # shout the English version back and hope that volume
    # solves the translation issue.
    try:
        return languages_we_understand[iso_639_1_code]
    except KeyError:
        return languages_we_understand["en"].upper()


def speak(iso_code: str | None = None) -> None:
    """Prints a greeting in a given language. 
    If no language code is provided, then a random language is selected."""

    # get a random code if we don't have one
    if not iso_code:
        iso_code = random.choice(
            list(languages_we_understand.keys())
        )
    # if we have a code, make sure we understand it
    elif iso_code not in languages_we_understand:
        raise ValueError(f"Unsupported language code: '{iso_code}'")

    # done, print it out.
    print(greeting(iso_code))


if __name__ == "__main__":
    # accept a command line code
    code = sys.argv[1] if len(sys.argv) > 1 else None

    # speak
    speak(code)
