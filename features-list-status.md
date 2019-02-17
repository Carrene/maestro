# Maestro features checklist

- [x] Real-time validation on sign up and login form fields.  
- [x] Direct login after sign up.  
- [x] The user name is editable on settings' Profile section.  
- [x] The user picture is changeable on settings' Profile section.  
- [x] The user password is changeable on settings' Account section.  
- [x] The Organizations section on setting shows organizations which user belongs to.  
- [x] Name (required): length and duplicate existence check when adding or editing
an entity (release, project, nugget).  
- [ ] Cutoff (required for releases): Refuse incorrect dates.  
- [x] Cutoff calendar widget functionality.  
- [ ] Cutoff derived from underlying fields.  
- [x] Description (optional): Should not fill it all with white-spaces.  
- [x] Description's character counter.  
- [x] Form fields get focus by clicking on the field's name or value box.  
- [x] "Leave new release view?" alert appears when a new release form is losing 
focus.  
- [x] "Save changes?" alert appears when an existing release form is losing focus.  
- [ ] Alert prevents page to reload or load another URL.  
- [ ] Alert should have focus to accept keyboard key-press.  
- [x] "Save" button appears after a change in form.  
- [x] "Save" reverts to the previous state when changes reverted.  
- [x] "New Release" appears when an existing unchanged release selected.  
- [x] Releases list columns: Name, Target, Created At, Cutoff  
- [x] Double-click on a release opens its projects at 
`http://nightly.maestro.carrene.com/releases/5/projects`  
- [ ] Sort the list by each column.  
- [ ] Reverse sort is available too.  
- [ ] List items selection using arrow keys.  
- [x] Sorted by "Created At" column "oldest to newest" on page load.  
- [x] Click on a list item, fills right side panel and chat section.  
- [x] Right side panel stays on the selected tab when changing project or nugget.
- [ ] Right side panel loads new data when changing list item.  (anywhere except nuggets worked !!)
- [x] Audit logs tab is enabled only in existing nuggets.  
- [x] Red notification indicator on logs icon meaning subscribed nuggets modified.  
- [x] Audit logs sorted from the oldest change to the newest.
- [x] Audit logs columns are: Event, Old, New, User, Date  
- [x] Attachments tab is disabled in any new entity.
- [x] Attachments tab is available on editing projects or nuggets.  
- [ ] Search on attachments available.  
- [x] Add an attachment with "+ Add Attachment" which uploads a file.  
- [x] "Change Attachment" appears to change the added file.  
- [x] The file removed by select nothing after "Change Attachment" clicked.  
- [ ] Attachment file size and extension check.  
- [x] Stay on Add Attachment box while changing nuggets or projects.  
- {x] Attachment has description.  
- [x] "Save" button does not appear until a file upload done.  
- [x] Adding a file caption only does not enable "Save" button.  
- [x] Delete attachment by creator.  
- [x] Viewing attachments on a frame showing file and creator and creation date &
time.  
- [x] Links tab is disabled in any new entity.  
- [x] Chat is enabled on projects and nuggets.  
- [x] Send chat message with `Enter` key and arrow icon.  
- [x] Markdown support in chat.  
- [x] Mention with `@` in chat.  
- [x] Search users to mention after inserting `@` in chat.  
- [ ] Immediately showing the sent message in chat.  
- [ ] Sender name on a sent message.  
- [x] "replies  to" quoted message if required on sent message.  
- [x] Read check-marks of a sent message.  
- [x] Date and time of a sent message.  
- [x] Edit a message by sender.  
- [x] Edit label for edited messages. 
- [ ] Edit a message attachment or remove it.  
- [x] Editing mode banner on top of input box.  
- [ ] Cancel edit with `Esc` key or close icon.  
- [x] Replies to an edited message showing edited message quoted.  
- [x] Reply to a deleted message is not available.  
- [ ] Click on quoted message, jumps to that message.  
- [x] Delete a message by sender.  
- [x] Delete confirm with alert.  
- [ ] Delete confirm alert focus to accept keyboard key-press.  
- [x] Show "This message is deleted" with date, time, read check-marks without sender 
name for a deleted message.  
- [x] Replies to a deleted message showing "This message is deleted" quoted.  
- [x] Unread messages horizontal white line indication.  
- [x] Unread jump circle button having unread messages count.  
- [ ] Attachments files size and extensions check on chats.  
- [ ] Multi-file attachments on chats.  
- [x] Status (required for new projects): Accepts from options only.  
- [x] Status for projects options: Queued, Active, On Hold, Done  
- [x] Workflow (required for projects): Accepts from options only.  
- [x] Workflow options: Default  
- [x] Group (required for projects): Accepts from options only.  
- [x] Group options: Public  
- [x] Launch (required for projects): Accepts from options only.  
- [x] Launch is filled on page load with current selected release.  
- [x] Launch options are all releases.  
- [x] "Leave new project view?" alert appears when a new project form is losing 
focus.  
- [x] "Save changes?" alert appears when an existing projects form is losing focus.  
- [x] "New Project" appears when an existing unchanged project selected.  
- [x] Project list columns are: Name, Group, Pace, Status, Launch, Member, Target, 
  Created At  
- [ ] Filter projects list by: Pace, Status.  
- [x] Enables Nugget icon on the left sidebar by selecting a project.  
- [x] Double-click on a project opens its nuggets at 
`http://nightly.maestro.carrene.com/releases/5/projects/20/nuggets`  
- [x] Status for nuggets options: To Do, In Progress, On Hold, Done, Complete  
- [x] Priority (required for nuggets): Accepts from options only.  
- [x] Priority options: Low, Normal, High  
- [x] Tags (required for nuggets): Accepts from drop-down list only.  
- [x] Search on tags.  
- [x] Multiple tag selection.  
- [x] Highlight selected tags.  
- [x] Prevent adding a tag several times.  
- [x] Delete a tag.  
- [x] Prevent adding a non-existent tag. Returns: "Sorry, no matching options".  
- [ ] Target (required for nuggets): Refuse incorrect dates.  
- [x] Target calendar widget functionality.  
- [x] Type (required for nuggets): Accepts from options only.  
- [x] Types are: Bug, Feature  
- [x] Phase (required, on editing a nugget): Accepts from options only.  
- [x] Phase options are: Backlog, Triage (default), Design, Development, Test  
- [x] Resource (on editing a nugget): Accepts from options only.  
- [ ] Resource accepts empty value.  (fills random !!)
- [x] Search on resources.  
- [x] Multiple resource selection.  
- [x] Highlight selected resources.  
- [x] Prevent adding a resource several times.  
- [x] Delete a resource.  
- [ ] Prevent adding a non-existent resource. Returns: "No resources".  (but accepts non-existent resources !!)
- [x] "Are you sure leave the new nugget?" alert appears when a new nugget form is 
losing focus.  
- [x] "Are you sure leave the update nugget?" alert appears when an existing nugget 
form is losing focus.  
- [x] "New Nugget" appears when an existing unchanged nugget selected.  
- [x] Nugget list columns are: ID, Subscribe, Name, Pace, Status, Priority, Type, 
Phase, Tags, Days, Target, Created At  
- [ ] Filter nuggets list by: Subscribe, Pace, Status, Priority, Type, Phase, Tags  
- [x] List of subscribed modified nuggets at "Unread" part.  
- [x] Red notification indicator when nugget change recorded.  
- [ ] Chat mentions will be counts as notifications.  

