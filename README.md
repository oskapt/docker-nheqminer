# Docker Nicehash CPU Miner

I built this container so that I could mine ZEC under OSX because I have an
unreasonable number of Macs laying around my house.

This runs the [Nicehash CPU miner](https://github.com/nicehash/nheqminer) for ZEC,
but it doesn't mine from the ZEC pool directly. That functionality appears to only
be available in the Windows binaries for now.

Instead, this mines ZEC and is somehow magically converted to BTC (presumably sold
at an acceptable rate) and deposited in your BTC wallet.

## Pulling from Docker Hub

You can pull the latest copy of this container from [Docker Hub](https://hub.docker.com/r/monachus/nheqminer/)
by running:
```
$ docker pull monachus/nheqminer
```

**WARNING:** This container is stupidly large. Unreasonably so. I don't recommend
that you pull it. Build it instead.

## Building the Container

Building the container is easy:
```
$ docker build -t monachus/nheqminer .
```

## Start up the miner

I've provided a config file for Docker Compose that you can use to start the container.

1. Copy `docker-compose.sample.yml` to `docker-compose.yml`
2. Edit the file and set your `BTC_ADDR` in the environment.
3. Change `THREADS` if you want to, setting it to 75% of the actual CPU threads
on your system.
4. Launch it with `docker-compose up` and watch the magic happen! (Add `-d` to run the container in detached mode.)

This will fire up the daemon and start CPU mining with your hardware.

Happy mining!

If you want to toss me some ZEC as a donation, you can send it to
`zcX6hXED6gNDgCp6CSLtgjBQEJoqSey2wqhJjZi6mX3a6CVhVj1GQ4yRvWCyVCQP61urzb2iGYGZFMNdMKQb6rL8Ro9KjdG`.

If you want to send BTC, you can send it to `1Ad3QvVzNAFa2F8memeYGWM1TUoGJUS9uM`.

Thanks!
