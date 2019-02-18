# Maestro

Meta repository for an awesome project management idea aka Maestro

## Compability Table

The table containing projects related to Maestro:

#### Nightly

| Dolphin        | Panda         | Jaguar        | Flamingo       | Crane          |
| -------------- | ------------- | ------------- | -------------- | -------------- |
| v0.20.3a1      | v0.6.0a3      | v0.10.1a3     | v0.20.7-a8     | v0.3.3-a1      |
| v0.20.3a1      | v0.6.0a3      | v0.10.0a3     | v0.20.2-a3     | v0.3.3-a1      |
| v0.20.2a1      | v0.6.0a3      | v0.9.4a3      | v0.19.1-a2     | v0.3.3-a1      |
| v0.19.3a1      | v0.6.0a3      | v0.9.1a3      | v0.18.1-a2     | v0.3.3-a1      |
| v0.18.3a1      | v0.6.0a3      | v0.8.2a3      | v0.15.2-a3     | v0.3.3-a1      |
| v0.18.0a1      | v0.6.0a3      | v0.8.0a3      | v0.14.2-a3     | v0.3.3-a1      |
| v0.17.1a1      | v0.5.1a3      | v0.7.0a3      | v0.13.4-a5     | v0.3.3-a1      |
| v0.17.1a1      | v0.5.1a3      | v0.7.0a3      | v0.12.6-a6     | v0.3.2-nightly |
| v0.17.0a1      | v0.5.1a3      | v0.7.0a3      | v0.12.6-a6     | v0.3.2-nightly |
| v0.16.0a1      | v0.5.1a3      | v0.7.0a3      | v0.12.1-a1     | v0.3.2-nightly |
| v0.15.0a1      | v0.5.1a3      | v0.6.0a3      | v0.11.0-a1     | v0.3.2-nightly |
| v0.11.4nightly | v0.4.0nightly | v0.2.4nightly | v0.3.5-nightly | v0.1.3-nightly |
| v0.9.1nightly  | v0.3.1nightly | v0.2.1nightly | v0.2.1-nightly | v0.1.1-nightly |
| v0.9.0nightly  | v0.2.0nightly | v0.2.0nightly | v0.2.0-nightly | v0.1.0-nightly |

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

*Issue*: An unit of work which belongs to a project. Each issue will consider one or more items and has a status at a glance of time. A user can become a stakeholder of an issue by subscribing to the issue. The stakeholders are kept up to date via alrets (currently under unread tab) of any changes to the issue or new chats regarding the issue. Each issue has a private chat room for all stakeholders and interested parties (project managers, resources) to communicate about the issue.
     non-critical attributes: {name, description, (everything except for (St/End/EstHrs)}
     critical attricutes: Start/End/Estimated Hours

*Project*: A collection of `issues` which should be completed to be qualified for a `release` provision. Anyone who has access to the project view can participate in a private chat room reserved for the project. 
     Attribute list (name, description, ..}

*Release*: An entity to create a soft or hard deadline for launching one or more project

*Workflow*: An entity defining a process composed of multiple phases through which an issue is worked on and completed
            All workflows have two system phases called Triage and Backlog. All issues start in Triage

*Phase*: The smallest segment in a workflow.  Multiple phases are chained to make a *workflow* e.g.(backlog, triage, development, test, QA ). Issues move between different `phases`, they can be in multiple phases simultaneously. Initially all new items are placed in triage phase. Each system phase has a Response Time, so the issues move between them in predictable time steps.
- -----------*Milestone*: {this seems like a new concept to me. Massoud.}
- *Workflow*: A chain of various phases of an issue. Each component of `workflow` will be set based on the order which `administrator` specifies. The progress of project procedure can be iterated on different components of workflow.

- *Sprint*: Issues within a project are segmented and organzied by the PM in Sprint bundles. Each Sprint bunlde will have a number of iterations to complete.
- *Audit-log*: A detailed list of chages to attributes of issues/projects/releases

### Actors

- *common user* : anyone with a userid, pwd
- *Stakeholder*: any user who is subscribed to one or more issues
- *Resource*: user with at least one skill
- *Project Manager*: user who has the '*Project Manager' skill. To become the Project Manager of a specific project, the User is assigned to the Triage Phase of the project.
- *Release Manager*: user who has the '*Release Manager' skill.
- *Admin*: a special attribute that can be assigned to any user in order to handle administrative tasks such as: setting up users, skills, phases, workflows, calendar settings, and other general settings

- *Guest*:{this is new to me - Massoud}.

*System Tagged Skills:
     -Phase task can be assigned to Resources with the associated Phase skill
     -Project(s) can only be assihned to Resource with Project Manager skill
     -Release(s) can only be assigned to Resource with Release Manager skill


### Projects

- Back-end: [dolphin](https://github.com/Carrene/dolphin)
- Web-front-end: [flamingo](https://github.com/Carrene/flamingo)

### User stories

## Phase 1


#### Project

###### As an `Admin` I can create project with a unique title and optional description. Immediately a **chat room** related to created project will be created.

###### As an `Admin` I can assign a `Manager` to a project. Immediately the assigened manager will be added to chat room related to project. When another manager replaced with current project manager, the unassigned manager will be removed from the specific chat room.

###### As an `Admin` I can change due date which is defined in a project.

###### As an `Admin` I have to be notified any time project status changes.

###### As an `Admin` or `Triage Resource` or `Stakeholder` I can chat about the project using the project chat.

###### As a `Stakeholder` I need to stay updated about one or more issues.

###### As a `Stakeholder` I can subscribe/unsubscribe a project. So I will be added to subscribed project after that.

###### As a `Project Manager` I can assign nuggets to resources.

###### As a `Project Manager` I can update project attributes.

###### As a `Project Manager` I can update the nuggets non-critical attributes.

###### As an `Admin` I can view, search, group and filter projects with title, due date, description, chat room and etc ...

###### As a `Member` I can attach a file to the `Project`.

###### As a `Member` I can delete an attachment from a `Project'.


#### Release

###### As an `Admin` I can create a release point for a product.

###### As an `Admin` I can update release attributes.

###### As a `Stakeholder` I can subscribe/unsubscribe a release.

###### As an `Admin` I can abort a release.

###### A Release should be automatically marked with colors based on the status of it's items.

###### As an `Admin` I can change due date which is defined in a release.

###### As an `Admin` I have to be notified any time release status changes.

###### As an `Admin` or `Triage Resource` or `Stakeholder` I can chat about the release using the release chat.

###### As an `Admin` I can view, search, group and filter releases with related projects, title, description and etc ...


#### Group

###### As an `Member` I can create a group with unique title.

###### As an `Admin` I can place one or more projects into the group.


#### Workflow

###### As a `Manager` I can create a workflow. So, a `Manager` can set a Workflow on Project.

###### As a `Manager` I can remove a workflow.

###### As a `Manager` I can update title of workflow.

###### As a `Manager` I can assign/unassign a resource to/from an issue, so a new item will be created within the selected phase or the default phase is selected based on the resource skill. An issue can be assigned to multiple resources in multiple phases simultaneously which leads to create multiple items, but it cannot be assigned to a resource twice. Just after assigning, resource will be added to chat room of project which that issue is in. So that when unassign an issue from a resource, the resource will be removed from the chat box of project which issue is in. 

###### As a `Manager` I can view, search, group and filter workflows with title, etc ...


#### Phase

###### As a `Manager` I can create a phase for a workflow.

###### As a `Manager` I can update title of a phase of a workflow.

###### As a `Manager` I can update order of a phase of a workflow.

###### As a `Manager` I can remove a phase from workflow.

###### As a `Manager` I can view, search, group and filter phases with title, order and etc ...


#### Nugget

###### As a `User` I can subscribe to an nugget.

###### As a `User` I can view the details of any nugget that is in the group I am a member of.

###### As a `Resource` I can estimate the target date, and total hours that I need complete the work on the nugget.

###### As a `Triage Resource` I can assign resources to the phases of nuggets in my project.

###### As a `Triage Resource` I can change status of the nuggets in my project.


#### Issue

###### As an `Manager` I can define an issue. Immediately a **chat room** related to created issue will be created.

###### As an `Manager` I can view, search, group and filter items with release, phase, name, time, contents and etc ...

###### As an `Manager` I can append/remove one or more assignees to/from an issue.

###### As a `Stakeholder` I can subscribe/unsubscribe an issue. So I will be added to subscribed issue after that.

###### As a `Stakeholder` I can write a comment for an update.

###### As a `Resource` I have to update the status of in-progress items which assigned to me.

###### As an `Manager` I can define one or more items for an issue.

###### As a `Member` I can attach a file to the `Issue`.

###### As a `Member`, I can move an issue from its project to another project.

###### AS a `Member`, I can unassign an issue from a resource and phase.

###### AS a `Member`, I can see an issue that I subscribed.

###### AS a `Member`, I can unsee an issue that I subscribed.

###### As a `Member`, I can subscribe multiple issues.

###### As a `Member` I can delete an attachment from an issue.

###### As a `Member`, I can unrelate an issue to another issue.


#### Draft Issue

###### As a `Member`, I can `DEFINE` a draft issue.

###### As a `Member`, I can `FINALIZE` a draft issue.


#### Tag
###### Tags are custom attributes of Issues. 

###### As a `Member`, I can `LIST` the tags.

###### As a `Member`, I can `ADD` a tag to a draft issue.

###### As a `Member`, I can `ADD` a tag to an issue.

###### As a `Member`, I can `REMOVE` a tag from a draft issue.

###### As a `Member`, I can `REMOVE` a tag from an issue.

###### As a `Member`, I can `CREATE` a tag with a unique title.

#### Resource
###### As a `member`, I can `LIST` resources of a phase.

#### Sprint Bundle

###### As an `Project Manager` I can group items into a Sprint Bundle. Each Sprint Bundle is activated and pushed through the workflow to be completed within a series of sprints


#### Audit Log

###### All changes with Issue, Project, or Relese entities will be tracked and recorded in an `Audit Log` and will be available in a tabular or chat format (ask me about this one!)

###### As a `User` I can view, search, group and filter audit-log entries 

#### CAS

###### As a `CAS member` I can authenticate using CAS account to join.

#### Organization

###### As a `member`, I can `CREATE` my organization.

###### As an `owner`, I can `UPDATE` my organization.

###### As an `owner`, I can `INVITE` a member to my organization.

###### As a `member`, I can `JOIN` to an organization using the invitation a link.

###### As a `member`, I can `LSIT` members of one of my organizations.

###### As an `anonymous`, I can `LIST` all of organization.

###### As a `member`, I can `LIST` all of my organization.

###### As a `member`, I can `GET` one of my organizations.

#### Time Card

###### As a `member`, I can CREATE a Time Card for a nugget that I assigned to.

###### As a `member`, I can UPDATE a Time Card of a nugget that I assigned to.

###### As a `member`, I can LIST Time Cards of a nugget.


## Phase 2

##### Settings/Setup (Groups/Phases/Workflows/Users)

###### As an `Admin`, I should be able to create a new User/Group/Workflow/Phase/Skill.

###### As an `Admin`, I should be able to edit a User/Group/Skill.

###### As an `Admin`, I will be not be able to edit an active Workflow/Phase.

###### As an `Admin`, I should be able to give users certain skills.

#### Authorization

###### As a `Resource`, I can have at least one or many role(s), so I will in-charge to all permitted actions of my roles.

###### As an `Admin`, I can append one or many role(s) to a specific resource, so the mentioned resource can do all permitted actions of her roles.

###### As an `Admin`, I can list all resources with their roles.

###### As an `Admin`, I can remove one or many role(s) from a specific resource except removing admin form herself, so the mentioned source cannot do the actions of the removed role(s) anymore.

###### As an `Admin`, I can append one or many action(s) to a role, so all resources which have the changed role will be permitted to do newly added actions.

###### As an `Admin`, I can remove one or many action(s) to a role, so all resources which have the changed role will not be permitted to do removed actions.

###### As an `Admin`, I can define a new role.

###### As an `Admin`, I can delete a role if there is no resource exist with this role.

#### integrations with github

###### As an `Admin`, I can select one or more repositor(y|ies) to transfer a Nugget to github as a milstone.

###### As an `Admin`, I can assign Nugget to a resource in specifict phase so we have a item asymmetric issue will be created for repository in github that track it.

###### As a `member`, I can aware of new comment in issue of github in chatroom of Nugget.


