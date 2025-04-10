"""
The hello.py tests
"""
import unittest
import hello


class HelloTest(unittest.TestCase):
    """
    all of the test functions for hello world
    """

    def test_hello(self):
        """Ensure hello is correctly returned"""
        self.assertEqual(
            hello.greeting("en"),
            "Hello, world!"
        )



if __name__ == '__main__':
    unittest.main()
