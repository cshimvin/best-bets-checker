# Funnelback best bets checker

This downloads the bext bets files in Funnelback and checks them for 404s

## Environment variables

You need to ensure that the following environment variables are set:
* FUNNELBACK_USERNAME
* FUNNELBACK_PASSWORD
* FUNNELBACK_DOMAIN
* FUNNELBACK_PORT

The following folder also needs to be created:
* data

To run the basic report:

<code>ruby check-best-bets.rb [internal|external]</code>

This currently downloads the specified best bets file and outputs it.

To run the web app, ensure sinatra is installed then go to your browser and use the URL:

<code>http://localhost:4567/</code>

