# Heroku Node JS Deployment
- Make sure you use process.env.PORT
```
const PORT = process.env.PORT || 5000;
``` 
- Make sure that you have your start script as node in *package.json*.
```
...
  "scripts": {
    "start": "node index",
    "dev": "nodemon index"
  },
...
```
- Make sure you have the Heroku client installed. You can check with the following command.
```
heroku --version
```
- Stop your server.
- Login to Heroku through the terminal.
```
heroku login
```
- Create a *.gitignore* file in the root of the project.
```
node_modules
```
- Initialize the git repository
```
git init
git add .
git commit -m "initial commit"
```
- Create the Heroku app.
```
heroku create
```
- Go the your Heroku dashboard [https://dashboard.heroku.com/apps](https://dashboard.heroku.com/apps).
  - Click on the newly created app.
  - Click **Deploy** in the top tool bar.
  - Look for the "Create a new Git repository" section and grab the line after "git init" and run it in your terminal to add it as a remote repository and then push to heroku master.
```
heroku git:remote -a <app_name>
git push heroku master
```
- After it deploys enter **heroku** open to go to the app in your browser.
```
heroku open
```

