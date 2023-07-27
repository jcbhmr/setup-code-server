# Setup code-server

## Usage

👇 This demo workflow will install code-server and then start a new VS Code web
IDE instance that you can view using something like [ngrok] or [cloudflared].
Check out the [other @cidebug actions] like [setup-ngrok] or [setup-cloudflared]

```yml
on: push
jobs:
  code-server:
    runs-on: ubuntu-latest
    steps:
      - uses: cidebug/setup-code-server@v1
      - run: code-server
```

After code-server has been setup, you can run it like this:

```sh
code-server
```

📚 Make sure you check out the code-server documentation for a full account of
all the options that you can play around with!
