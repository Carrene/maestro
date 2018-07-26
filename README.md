# Maestro

Meta repository for an awesome project management idea aka Maestro

## Goals

- **Transparency** : In communications and relations between different corporation sections and stakeholders of a product
- **Facility** : In interaction and communication between teams, resources, stakeholders, ...

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
- SSO using [CAS](https://github.com/Carrene/carrene-authorization-service)
- [Chat(text, media) platform](https://github.com/Carrene/social-network)


### Entities

- *Release*: A checkpoint which indicates the product is ready to shipped to
	the end-user. It may needs that some `projects` in different sections of a corporation be done to release the product.
`Stakeholders` of a `release` have a private chat room to be in touch on-line and can subscribe to be inform on each raised event for one of related `projects`. 
- *Project*: A collection of `issues` which should be done as a part of the `release` provision. The `stakeholders` of a `project` can be in touch on-line at a private room of the `project` and subscribe to be get notifications on the `issues` events.
- *Issue*: An unit of work which belongs to a project. Each issue will consider one or more items and has a status at a glance of time. The stakeholders of an issue are in touch on-line through the private room and can subscribe to get notifications on Issue status changes.
- *Phase*: A point of operation to do an `issue`, `phases` will be chained to make a *Stage*: backlog, triage, development, test, QA and etc. Issues move between different `phases`, they can be in multiple phases simultaneously and initially each new item be put on the triage. Each phase has a response time, so the issues should move between them in determined time stamps.
- *Milestone*: To encapsulate one or more issues within a time-span, milestones should not overlapped.
- *Stage*: A chain of various points of `project`. Each component of `stage` will be set based on the order which `administrator` specifies. The progress of project procedure can be iterated on different components of stage.
- *Tag*: A label for defining an attribute of specific `issue` as a short statement.
- *Item*: An `item` is shortest part of a `project`which is assigned to a `resource`. Each `issue` includes one or more `items`, also each `stage` can icludes one or more `items`. 
- *Sprint*: A simple view that constructed using one or more items.
- *Audit-log*: As the name says.

### Actors

- *Admin*: Administrator.
- *Guest*: A person who can be updated on events occur in a `release`.
- *Resource*: An employee.
- *Stakeholder*: A person(including administrators, guests, resources) which interested in one or more items. So, she/he 
	should stay updated on the status of subscribed items. Although, she/he may write
	comment for an item.

### Projects

- Back-end: [dolphin](https://github.com/Carrene/dolphin)
- Web-front-end: -

### User stories

## Phase 1

#### Project

As an `Admin` I can create project with a unique title and optional descrition. 

As as `Admin` and or a `Stakeholder` I need to stay updated about one or more
projects.

As an `Admin` I can change due date which is defined in a project.

As an `Admin` I have to be notified any time project status changes.

#### Release

As an `Admin` I can create a release point for a product.

A Release should be automatically marked with colors based on the status of 
it's items.

As an `Admin` I can change due date which is defined in a release.

As an `Admin` I have to be notified any time release status changes.

#### Stage

As an `Admin` I can create a stage for a project.

As an `Admin` I can add/remove items to/from a stage.

As an `Admin` I can define one or more items for an issue.

As an `Admin` I can change the order of stage elements.


#### Item

As an `Admin` I can assign one or more items to a resource.

As an `Admin` I can change due date of item.


#### Issue

As an `Admin` I can view, search, group and filter items with release, phase,
name, time, contents and etc ...

As an `Admin` I can append/remove one or more assignees to/from an issue.

As a `Stakeholder` I can subscribe/unsubscribe an issue.

As a `Stakeholder` I can write a comment for an update.

As a `Resource` I have to update the status of in-progress items which 
assigned to me.

As an `Admin` I can define one or more items for an issue.

#### Tag

As an `Admin` I can create a tag.

As an `Admin` I can attach one or more tags to one or issues.


#### Sprint

As an `Admin` I can group some items into a sprint. So, the status of the newly created sprint will be
appeared in my dashboard.

As a `Stakeholder` I can add a sprint into my dashboard to stay aware of that.


#### Audit Log

Every movement in whole environment will be tracked and recorded as an `Audit
Log` entry.

As an `Admin` I can view, serach, group and filter audit-log entries with time,
project, release, phase, sprint, and resource.


name, contents and etc ...

## Phase 2

##### This phase is in draft status

As an `Admin`, I should be able to create a new User/Group/Workflow/Phase/Skill.

As an `Admin`, I should be able to edit a User/Group/Skill.

As an `Admin`, I will be not be able to edit an active Workflow/Phase.

As an `Admin`, I should be able to give users certain skills.

