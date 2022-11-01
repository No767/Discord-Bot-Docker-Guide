#!/usr/bin/env bash

# What this will do is that if there is an env variable passed in here from when we run it, we'll write it into our .env file
# and store the token there. From our app, we'll just want to load this .env file and read from it
# This is the most secure way to do it
if [[ -v DISCORD_BOT_TOKEN ]]; then
    echo "Discord_Bot_Token=${DISCORD_BOT_TOKEN}" >> /DiscordBot/Bot/.env
else
    echo "Missing Discord Bot Token! DISCORD_BOT_TOKEN environment variable is not set."
    exit 1;
fi

# And once we are done setting up the env variables
# We can finally start running the Discord bot
exec python3 /DiscordBot/Bot/discord_bot.py