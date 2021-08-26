# statuspost

An quick and dirty way to monitor and report the status of services running on your server

This is intended to be used with [Atlassian Statuspage](https://statuspage.io/). Though it can be modified to work with just about any kind of webhook

It checks if an application is bound to a port, and if it is it will report it as online, if not it will report it as down.

### Setup

New services can be declared by copy & pasting that same object, and incrementing the number.

```bash
declare -A addressX=(
    [port]="1204"
    [status]="statuspage_url"
    [degraded]="major_outage"
)
```

1. Get your Statuspage API key and fill it out in the "authorization" section
2. Fill out all of the details for your services, (urls, port, type of outage)
3. Test it!

If all is well with your script, and it reports outages correctly, you could put it on cron!

This is what is used for monitoring the [Ryuko Discord Bot](https://ryuko.cc) since rarely the host server is offline.
