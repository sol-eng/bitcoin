# Bitcoin Demo

These files demonstrate how to use R in a production environment.

[![](bitcoin-demo.png)](http://colorado.rstudio.com:3939/bitcoin/README.html)

### Files

1. [ETL](https://colorado.rstudio.com/rsc/bitcoin-etl/) [[login]](https://colorado.rstudio.com/rsc/connect/#/apps/889/access/904). Extract, transform, and load bitcoin data from a web API into the PostgreSQL database.
2. [App](https://colorado.rstudio.com/rsc/bitcoin-app/) [[login]](https://colorado.rstudio.com/rsc/connect/#/apps/1908/access). Build a Shiny app that depends on the database.
3. [Website](https://colorado.rstudio.com/rsc/website/) [[login]](https://colorado.rstudio.com/rsc/connect/#/apps/904/access). Embed the Shiny app into a website.
4. [Report](https://colorado.rstudio.com/rsc/bitcoin-report/) [[login]](https://colorado.rstudio.com/rsc/connect/#/apps/1909/access/2073). Render and email custom reports on demand and on a schedule.
5. [API](https://colorado.rstudio.com/rsc/bitcoin-api/) [[login]](https://colorado.rstudio.com/rsc/connect/#/apps/1279/access). Create an API for other systems to call.

### Content generated

1. [Shiny](http://shiny.rstudio.com/). Host a shiny app that can scale to thousands of end users.
2. [Parameterized R Markdown](https://rmarkdown.rstudio.com/). Create a report that can handle end user inputs.
3. [Plumber API](https://www.rplumber.io/). Host a scalable API with multiple endpoints and serializers.

### Integration points

1. Web server. Embed Shiny applications with an iframe tag.
2. Email. Send reports via email.
3. API call. Call a REST API from the browser.

