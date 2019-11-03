Checkout Git repo:
https://github.com/garethgreenaway/salt-scheduler-tutorial

cd salt-scheduler-tutorial

vagrant up

vagrant ssh

All Salt services are stopped and disabled, we want to run them manually so we can see the actions being logged.  If comfortable start tmux otherwise create multiple ssh connections using vagrant ssh.

As root, using sudo, start the salt-master, the salt-minion, and the salt-event runner in different windows or tmux sessions:

	sudo salt-master -l debug
	sudo salt-minion -l debug
	sudo salt-run state.event pretty=True

The minion will attempt to connect to the master and wait until it’s key has been signed.  Switching to another window or tmux session, run the following to see pending key requests:

	sudo salt-key -L


You should see a key for the minion named salt in the “Unaccepted keys” section.  Let’s accept that key.  Run the following:

	sudo salt-key -yA

To accept the key for the minion.  Running “sudo salt-key -L” again and you’ll see the minion is now listed in the “Accepted Keys” section.

Let’s verify that we can run commands against our minion.  Running the following should return a simple “True” response from our single minion:

	sudo salt \* test.ping

And running the following should return the version of Salt that our minion is running:

	sudo salt \* test.version
