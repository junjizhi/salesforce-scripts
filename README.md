## Diff two SObjects

Compare each field of the SObjects and show the differences (with the option to print all fields).

Usage:

```
diff-sobjects.sh <Opportunity|Contact|Account|...> <id1> <id2> [--show-all]
```

Example:

```bash
$ ../salesforce-scripts/diff-sobjects.sh Opportunity opp-id1 opp-id2
id:                                 opp-id1 <> opp-id2
name:                               opp name1 <> opp name2
createddate:                        2020-07-03 15:44:17 <> 2020-07-03 15:46:53
lastmodifieddate:                   2020-07-03 15:44:19 <> 2020-07-03 15:46:53
systemmodstamp:                     2020-07-03 15:44:19 <> 2020-07-03 15:46:53
lastvieweddate:                     2020-07-03 15:47:49 <> 2020-07-03 15:48:01
lastreferenceddate:                 2020-07-03 15:47:49 <> 2020-07-03 15:48:01
```

## Auto login a scratch org on a browser

This script does the same thing as `sfdx force:org:open`, but it is a good basis to build more automation on top.

# ## Installation

```
npm install
```

If you need to create many scratch orgs, this script saves you effort to copy/paste the url / username / password to the browser.

### What it does

The script extracts the username and password from your scratch org and automatically log in on a Chromium browser.

The script is based on [Puppeteer](https://github.com/puppeteer/puppeteer).

### How to run

```
$ export SALESFORCE_REPO=/path/to/salesforce-repo
$ ./login-scratch-org.sh
```

**Demo**
![sf-auto-login-demo](https://user-images.githubusercontent.com/2715151/85582315-55e22180-b60b-11ea-859c-0e70a8eefaa2.gif)
