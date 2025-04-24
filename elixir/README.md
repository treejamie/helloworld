### Elixir Hello, World!
![helloworld](https://github.com/user-attachments/assets/7871e34a-31bd-4961-a0e8-0666c3cf5d78)


Truth be told, there's not really a lot you can do with this example and in a lot of ways it's not really a HelloWorld example.

The idea here was to showcase

- OTP `GenServers` talking to each other
- OTP `Supervisors` running a bunch of servers
- Use `ExUnit` for unit tests and doc tests
- Use Elixir to handle some input from a 3rd party file (CSV)
- Use `ExDoc` to publish documentation for the package
- Use [Github pages to host the documentation][1]
- Use GitHub actions to demonstrate CI/CD usage in Elixir land (tests / publish docs)


Obviously, this is a slightly excessive version of "Hello, world!".  If you want to know more about the rationale behind over the top examples of "Hello, world!" then go [read the readme][0]


# Installation

To set up **Hello World** locally:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/treejamie/helloworld.git
    cd helloworld/elixir
    ```

2. **Fetch dependencies**:

    ```bash
    mix deps.get
    ```

3. **(Optional)**: Generate the documentation locally:

    ```bash
    mix docs
    ```

    This creates static documentation in the `doc/` folder.

---

# Running the Project

To start the **Hello World** application:

```bash
mix run --no-halt
```

This boots the **Introvert** and **Extrovert** servers under a **supervision tree**.

You’ll see terminal output as the **extrovert sends greetings** and the **introvert reacts**.

---

## Example Output

```
Starting THE supervisor...
Starting the Introvert server... (reluctantly)
Starting the Extrovert server...
(extrovert): Hallo, Welt!
(introvert): (＾▽＾) Please, be quiet.
...
(introvert): (╯°□°）╯︵ ┻━┻
(introvert): You totally had that coming.
(introvert): (＾▽＾) Blissful silence.
```

---

# Requirements

- **Elixir** `1.18`
- **Erlang/OTP** `27`

Confirm your installed versions:

```bash
elixir --version
```
# The Idea

I have two cats one talks a lot and the other is fairly quiet. I imagined them as robots
![The Idea](idea.jpeg)


[0]: https://github.com/treejamie/helloworld
[1]: https://treejamie.github.io/helloworld/
