# Maestro

Meta repository for an awesome project management idea aka Maestro

## Goals

- **Transparency** : Maestro provides full transparancy for all projects and their items in the production line
- **Accountability** : Maestro facilitates full accountability from each resource to keep up with their commitments

## Introduction

Status: draft


Maeatro provides for tracking the real time progress of all projects in an entire organization or within a department.
It provides senior executives a real time high level view of the timely progress of all projects.
It provides project managers an automatic tracking of the progress of each issue within a project
It provides each stakeholder an automatic alert to see changes in subscribed issue(s) of interest in real time. It also provides an intuitive chat mechanisem for them to voice their opnions to the team.

The whole mechanism at a glance is something like a state-machine which gathers
the status of each unit of work and aggregated result will be updated inside a
monitoring environment.




### Tools and technologies

- Notification system
- Mobile app
- Back-end REST API
- WWW front-end application
- SSO using [CAS](https://github.com/Carrene/carrene-authorization-service)
- [Chat(text, media) platform](https://github.com/Carrene/social-network)


### Entities

"Issue": An unit of work which belongs to a project. Each issue will consider one or more items and has a status at a glance of time. A user can become a stakeholder of an issue by subscribing to the issue. The stakeholders are kept up to date via alrets (currently under unread tab) of any changes to the issue or new chats regarding the issue. Each issue has a private chat room for all stakeholders and interested parties (project managers, resources) to communicate about the issue.
     Attribute list {name, description, }

*Project*: A collection of `issues` which should be completed to be qualified for a `release` provision. Anyone who has access to the project view can participate in a private chat room reserved for the project. 
     Attribute list (name, description, ..}

*Release*: An entity to create a soft or hard deadline for launching one or more project

"Workflow" : An entity defining a process composed of multiple phases through which an issue is worked on and completed
             All workflows have two system phases called Triage and Backlog. All issues start in Triage
	     
*Phase*: The smallest segment in a workflow.  Multiple phases are chained to make a *workflow* e.g.(backlog, triage, development, test, QA ). Issues move between different `phases`, they can be in multiple phases simultaneously. Initially all new items are placed in triage phase. Each system phase has a Response Time, so the issues move between them in predictable time steps.
- -----------*Milestone*: {this seems like a new concept to me. Massoud.}
- *Workflow*: A chain of various phases of an issue. Each component of `workflow` will be set based on the order which `administrator` specifies. The progress of project procedure can be iterated on different components of workflow.

- *Sprint*: Issues within a project are segmented and organzied by the PM in Sprint bundles. Each Sprint bunlde will have a number of iterations to complete.
- *Audit-log*: A detailed list of chages to attributes of issues/projects/releases

### Actors

- "user" : anyone with a userid, pwd
- *Admin*: a users who can create other users and assign a role (common user or PM) or set permissions for the user 
- *Guest*:{this is new to me - Massoud}.
- *Project Manager*: User who is assigned to the Triage Phase of the project, aka the Project Manager/Assistant Proj. mgr.
- *Resource*: User with skills
- *Stakeholder*: any user who is subscribed to one or more issues

### Projects

- Back-end: [dolphin](https://github.com/Carrene/dolphin)
- Web-front-end: [flamingo](https://github.com/Carrene/flamingo)

### User stories

## Phase 1

#### Project

As an `Admin` I can create project with a unique title and optional descrition.

As a `Stakeholder` I need to stay updated about one or more
issues.

As an `Admin` I can change due date which is defined in a project.

As an `Admin` I have to be notified any time project status changes.

As an `Admin` or `Triage Resource` or `Stakeholder` I can chat about the project using the project chat.

#### Release

As an `Admin` I can create a release point for a product.

A Release should be automatically marked with colors based on the status of 
it's items.

As an `Admin` I can change due date which is defined in a release.

As an `Admin` I have to be notified any time release status changes.

As an `Admin` or `Triage Resource` or `Stakeholder` I can chat about the release using the release chat.

#### Workflow

As an `Admin` I can create a workflow for a project.

As an `Admin` I can assign/unassign a resource to/from an issue, so a new item will be created within the selected phase 
or the default phase is selected based on the resource skill. An issue can be assigned to multiple resources in multiple phases simultaneously which leads to create multiple items, but it cannot be assigned to a resource twice.

As an `Admin` I can change the order of workflow phases.


#### Item

As a `User` I can subscribe to an item.

As a `User` I can view the details of any item that is in the group I am a member of.

As a `Resource` I can estimate the target date, and total hours that I need complete the work on the item.

As a `Triage Resource` I can assign resources to the phases of items in my project.

As a `Triage Resource` I can change details of the items in my project.


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
Tags are custom attributes of Issues 

#### Sprint Bundle

As an `Project Manager` I can group items into a Sprint Bundle. Each Sprint Bundle is activated and pushed through the workflow to be completed within a series of sprints


#### Audit Log

All changes with Issue, Project, or Relese entities will be tracked and recorded in an `Audit
Log` and will be available in a tabular or chat format (ask me about this one!)

As a `User` I can view, search, group and filter audit-log entries 


## Phase 2

##### Settings/Setup (Groups/Phases/Workflows/Users)

As an `Admin`, I should be able to create a new User/Group/Workflow/Phase/Skill.

As an `Admin`, I should be able to edit a User/Group/Skill.

As an `Admin`, I will be not be able to edit an active Workflow/Phase.

As an `Admin`, I should be able to give users certain skills.

