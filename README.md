# Funnelback best bets checker

This downloads the bext bets files in Funnelback and checks them for 404s

## Environment variables

You need to ensure that the following environment variables are set:
* FUNNELBACK_USERNAME
* FUNNELBACK_PASSWORD
* FUNNELBACK_DOMAIN
* FUNNELBACK_PORT

To run:

<code>ruby check-best-bets.rb [internal|external]</code>

This currently downloads the specified best bets file and outputs it.
