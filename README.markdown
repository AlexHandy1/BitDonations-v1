Summary
=================

* Facilitating transactions between the developed and the developing world remains arduous and incredibly expensive

* Through working for a VC and helping set-up an entrepreneurship charity (The African Innovation Prize) in Rwanda I have personally experienced (and paid for) this market inefficiency

* Crytocurrencies like Bitcoin offer a way to overcome these barriers and deliver very low cost, incredibly fast and secure transactions through an internet connection

* A personal area of interest has been in exploring Bitcoin technology to facilitate direct P2P donations between donors and young entrepreneurs - think Kiva for micro-donations but with Bitcoin

* As a first step towards building an MVP of this concept, I developed a simple web platform (see BitDonations) which utilises the Blockchain.info API to dynamically create Bitcoin wallets and facilitate donations between two parties.

* The actual MVP would focus on developing a mobile-first application given levels of mobile penetration vs traditional desktop connections in E. Africa and improved usability

* I decided to utilise the Blockchain.info API to provide the infrastructure for wallet creation and processing transactions due to ease of implementation and acceptance testing (e.g. one static Bitcoin address) - for a more detailed explanation please refer to my StackExchange post [Bitcoin Stack Exchange Post](http://bitcoin.stackexchange.com/questions/37716/setting-up-a-basic-test-transaction-for-p2p-donation-web-app-api-recommendatio)

[BitDonations - Basic Prototype](https://peaceful-sea-2336.herokuapp.com/)

Prototype Use Cases:
-------

```
- [x] As a donor,
      So that I can decide who I want to give Bitcoin too
      I want to be able to look at a grid of example entrepreneur projects with links to Find out More and Donate on home-page

- [x] As a donor,
      So that I can donate Bitcoin
      I want to be able to sign-up to the website

- [x] As a donor,
      So that I can confirm my account
      I want to receive an email when I sign-up

- [x] As a donor,
      So that no one donates as me
      I want to be able to log-out from the website

- [x] As a donor,
      So that I can complete a transaction
      I want to link my Blockchain.info wallet and submit send requests to input addresses for Entrepreneurs

- [x] As an entrepreneur,
      So that I can receive Bitcoins
      I want to have an automatically generated a Blockchain.info wallet on the website

- [x] As a donor,
      So that I know my transaction has been sent successfully,
      I want to receive a text message from the website

- [x] As an administrator,
      So that I can review transactions, their donors and corresponding entrepreneurs
      I want a database of entries for transactions on the site (with timestamps)

- [x] As an entrepreneur,
      So that I can receive donations in one stable account,
      I want to actively create a Blockchain.info wallet that I can access from website

```

How to run
----

* For web viewing, simply follow the link to the website hosted on heroku
* For local use, clone or fork the repo to your local machine
* Install sinatra and shotgun gems to view on your local host
  * Disclaimer >> this is an work-in-progress prototype but has access to REAL bitcoins and wallets. If you set-up wallets and make transactions that you cannot access afterwards I cannot be held responsible! If you want to try out drop me a message.
* Tests can be run by installing rspec and capybara gems and running rspec from your command line


Technologies used
----

* Production - Ruby, Javascript, jQuery, CSS (using Bootstrap), HTML,  Datamapper, PostgreSQL, Sinatra, Heroku, Bcrypt (for passwords), Blockhain API
* Testing - Rspec, Capybara, Database Cleaner (for test database), Rubocop, Coveralls

Screenshots
----

![Front Page](https://github.com/AlexHandy1/BitDonations-labweek/blob/master/public/img/BitDonations.png)

![Example Project Page](https://github.com/AlexHandy1/BitDonations-labweek/blob/master/public/img/BitDonations-project.png)

![Donation Page](https://github.com/AlexHandy1/BitDonations-labweek/blob/master/public/img/BitDonations-donate.png)

Further Use Cases
----

*  As a donor and an entrepreneur,
   So that I can assess activity on the site
   I want to be able to see a graphical representation of transactions on the site

*  As an entrepreneur,
   So that I can encourage donations,
   I want to have an account so that I can edit my own profile

*  As an entrepreneur,
   So that I can manage my account
   I want to be able to log in and log out

*  As a donor who doesn't already have an account,
   So that I can donate to entrepreneurs
   I want to actively create a Blockchain.info wallet that I can access from website

*  As a donor,
   So that I can independently check my transaction
   I want to have a search bar to look up my Bitcoin transaction and address status

*  As a donor,
   So that I can donate at my convenience,
   I want to be able to integrate my existing wallet provider (e.g. more than just a Blockchain.info based solution)

