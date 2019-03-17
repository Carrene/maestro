# Maestro features checklist


Users receive an email and can join Maestro, by clicking on the link in email.
Real-time validation on sign up and login form fields

The user name is editable on settings' Profile section.
The user picture is changeable on settings' Profile section.
The password is changeable on settings' Account section.

Name (required): length and duplicate existence check when adding or editing an entity (release, project, nugget).
Description (optional): Should not fill it all with white-spaces.
Description's character counter.
Form fields get focused by clicking on the field's name or value box.
"Leave new nuggets view?" alert appears when a new nugget form is losing focus.
"Save changes?" alert appears when an existing nugget form is losing focus.
"Save" button appears after a change in form.
"Save" reverts to the previous state when changes reverted.
"New nugget" appears when an existing unchanged nugget is selected.
Sort the list by each column.
Reverse sort is available too.
Right side panel stays on the selected tab when changing project or nugget.
Right side panel loads new data when changing list item.
Red notification indicator on logs icon meaning subscribed nuggets modified.
Audit logs sorted from the newest changes to earlier changes.
Audit logs columns are: Event, New, Old, User, Date
Attachments tab is disabled in any new entity (while creating it)
Attachments tab is available on editing projects or nuggets.
Add an attachment with "+ Add Attachment" which uploads a file.
"Change Attachment" appears to change the added file.
By clicking "change attachment" and selecting no file, the last file shouldn't be deleted.
Stay on Add Attachment box while changing nuggets or projects.
Attachments can have description.
"Save" button does not appear until a file is uploaded
Save' button won't go active by adding caption only.
User who attaches a file, can remove the attachment.
Viewing attachments on a frame showing file and creator and creation date & time.
Enables Nugget tab on the left sidebar by selecting a project.
Double-click on a project opens its nuggets
Status for nuggets options: To Do, In Progress, On Hold, Complete, Done
Priority (required for nuggets): Accepts from options only.
Priority options: Low, Normal, High
Tags (required for nuggets): Accepts from drop-down list only.
Search on tags.
Multiple tag selection.
Highlight selected tags.
Prevent adding a tag several times.
Delete a tag from a nugget
Prevent adding a non-existent tag. Returns: "Sorry, no matching options".
Target date (required for nuggets): shouldn't accepts earlier dates than today (e.g. a week ago) as target date.
Target calendar widget functionality.
Type (required for nuggets): Accepts from options only.
Types are: Bug, Feature
Phase: Accepts from options only.
Phase options are: Triage (default), Backlog, Design, Development, Test
Resource (on editing a nugget): Accepts from options only.
Resource accepts empty value, but then automatically assigns the user who has changed the nugget (if left empty)
Search on resources.
Multiple resource selection.
Highlight selected resources.
Prevent adding a resource several times.

When changing a phase, it prevents adding a non-existent resource: Returns "No resources". but if u save it, it'll be saved and then automatically assign the user who has changed the nugget
"Are you sure leave the new nugget?" alert appears when a new nugget form is losing focus.
"Are you sure leave the update nugget?" alert appears when an existing nugget form is losing focus.
"New Nugget" appears when an existing unchanged nugget selected.
Nugget list columns are: Subscribe, ID, Name, Pace, Status, Type, Phase, Days, Target, Priority, Tags, Created At
Filter nuggets list by: Subscribe, Pace, Status, Priority, Type, Phase, Tags
Related nuggets field in nuggets forms shows the number of the nugget
User can have some actions on nugget(s) by selecting them and right click
Right click can change subscription, status, priority and project of a nugget changing any of the attributes via right click, doesn't need to be saved.
Any changes done using right click, should be shown in the 'Audit log' tab
Via right click, a bug can be reported on the nugget with 'Feature' type only.
User can select multiple nuggets and change an attribute, using right click

Send chat message with Enter and send icon.
Markdown support in chat.
A message in which a user is mentioned, can't be deleted.
Sender's name on a sent message.
"replies to" quoted message if required on sent message.
Seen by (u can see by whom each message has been seen)
Date and time of a sent message.
Edit a message by sender.
Edited' label for edited messages.
Editing mode banner on top of input box.
Replies to an edited message showing edited message quoted.
Reply to a deleted message is not available.
Click on quoted message, jumps to that message.
Delete a message by sender.
Delete confirm with alert.
Show "This message is deleted" should show the senders' name and the time. it shouldn't show the seen by, or 'edited' or anything else.
Replies to a deleted message showing "This message is deleted" quoted.
Unread messages horizontal white line indication.
Unread jump circle button having unread messages count.
Multi-file attachments on chats.

Red notification indicator when nugget change recorded.
Status (required for new projects): Accepts from options only.
Status for projects options: Queued, Active, On Hold, Done
Workflow (required for projects): Accepts from options only.
Group (required for projects): Accepts from options only.
Group options: Public
Launch (required for projects): Accepts from options only.
Launch is filled on page load with current selected release.
Project list columns are: Name, Group, Pace, Status, Launch, Member, Target, Created At
Filter projects list by: Pace, Status.
Enables Nugget icon on the left sidebar by selecting a project.
Double-click on a project opens its nuggets
Name (required): length and duplicate existence check when adding or editing a launch
Cutoff (required for releases): Refuse incorrect dates.
Cutoff calendar widget functionality.
Release Date will be set using calendar as well

"Leave new release view?" alert appears when a new release form is losing focus.
"Save changes?" alert appears when an existing release form is losing focus.
"New Release" appears when an existing unchanged release selected.
Double-click on a release opens its projects
