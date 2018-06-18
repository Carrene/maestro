# Pashmak

Meta repository for an awesome project management idea aka Pashmak


## Introduction

The aim is to make some monitors for managers and of course, some constraint
and criteria to update the project status for assignee.

The whole mechanism at a glance is something like a state-machine which gathers
the status of each unit of work and aggregated result will be updated inside a
monitoring environment.

Staff may chat each other using provided platform.


### Tools and technologies

- Notification system
- Mobile app
- Back-end REST API
- WWW front-end application
- SSO using (CAS)[https://github.com/Carrene/carrene-authorization-service]
- Chat(text, media) platform


## Entities

- *Project*: A perspective.
- *Release*: A checkpoint which indicates the project is ready to shipped to
	the end-user.
- *Phase*: Another name for `milestone` to encapsulate one or more items 
	within within a time-span, phases should not overlapped.
- *Container*: A simple storage to hold items, containers will be chained to 
	make a workflow: backlog, triage, development, test, QA and etc ...
- *Item*: A unit of work which belongs to a project.
- *Sprint*: A simple view that constructed using one or more items.
- *Audit-log*: As the name says.

## Actors

- *Admin*: kidding me?
- *Stakeholder*: A person which interested in one or more items. So, she 
	should stay update about the status of subscribed items. Although, she may write
	comment for an item.


### User stories

#### Project
#### Release
#### Phase
#### Item
#### Sprint
#### Audit Log

