const puppeteer = require("puppeteer");

const username = process.argv[2];
const password = process.argv[3];
const url = process.argv[4];

const login = async (browser, url, username, password) => {
	const page = (await browser.pages())[0];
	await page.goto(url, { waitUntil: "networkidle2" });
	await page.waitFor("input[name=username]");
	await page.focus("#username");
	await page.keyboard.type(username);
	await page.focus("#password");
	await page.keyboard.type(password);

	await page.click("#Login");
	await page.waitForNavigation();
};

(async () => {
	const browser = await puppeteer.launch({
		headless: false,
		args: ["--start-maximized"],
		defaultViewport: null,
	});

	await login(browser, url, username, password);
})();
