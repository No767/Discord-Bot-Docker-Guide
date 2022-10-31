# Discord Bot Docker Guide

Hey there all, this is a guide on how to properly deploy and run your discord bot using Docker instead. This guide uses a bot that uses discord.py v2. But the ideas can be extended with forks of discord.py, such as Pycord, Nextcord, etc. 

## Before you start reading....

There are some stuff that this guide assumes you know how to use. Here's a list of what is assumed that you will need to know: 

- A basic understanding of how Docker works
- Docker concepts (Dockerfile, Images, Containers, etc)
- How to create and run a working discord bot using discord.py or any fork of discord.py (If you don't, go ahead and learn dpy, join the dpy discord server for help, and read dpy's docs)
- A basic understanding on how Linux works. For this guide, all Dockerfiles are based on Debian 11 (Bullseye)

If you do understand these concepts, then read ahead. If you don't, look at the resources page in the bottom.

## The basic ideas of Docker

There are some basic best practices that should be done with Docker, and they can be found [here](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/). But in short, these are some of the practices that you should stick with:

- Each Docker container should run the min amount of processes needed in order to function
- The first process that gets executed is PID1, which on most Linux systems, is `init`. PID0 halts the system, while PID1 is the first thing that gets booted. This should be an `init` manager like `tini` or `dumb-init` (discussed in more detail later)
- Each Dockerfile should be as slim as possible. It's recommended to use `*-slim-bullseye` tags, since this will use a slimmed down version of Debian 11 as it's base. Alpine Linux is another alternative, but may cause performance issues with Python, and in effect, your bot.

## How this guide is structured

This guide has examples, and those examples are split into 3 main ones: Requirements, Pipenv, and Poetry. `requirements.txt` may be the most common one used, but personally I use poetry. These examples are documented, and contain almost everything needed to operate and run these bots. The bot is a basic discord.py bot with 1 cog loaded, which is a help cog. 
