
# use ISO 639 codes as keys
# https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes
greetings = {
    "en": "Hello, world!",
    "el": "Γειά σου, κόσμε!",
    "gd": "Halò, a shaoghail!",
    "mk": "Здраво, свету!",
    "he": "שלום, עולם!",
    "fr": "Bonjour, le monde !"
}


def greeting(iso_639_1_code):
    """Returns a greeting string"""
    # let's just try and return the target language
    try:
        return greetings[iso_639_1_code]
    except KeyError:
        # in true english fashion, just shout the 
        # english version back and hope that volume
        # solves the translation issue.
        return greetings["en"].UPPER()


def speak():
    print(greeting())

if __name__ == "__main__":
    speak()