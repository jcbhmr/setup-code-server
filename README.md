# Setup code-server

💻 Install [code-server] to run a local VS Code web instance

## Usage

```yml
on: push
jobs:
  code-server:
    runs-on: ubuntu-latest
    steps:
      - uses: cidebug/setup-code-server@v1
      - uses: cidebug/setup-cloudflare-tunnel@v1
      - run: |
          code-server --auth none --bind-addr 0.0.0.0:4000 &
          cloudflared tunnel --url http://localhost:4000 &
          wait -n
```

📚 Make sure you check out [the code-server documentation] for a full list of
all the options that you can play around with!

[code-server]: https://github.com/coder/code-server
[the code-server documentation]: https://coder.com/docs/code-server/latest/guide
