"""
The hello.py tests
"""
import unittest
from io import StringIO
from unittest.mock import patch
import hello


class HelloTest(unittest.TestCase):
    """
    all of the test functions for hello world
    """

    def test_hello_greeting_shouts_english(self):
        """If a non-supported code is given to greeting, we shout english back"""
        self.assertEqual( hello.greeting("aa"), "HELLO, WORLD!")

    def test_hello_greeting_en(self):
        """Ensure hello is correctly returned for en"""
        self.assertEqual( hello.greeting("en"), "Hello, world!")

    def test_hello_greeting_el(self):
        """Ensure hello is correctly returned for el"""
        self.assertEqual( hello.greeting("el"), "Γειά σου, κόσμε!")

    def test_hello_greeting_gd(self):
        """Ensure hello is correctly returned for gd"""
        self.assertEqual( hello.greeting("gd"), "Halò, a shaoghail!")

    def test_hello_greeting_mk(self):
        """Ensure hello is correctly returned for mk"""
        self.assertEqual( hello.greeting("mk"), "Здраво, свету!")

    def test_hello_greeting_he(self):
        """Ensure hello is correctly returned for he"""
        self.assertEqual( hello.greeting("he"), "שלום, עולם!")

    def test_hello_greeting_fr(self):
        """Ensure hello is correctly returned for fr"""
        self.assertEqual( hello.greeting("fr"), "Bonjour, le monde!")    

    @patch('sys.stdout', new_callable=StringIO)
    def test_speak_prints(self, fake_stdout):
        """Ensure speak speaks when given a valid code"""
        # call speak
        hello.speak("en")

        # and it is in stdout
        self.assertEqual(
            fake_stdout.getvalue(),
            "Hello, world!\n"
        )

    def test_speak_value_error(self):
        """Ensure test speak raises a value error if given a non-supported code"""
        # call speak with an unsupported language and we get a value rrro
        self.assertRaises(ValueError, hello.speak, "zz")

if __name__ == '__main__':
    unittest.main()
