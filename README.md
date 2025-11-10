# bugbot

Twitter chat bot

---

## Left off at...
- Figuring out how the bot manages tokens. Will the tokens be auto-renewed? Look into this.
- Start programming the bot's behaviour. For example:
    - Track how frequently users interact with the channel
- Look into how this will be hosted
    - Hosted on AP's computer: not ideal since I shut down the computer often
    - Hosted on CG's computer: not ideal since I would not be able to update the source code
    - Hosted on AWS:
        - Figure out how the ports would work?
        - How docker compose would work?
        - Is there enough space on the container?

## 🧾 Change log

### v0.1.0 — 2025-11-09
- Bot project is split into three containers:
    - `bugdb`: PostgreSQL database that holds Twitch tokens and any other information that the bot will record
    - `bugweb`: Django web application that will allow configuration of the bot
    - `bugbot`: the actual bot code, implemented using the `twitchio` library
- Bot is currently functional. Launch using `docker compose`.
