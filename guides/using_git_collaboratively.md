# Using Git collaboratively

If you haven't already read [Introduction to Git](./introduction_to_git.md) before reading this guide. That guide covers a lot of important aspects of using Git Collaboratively, including:

* [Accessing a Git Repository, creating a branch, adding a new file, and uploading your changes to GitHub](introduction_to_git.md#exercises-1---6-accessing-a-git-repository-creating-a-branch-adding-a-new-file-uploading-your-changes-to-github),
* [How to submit a pull request](introduction_to_git.md#how-to-submit-a-pull-request); and,
* [How to accept a pull request](introduction_to_git.md#how-to-accept-a-pull-request).

However, the important steps are quickly summarised below if you need a quick refresher on the a complete workflow:

### Cloning a Repository

* **If using a desktop based editor (e.g. VSCode)**:
  * **In GitHub** navigate to the repository you wish to clone, and click on the green `Code` button. Make a note of the relevant clone url for the repository on the local tab.
  * **In the command prompt**, type ```git clone <repository's clone url>```
* **If using a Codespace**, the "Your Workspace" option on the left hand side:
  * *In GitHub** navigate to the repository you wish to clone, and click on the green Code button. On the Codespace tab, click the green `Create Codespace on Main` if visable or the small plus, `+`, button. This will automatically create a development space with the repository cloned to.
* Complete any necessary authentication steps as required.

### Creating a new branch and commiting changes

* **In GitHub**, click on the "main" button underneath your repository's title and type in the branch's new name and hit Enter.
* **In the command prompt**, navigate to your repository folder, using `cd <folder_name>`
  * `git pull`
  * `git branch -a` to see all the available branches, including the one you just created
  * `git checkout <branch name>`

### Committing your changes

* **In your editor** Make your code changes
  * Save the changes
* **In the command prompt**, `git status` to check which files you've altered
  * `git add.` if you're happy to add all the changed files, or `git add <file_name>` if you just want one file.
  * `git commit -m "comment on what you've changed"`
  * `git push`

### Submitting a Pull Request

* **In GitHub**, navigate to your repository:
  * Select Pull Requests on the top bar menu.
  * Select either New Pull Request or Compare & Pull Request (if you recently pushed new changes to the branch)
  * Choose the branch you want to merge and the target branch (usually main)
  * Write a title and description which will be helpful to the reviewer.
  * Assign yourself as a assingee and someone else in your team as a reviewer.
  * Click the "Create Pull Request".
  * Review code changes with the reviewer, and ask the reviewer to accept the Pull request.
* **In the command prompt**, `git checkout main`, `git pull` to get the latest code.
  * delete the branch locally, with `git branch -D <branch_name>`
  * `git branch -a` to check that your branch has been deleted.
  * `git checkout main`, then `git pull`, then open the code in Spyder to check that your changes are in the main.

## Resolving merge conflicts

How to update your branch to the latest version of the main branch, managing conflicts, merge request conflicts and review.

### How to resolve merge conflicts using git - if they occur

Follow the same steps as above, up to the point of raising the merge request.
Before raising a merge request, you should see if there are likely to be any conflicts between the changes you've made and changes another developer might mave made to the same files.

* **In the command prompt**, navigate to your repository folder, using `cd <folder_name>` if you are not already there.
* `git checkout main`
* `git pull` to get the latest version of the main.
* `git checkout <branch_name>` if you do not already have it checked out.
* `git merge main`

This will attempt to automatically merge the latest version of the main into your branch. If no-one else has changed the same lines of code as you, this will be fine and you can continue to raising a merge request as above.
If not, you will get an error: `Automatic merge failed`, `Merge conflict in <file name>` and `CONFLICT` messages will appear on the terminal:

```git
Auto-merging practice/temperatures_function.py
CONFLICT (content): Merge Conflict in practice/temperatures_function.py
Automatic merge failed; fix conflicts and then commit the result.
```

Different editors give us different tools for handling these merge conflicts, though the principles remain the same.

### Text Editor

**In your IDE or editor of choice**, open that file with the conflict (in this case temperatures_function.py).

Scroll in the document to find the conflict. You will notice these strange lines where conflict has occurred:

```git
<<<<<< HEAD
This line is the line in my branch.
=======
This line is the line in main.
>>>>>> main
```

The top bit above the double line is what we have in our branch (our branch is represented by the `<<<<<<< HEAD` statement). The bottom bit is the same line but it's saved in the main branch (symbolised as `>>>>>>> main`).

To resolve the conflict, delete the line which you do not wish to keep, including the arrows and double lines. So for example, if you wish to keep `This line is the line in my branch` delete everything that's connected to the conflict so that it also shows this in your text editor:

```text
This line is the line in my branch.
```

### VSCode

>_**Note**_: _Visual Studio Code has introduced a new method of resolving conflicts, the three-way Merge Editor. There are instructions below on how to use the Merge Editor. To check which >instructions you need to use, check if Settings > Git > Merge Editor is enabled or disable. If enabled, read the [Merge Editor](#merge-editor) instructions. Otherwise continue reading >the instructions below._

**In Visual Studio Code**, you can open your file browser in the tools tab. Any files which have a merge conflict will have a little 'C' next to them here. Open the files which have these conflicts (in this case temperatures_function.py).

Scroll in the document to find the conflict. You will notice these strange lines where conflict has occured:

```text
<<<<<< HEAD
This line is the line in my branch.
=======
This line is the line in main.
>>>>>> main
```

The top bit above the double line is what we have in our branch (our branch is represented by the `<<<<<<< HEAD` statement). This will be called the _current change_. The bottom bit is the same line but it's saved in the main branch (symbolised as `>>>>>>> main`). This will be called the _incoming change_.

Above the conflict, you'll see some options for what you can do. You can click `accept current changes`, `accept incoming changes`, or `accept both changes`. Picking one of these options will resolve the conflict.

Alternatively, you can go ahead and simply edit the conflicted file directly. Edit the area of conflict until you're satisfied -- making sure to remove the `===` line, the `>>>>>` line, and any duplicated code.

So for example, if you wish to keep `This line is the line in my branch` delete everything that's connected to the conflict so that it also shows this in your text editor:
When your're done, simply save the file.

```text
This line is the line in my branch.
```

#### **Merge Editor**

Like before with VS Code, you can open your file browser in the tools tab and find any files which have a merge conflict with a little 'C' next to them here. Open the files which have these conflicts (in this case temperatures_function.py).

Scroll in any of the three views to find the highlighted conflict. In the top two _Theirs_ (incoming) and _Yours_ (current) views, checkboxes are available to accept and combine changes in the incoming and current branches.

The _Results_ view can be edited directly, with the other views updating accordingly.

Once complete, close the editor or click the _Accept Merge_ button in the bottom right corner. If not all conflicts have been addressed a warning will show.

### Once the Conflict is Resolved

* Save your changes, and then update your branch in the usual way:

```git
git status
git add .
git status
git commit -m "your message here"
git status
git push
```

* **In GitHub** create a merge request and get it approved.

## Git branching

### Branch naming strategy

Following an agreed naming convention will make it much easier to keep the team's work organised. We use this approach:

    <project_id>_<initials>_<ticket_number>_<brief-description>

Here the project_id refers to our project ID in confluence (DS218). The initials are from my name. The ticket number refers to the jira ticket number.
E.g.:

    DS218_CQ_167_Add-field-definitions

Naming branches in this way helps to make it very clear what change should be happening in the branch. Sometimes code review will reveal that a branch that was intended to make one specific change in fact makes several changes. This should be avoided and the code review should reject the additional changes.

### General guidelines for branching and pull requests

* The main branch should be kept in a good stable state (always deployable with a relevant README file).
* Developers create feature branches from the main branch (main trunk) and work on them.
* The developer only creates a short-lived feature branch (a branch from the trunk) to prevent the challenge of merging later on. Once they are done, they create pull requests in GitHub.
* The request get reviews by a team member or a group of developers (if it is a refactor or large changes). The comment on changes stay directly on the GitHub page and there may have discussions.
* Once these are done with compiling and all testing, the merge will be incorporated into the trunk by the reviewer.

![](/images/git_branching.png)

## Using git collaboratively exercise

### Exercise

This exercise is designed for a pair.

Independently, do the following:

* **In GitHub**, create a new branch from the main branch.
* **In the command prompt**, checkout your new branch (`git branch -a`, `git checkout <branch_name>`, `git pull`)
* Make your code changes to the same parts of a file as the other, for example to [example_r_script.r](../practice_scripts/example_r_script.r), line 9:
  * **_Team member A_**: `myString <- "Hi, I'm using version control! Hope I don't cause a conflict"`
  * **_Team member B_**: `myString <- "Hi, I'm using version control! I am going to cause a conflict!"`
* Commit your changes (`git status`, `git add.`, `git commit -m "comment"`, `git push`)
* **In GitHub**, **_Team member A_** create a new pull request. Assign a reviewer ( **_team member B_**) and accept the merge.
  _Approving pull requests requires someone with the relevant assigned role and permissions._

* **In the command prompt**, **_Team member B_** checkout the main and attempt to merge it into your branch. (`git checkout main`, `git pull`, `git checkout <branch_name>`, `git merge main`)
* **In your editor** open the file where there are any conflicts and decide with **_team member A_** how the conflicts should be resolved.
* Save your changes
* **In the command prompt**, update your branch in the usual way. (`git status`, `git add.`, `git status`, `git commit -m "comment"`, `git status`, `git push`)
* **In GitHub**, **_Team member B_** create a new pull request. Assign a reviewer ( **_team member A_**) and accept the merge.

## Top tips for git

* **Branches should be short-lived!!**
* Make clean, single-purpose commits
* Test Before You Commit
* Write meaningful commit messages
* Don’t git push straight to main
* Commit early, commit often
* Don’t alter published history
* Don’t commit generated files
