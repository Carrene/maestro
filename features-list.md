# Maestro features checklist

Real-time validation on sign up and login form fields.  
Direct login after sign up.  
The user name is editable on settings' Profile section.  
The user picture is changable on settings' Profile section.  
The user pasword is changable on settings' Account section.  
The Organizations section on setting shows organizations whic user belongs to.  
Name (required): length and duplicate existence check when adding or editing
an entity (release, project, nugget).  
Cutoff (required for releases): Refuse incorrect dates.  
Cutoff calendar widget functionality.  
Cutoff derived from underlying fields.  
Description (optional): Should not fill it all with white-spaces.  
Description's character counter.  
Form fields get focus by clicking on the field's name or value bax.  
"Leave new release view?" alert appears when a new release form is losing 
focus.  
"Save changes?" alert appears when an existing release form is losing focus.  
Alert prevents page to reload or load another URL.  
Alert should have focus to accept keyboard key-press.  
"Save" button appears after a change in form.  
"Save" reverts to the previous state when changes reverted.  
"New Release" appears when an existing unchanged release selected.  
Releases list columns: Name, Target, Created At, Cutoff  
Double-click on a release opens its projects at 
`http://nightly.maestro.carrene.com/releases/5/projects`  
Sort the list by each column.  
Reverse sort is available too.  
List items selection using arrow keys.  
Sorted by "Created At" column "oldest to newest" on page load.  
Click on a list item, fills right side panel and chat section.  
Right side panel stays on the selected tab when changing project.
Audit logs tab is enabled only in existing nuggets.  
Red notification indicator on logs icon meaning subscribed nuggets modified.  
Audit logs sorted from the newest change to oldest.  
Audit logs columns are: Event, Old, New, User, Date  
Attachments tab is disabled in any new entity.  
Attachments tab is available on editing projects or nuggets.  
Search on attachments available.  
Add an attachment with "+ Add Attachment" which uploads a file.  
"Change Attachment" appears to change the added file.  
The file removed by select nothing after "Change Attachment" clicked.  
Attachment file size and extension check.  
Stay on Add Attachment box while changing nuggets or projects.  
Attachment has description.  
"Save" button does not appear until a file upload done.  
Adding a file caption only does not enable "Save" button.  
Delete attachment by creator.  
Viewing attachments on a frame showing file and creator and creation date.  
Links tab is disabled in any new entity.  
Chat is enabled on projects and nuggets.  
Send chat message with `Enter` key and arrow icon.  
Markdown support in chat.  
Mention with `@` in chat.  
Search users to mention after inserting `@` in chat.  
Immediately showing the sent message in chat.  
Sender name on a sent message.  
"replies  to" quoted message if required on sent message.  
Read check-marks of a sent message.  
Date and time of a sent message.  
Edit a message by sender.  
Edit a message attachment or remove it.  
Editing mode banner on top of input box.  
Cancel edit with `Esc` key or close icon.  
Replies to an edited message showing edited message quoted.  
Reply to a deleted message is not available.  
Click on quoted message, jumps to that message.  
Delete a message by sender.  
Delete confirm with alert.  
Delete confirm alert focus to accept keyboard key-press.  
Show "This message is deleted" with date, time, read check-marks without sender 
name for deleted message.  
Replies to a deleted message showing "This message is deleted" quoted.  
Unread messages horizontal line indication.  
Unread jump circle button having unread messages count.  
Attachments files size and extensions check.  
Multi-file attachments.  
Status (required for new projects): Accepts from options only.  
Status for projects options: Queued, Active, On Hold, Done  
Workflow (required for projects): Accepts from options only.  
Workflow options: Default  
Group (required for projects): Accepts from options only.  
Group options: Public  
Launch (required for projects): Accepts from options only.  
Launch is filled on page load with current selected release.  
Launch options are all releases.  
"Leave new project view?" alert appears when a new project form is losing 
focus.  
"Save changes?" alert appears when an existing projects form is losing focus.  
"New Project" appears when an existing unchanged project selected.  
Project list columns are: Name, Group, Pace, Status, Launch, Member, Target, 
  Created At  
Filter projects list by: Pace, Status.  
Enables Nugget icon on the left sidebar by selecting a project.  
Double-click on a project opens its nuggets at 
`http://nightly.maestro.carrene.com/releases/5/projects/20/nuggets`  
Status for nuggets options: To Do, In Progress, On Hold, Done, Complete  
Priority (required for nuggets): Accepts from options only.  
Priority options: Low, Normal, High  
Tags (required for nuggets): Accepts from drop-down list only.  
Search on tags.  
Multiple tag selection.  
Highlight selected tags.  
Prevent adding a tag several times.  
Delete a tag.  
Prevent adding a non-existent tag. Returns: "Sorry, no matching options".  
Target (required for nuggets): Refuse incorrect dates.  
Target calendar widget functionality.  
Type (required for nuggets): Accepts from options only.  
Types are: Bug, Feature  
Phase (required, on editing a nugget): Accepts from options only.  
Phase options are: Backlog, Triage (default), Design, Development, Test  
Resource (on editing a nugget): Accepts from options only.  
Resource accepts empty value.  
Search on resources.  
Multiple resource selection.  
Highlight selected resources.  
Prevent adding a resource several times.  
Delete a resource.  
Prevent adding a non-existent resource. Returns: "No resources".  
Resources should be assigned to related phases.  
"Are you sure leave the new nugget?" alert appears when a new nugget form is 
losing focus.  
"Are you sure leave the update nugget?" alert appears when an existing nugget 
form is losing focus.  
"New Nugget" appears when an existing unchanged nugget selected.  
Nugget list columns are: ID, Subscribe, Name, Pace, Status, Priority, Type, 
Phase, Tags, Days, Target, Created At  
Filter nuggets list by: Subscribe, Pace, Status, Priority*, Type, Phase, Tags  
List of subscribed modified nuggets at "Unread" part.  
Red notification indicator when nugget change recorded.  
Chat mentions will be counts as notifications.  

