# Pashmak

Meta repository for an awesome project management idea aka Pashmak

## Goals

- **Transparency** : in communications and relations between different corporation sections and stakeholders of a product
- **Facility** : in interaction and communication between teams, resources, stakeholders, ...

## Introduction

Status: draft


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
- Chat(text, media) platform [https://github.com/Carrene/social-network]


### Entities

- *Release*: A checkpoint which indicates the product is ready to shipped to
	the end-user. It may needs that some projects in different sections of a corporation be done to release the product.
	Stakeholders of a release have a private chat room to be in touch on-line and can subscribe to be inform on each raised event for one of related projects. 
- *Project*: A collection of tasks which should be done as a part of the release provision. The stakeholders of a project can be in touch on-line at a private room of the project and subscribe to be get notifications on the items events.
- *Item*: A unit of work which belongs to a project. Each item will be assigned to one or more resources and has a status at a glance of time. The stakeholders of an item are in touch on-line through the private room and can subscribe to get notifications on item status changes.
- *Phase*: A stage of operation to do an item, phases will be chained to 
	make a *Workflow*: backlog, triage, development, test, QA and etc. Items move between different phases, they can be in multiple phases simultaneously and initially each new item be put on the triage. Each phase has a response time, so the items should move between them in determined time stamps.
- *Milestone*: to encapsulate one or more items 
	within within a time-span, milestones should not overlapped.
- *Sprint*: A simple view that constructed using one or more items.
- *Audit-log*: As the name says.

### Actors

- *Admin*: Administrator.
- *Resource*: An employee.
- *Stakeholder*: A person(including administrators) which interested in one or more items. So, she
	should stay updated about the status of subscribed items. Although, she may write
	comment for an item.

**Important Note**: Administrator is subset of Stakeholder


### User stories

#### Project

As an `Stakeholder` I can subscribe/unsubscribe an Project.

As an `Admin` I can create project with a unique title and optional description.

As an `Admin` and or a `Stakeholder` I need to stay updated about one or more
projects.

#### Release

As an `Stakeholder` I can subscribe/unsubscribe an Release.

As an `Admin` I can create a release point for a project consist of phases.

A Release should be automatically marked with colors based on the status of 
its items.


#### Phase

As an `Admin` I can create a Phase for a project.

As an `Admin` I can add/remove items to/from a phase.


#### Item

As an `Admin` I can view, search, group and filter items with release, phase,
name, time, contents and etc ...

As an `Admin` I can assign one or more resources to an item.

As an `Admin` I can remove one or more resources from an item.

As an `Stakeholder` I can subscribe/unsubscribe an item.

As an `Stakeholder` I can write a comment for an update.

As an `Resource` I have to update the status of in-progress items which 
assigned to me.


#### Sprint

As an `Admin` I can group some items into a sprint. So, the status of the newly created sprint will be
appeared in my dashboard.

As an `Stakeholder` I can add a sprint into my dashboard to stay aware of that.


#### Audit Log

Every movement in whole environment will be tracked and recorded as an `Audit
Log` entry.

As an `Admin` I can view, search, group and filter audit-log entries with time,
project, release, phase, sprint, and resource.


name, contents and etc ...

