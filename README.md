## Installation

```
npm install
```

## Auto login a scratch org on a browser

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
