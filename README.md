# mysphinx

The scripts will set-up sphinx, read the docs theme and publish it on git-hub pages. To automize the process sphinxhook file is created also. Once you do your own changes you just need to run that script which is located in your /master/.git/hooks folder.

The process is simple.

- Download the folder
- Create a git repository and remember the name and web address of the repository. These values will be asked to you when you run the script.
- Run ./sphinx.sh script and follow the questions with choosing the default options (yes for all).

Then when you go to the https://sbilmis.github.io/name-of-the-repo/ you will see the web page you created.

That is it.

Let me tell how you will modify the documentation.
You sill see the folder name-of-the-repo where you run the sphinx.sh script. Inside that folder you will have gh-pages branch folder and master folder. gf-pages folder is the one that is seen as your web page.

- Go to the master/docs/source folder. Create your .rst files. Run the make github command. You will see that github-pages folder is also modified with the new content.
Then
git add .
git commit -m "second commit"
git push origin gh-pages

and you will see that the web-page is modified.

To make things simpler, instead of writing those commands just run the following
master/.git/hooks/sphinxhook
everytime you change the documentation.








Thanks to the following pages.

- https://rantzen.net/2020/02/tutorial--using-sphinx-clever-with-github-pages/
- https://daler.github.io/sphinxdoc-test/includeme.html
