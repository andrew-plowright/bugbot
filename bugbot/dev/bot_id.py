import os

from dotenv import load_dotenv

import twitchio
import asyncio
load_dotenv(dotenv_path=".env.dev")

"""
Retrieve IDs for the bot owner
"""
CLIENT_ID: str = os.getenv("TWITCH_CLIENT_ID")
CLIENT_SECRET: str = os.getenv("TWITCH_CLIENT_SECRET")
BOT_NAME: str = os.getenv("TWITCH_BOT_NAME")
OWNER_NAME: str = os.getenv("TWITCH_OWNER_NAME")

async def main() -> None:
    async with twitchio.Client(client_id=CLIENT_ID, client_secret=CLIENT_SECRET) as client:
        await client.login()
        user = await client.fetch_users(logins=[OWNER_NAME, BOT_NAME])
        for u in user:
            print(f"User: {u.name} - ID: {u.id}")

if __name__ == "__main__":
    asyncio.run(main())