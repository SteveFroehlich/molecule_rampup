## Exercise 2 Web App
Now that we can test our role, lets update the role to have it do 
something a little more interesting. Lets deploy and start a [Flask](https://www.fullstackpython.com/flask.html)
web app. To do that we need to update the role under test `test_role`
to have the logic to deploy flask. I encourage the reader to try to
follow the steps [here](https://flask.palletsprojects.com/en/1.1.x/installation/)
and update the role to do it.
Once that is done we need to update the verify.yml to add new tests to make sure
the role did what is was suppose to. So let do that.

By default Flask will start on port 5000 so a good way to test our app is up is
to verify an HTTP request to that port succeeds. Again I encourage the reader
to try before they take the solution [here](exercise2_solution.md).
