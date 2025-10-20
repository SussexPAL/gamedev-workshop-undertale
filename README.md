# Gamedev Workshop - Undertale
A simple version of Undertale made in Godot for the PAL gamedev workshop.

The main branch is intended as a model project for tutors and students to reference as needed. The goal is to include plenty of comments and other resources for learning inside of it.

There are also branches for each term, containing weekly commits for students to use as catchup material.

# Installation - Students
We will push weekly changes from the workshop for you to download if you've missed a workshop or accidentally broken your project. There are a few options for installation.

## Clone the project from the terminal: (Recommended)
Cloning the project from the terminal will give you experience with Git, which will be useful for every project you make going forward. Take the following steps:
	- Install Git your machine
	- Create/locate a folder to store your godot projects
	- Open this folder in a terminal and run the command `git clone https://github.com/SussexPAL/gamedev-workshop-undertale.git`
	
This will download the repo to your machine. You can now open the project:
	- Open Godot
	- Click "import project"
	- Select the folder that was created by your previous commands. It should look something like `gamedev-workshop-undertale`.
	- Keep default settings and open the project

You are now free to edit the project as you please - this is a local copy unique to your machine, so don't be afraid to break things. 

By default, the cloned repo will be set to the `main` branch, which contains the model project. If you wish to see the current weekly version from the workshops:
	- Type `git branch` to see a list of branches
	- Locate the branch for the current term (eg. `autumn2025`)
	- Type `git switch BRANCH_NAME` (eg. `git switch autumn2025`)
	- If Godot is already open, you will get a warning popup. Click "reload changes from disk"

...and you're done! You should see the current weekly version of the workshop project. If you miss another week or simply want to update/revert to the most recent version:
	- Open a terminal in the project directory (as before)
	- Type `git pull`
