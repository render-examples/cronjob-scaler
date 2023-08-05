# Render Cron Job Scaler

Simple Render cron job that scales a Render service on a schedule. To deploy:

1. Fork this repo.
2. Change the [schedule](render.yaml#L4) field so the job runs at times when you want to scale. Times are in UTC. You may also wish to change the name of the cron job to reflect when it runs.
3. Click the "Deploy to Render" button below.
4. When prompted, enter the service id for the Render service you want to scale, the number of instances you want to scale it to, and your Render API key. You can find the service ID in the URL when you visit the service's page in the Render dashboard. You can create a Render API key by following the instructions at https://render.com/docs/api#creating-an-api-key.

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

A sensible pattern is to deploy two copies of this repo. For example, one that scales up on weekday mornings and one that scales down on weekday evenings. You could also modify the script so that it accepts a list of (hour, desired instance count) pairs and run a single hourly cron job that checks the list to see if it should change the instance count.
