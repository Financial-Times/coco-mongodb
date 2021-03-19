<!--
    Written in the format prescribed by https://github.com/Financial-Times/runbook.md.
    Any future edits should abide by this format.
-->
# UPP - Mongo DB

Document data store that all the UPP content is stored both before transformation and afterwards

## Code

upp-mongodb

## Primary URL

https://github.com/Financial-Times/coco-mongodb

## Service Tier

Platinum

## Lifecycle Stage

Production

## Host Platform

AWS

## Architecture

This image is used to provide Mongo DB instances for Native Store and Document Store.

## Contains Personal Data

No

## Contains Sensitive Data

No

<!-- Placeholder - remove HTML comment markers to activate
## Can Download Personal Data
Choose Yes or No

...or delete this placeholder if not applicable to this system
-->

<!-- Placeholder - remove HTML comment markers to activate
## Can Contact Individuals
Choose Yes or No

...or delete this placeholder if not applicable to this system
-->

## Failover Architecture Type

ActivePassive

## Failover Process Type

FullyAutomated

## Failback Process Type

PartiallyAutomated

## Failover Details

The service is deployed both in Publish and Delivery clusters with different configs. So you can follow these guides:

*   For publish: <https://github.com/Financial-Times/upp-docs/tree/master/failover-guides/publishing-cluster>
*   For delivery: <https://github.com/Financial-Times/upp-docs/tree/master/failover-guides/delivery-cluster>

## Data Recovery Process Type

Manual

## Data Recovery Details

Restore from EBS snapshot

## Release Process Type

PartiallyAutomated

## Rollback Process Type

Manual

## Release Details

Manual failover is needed when a new version of the service is deployed to production (both publishing and delivery cluster).
Otherwise, an automated failover is going to take place when releasing to publishing cluster.
For more details about failover process please see: <https://github.com/Financial-Times/upp-docs/tree/master/failover-guides/>

<!-- Placeholder - remove HTML comment markers to activate
## Heroku Pipeline Name
Enter descriptive text satisfying the following:
This is the name of the Heroku pipeline for this system. If you don't have a pipeline, this is the name of the app in Heroku. A pipeline is a group of Heroku apps that share the same codebase where each app in a pipeline represents the different stages in a continuous delivery workflow, i.e. staging, production.

...or delete this placeholder if not applicable to this system
-->

## Key Management Process Type

None

## Key Management Details

None

## Monitoring

*   <https://upp-prod-publish-us.upp.ft.com/__health>
*   <https://upp-prod-publish-eu.upp.ft.com/__health>
*   <https://upp-prod-delivery-us.upp.ft.com/__health>
*   <https://upp-prod-delivery-eu.upp.ft.com/__health>

## First Line Troubleshooting

<https://github.com/Financial-Times/upp-docs/tree/master/guides/ops/first-line-troubleshooting>

## Second Line Troubleshooting

Please refer to the <https://github.com/Financial-Times/coco-mongodb/blob/master/README.md> for more troubleshooting information.