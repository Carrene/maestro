# Maestro features checklist

## Sign up page

* Real-time validation on form fields.
* Direct Login after sign up.

## Settings

* The Name is editable.
* The Picture could be changed but **cannot be removed**.
* Repeat new password real-time validation.

## Launches

### A new release or edit a release (Right panel):

* Name (required): Validation (length and duplicate existence check).
* Cutoff (required):
  - Should not accept incorrect dates.
  - Calendar widget functionality.
  - Derived from underlying fields.
* Description (optional): (can’t fill it all with space/enter) and the
    character counter should show a correct number.
* Form fields could get focus by clicking on the field's name or value bar
    (text, select options, ...).
* **Leave new release view?** or **Save changes?** alert: 
  - Appears when form losing focus.
  - Should prevent page to reload or load another URL.
  - The alert buttons should have focus in order to accept keyboard key-press.
  - Should not appear when no change made or changes reverted on fields.
* Top bar:
  - **Save** button appears after a change in form and revert to the previous
      state when changes reverted.
  - **New Release** appears when an existing release selected which is not
      changed.
* Other tabs including logs, attachments, and links on the right side panel are
    disabled.

### Chat section:

* Chat section is disabled.

### Releases list:

* List columns:
  - Name
  - Target
  - Created At
  - Cutoff
* The list can be sorted by each column and also reverse sort is available.
* The list items **cannot** be selected using arrow keys.
* The list is sorted by **Created At** column **oldest to newest** on page
    load.
* Click on a release row, fills right side panel in order to edit or view.
* Double-click on a release row opens the selected release projects at 
    `http://nightly.maestro.carrene.com/releases/5/projects`

## Projects

### A new project or edit a project (Right panel):

* Name (required): Validation (length and duplicate existence check).
* Status (required): Should not accept incorrect inputs. (Values only in select
    options are valid). Status options are:
  - Queued
  - Active
  - On Hold
  - Done
* Workflow (required): Should not accept incorrect inputs. (Values only in
    select options are valid).
  - Workflow contains only **Default**.
  - Workflow is **not available** when editing an **existing** project.
* Group (required): Should not accept incorrect inputs. (Values only in select
    options are valid). Group contains only **Public**. 
* Launch (required): 
  - Should not accept incorrect inputs. (Values only in select options are
    valid).
  - Launch is **filled** on page load when release selected. 
  - Launch contains all releases which added on launches.
* Description (optional): (can’t fill it all with space/enter) and the
    character counter should show a correct number.
* Form fields could get focus by clicking on the field's name or value bar (text, 
select options, ...).
* **Leave new project view?** or **Save changes?** alert: 
  - Appears when form losing focus.
  - Should prevent page to reload or load another URL.
  - The alert buttons should have focus in order to accept keyboard key-press.
  - Should not appear when no change made or changes reverted on fields.
* Top bar:
  - **Save** button appears after a change in form or attachments and revert to
      the previous state when changes reverted.
  - **New Project** appears when an existing project selected which is not
      changed.
* Other tabs including logs, attachments, and links on the right side panel are:
    - Disabled at **new** projects.
    - Attachments are available on **existing** projects.
    - Go to [Attachment features](#Attachment-features) to view detailed
        features.

### Chat section:

* Chat section is:
  - Disabled at a **new** project.
  - Available on **existing** project selection.
  - Go to [Chat features](#Chat-features) to view detailed features.

### Projects list:

* List columns are:
  - Name
  - Group
  - Pace
  - Status
  - Launch
  - Member
  - Target
  - Created At
* The list can be filtered by **Pace** and **Status**, available with buttons
    under the purple top bar.
* The list can be sorted by each column and also reverse sort is available.
* The list is sorted by **Created At** column **oldest to newest** on page
    load.
* The List items **cannot** be selected using arrow keys.
* Click on a project row, enables Nugget icon on the left sidebar.
* Click on a project row, fills right side panel and chat section in order to
    edit or view.
* Right side panel should stay on the selected tab when selected project
    changes.
* Double-click on a project row opens the selected project nuggets at 
    `http://nightly.maestro.carrene.com/releases/5/projects/20/nuggets`

## Nuggets

### A new nugget or edit a nugget (Right panel):

* Name (required): Validation (length and duplicate existence check).
* Status (required): Should not accept incorrect inputs. (Values only in select
    options are valid). Status options are:
  - To Do
  - In Progress
  - On Hold
  - Done
  - Complete
* Priority (required): Should not accept incorrect inputs. (Values only in
    select options are valid). Priority options are:
  - Low
  - Normal
  - High
* Tags (required): 
  - Should not accept incorrect inputs. (Values only in select options are
    valid).
  - Search on tags is available. 
  - Multiple tag selection is available.
  - selected tags will be highlighted.
  - Adding a tag several times is not allowed.
  - Delete a tag is available.
  - Adding a non-existent tag is not allowed. Returns: `Sorry, no matching
      options.`
* Target (required): 
  - Should not accept incorrect dates.
  - Calendar widget functionality.
* Type (required): Should not accept incorrect inputs. (Values only in select
    options are valid). Types are:
   - Bug
   - Feature
* Phase (required, editing existing nugget): Should not accept incorrect
    inputs. (Values only in select options are valid). Phase options are:
  - Backlog
  - Triage (default phase on nugget creation)
  - Design
  - Development
  - Test
* Resource (editing existing nugget):
  - Could be assigned to no one.
  - Should not accept incorrect inputs. (Values only in select options are
    valid).
  - Search on resources is available. 
  - Multiple resource selection is available.
  - selected resources will be highlighted.
  - Adding a resource several times is not allowed.
  - Delete a resource is available.
  - Adding a non-existent tag is not allowed. Returns: `No resources`
  - Resources should be assigned to related phases. Not everyone can be
      assigned to every phase.
* Description (optional): (can’t fill it all with space/enter) and the
    character counter should show a correct number.
* Form fields could get focus by clicking on the field's name or value bar (text, 
select options, ...).
* **Are you sure leave the new nugget?** or **Are you sure leave the update
    nugget?** alert: 
  - Appears when form losing focus.
  - Should prevent page to reload or load another URL.
  - The alert buttons should have focus in order to accept keyboard key-press.
  - Should not appear when no change made or changes reverted on fields.
* Top bar:
  - **Save** button appears after a change in form or attachments and revert to
      the previous state when changes reverted.
  - **New Nugget** appears when an existing nugget selected which is not
      changed.
* Other tabs including logs, attachments, and links on the right side panel
    are:
    - Disabled at **new** nuggets.
    - Audit log available on **existing** nuggets.
    - Go to [Audit logs features](#Audit-logs-features) to view detailed
        features.
    - Attachments are available on **existing** nuggets.
    - Go to [Attachment features](#Attachment-features) to view detailed
        features.

### Chat section:

* Chat section is:
  - Disabled at **new** nuggets.
  - Available on **existing** nugget selection.
  - Go to [Chat features](#Chat-features) to view detailed features.

### Nuggets list:

* List columns are:
  - ID
  - Subscribe
  - Name
  - Pace
  - Status
  - Priority
  - Type
  - Phase
  - Tags
  - Days
  - Target
  - Created At
* The list can be filtered by **Subscribe**, **Pace**, **Status**, 
    **Priority**, **Type**, **Phase** and **Tags**, available with buttons
    under the purple top bar.
* The list can be sorted by each column and also reverse sort is available.
* The list is sorted by **Created At** column **oldest to newest** on page
    load.
* The List items **cannot** be selected using arrow keys.
* Click on a nugget row, fills right side panel and chat section in order to
    edit or view.
* Right side panel should stay on the selected tab when selected project
    changes.

## Unread

* This part is a list of subscribed and also modified nuggets.
* The page layout is the same as the nuggets Part.
* The red notification indicator will appear if new nugget change recorded.
* Also, chat mentions will be counts as notifications.


## Chat features

* Sending message:
  - Send with `Return` key and arrow icon
  - Markdown support
  - Mention with `@` and search users to mention
  - Immediately showing the sent message
* Messages box:
  - Sender at top of the box
  - **replied to** quoted message if required
  - Message contents
  - Edit option available on ... top right corner.
  - Read check-marks on the bottom right corner
  - Date and time left to read checkmark
  - If a message deleted, it will show `This message is deleted` without any
      sender name, but with date and time and read check-marks.
  - Unread messages indication (A horizontal line indicating unread message
      point until next messages).
* Attachments:
  - Pictures and other files size and extensions check
  - ~~Multi-file attachments available~~
* Delete:
  - Replies to a deleted message should show deleted message quoted.
  - The sender can only delete his/her own message, nobody else.
  - Delete confirm with alert ~~and has focus and accept keyboard keys~~.
* Edit:
  - Edit a message text
  - Edit attachments (Remove or change file/image)
  - Replies to an edited message should show edited message quoted.
  - The sender can only edit his/her own message, nobody else.
  - A box on top of the input box which is showing editing status with a pen icon
  - This box can be escaped with `X` icon ~~or `Esc` key on the keyboard~~.
* Reply:
  - Reply to a deleted message is not available.
  - Mentions with `@` are also available on reply.
  - ~~Click on quoted message, jumps to that message.~~

## Attachment features

* ~~Search on attachments.~~
* The user can add an attachment:
  - Description: (Maybe mentions and markdown support).
  - **+ Add Attachment** button to upload a file.
  - **Change Attachment** button to change the existing file. This will
      **clear** added attachment if no file selected.
  - Attachment file size and file extension should check.
  - Opened purple box to add a new attachment, stay open while switching
      between projects.
  - Top bar **Save** button does not appear until a file upload done.
      (Adding a file caption only does not enable **Save** button)
* The user can delete attachment which added by him/her.
* The user can view attachments on a frame showing file and creator and creation
    date & time.

## Audit logs features

* Red notification indicator on subscribed nuggets if a new log is recorded.
* Log records date order should be sorted from the latest changes (at the top)
    to earlier changes (at the bottom).
* Log columns are:
  - Event
  - Old
  - New
  - User
  - Date
