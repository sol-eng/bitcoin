#' @apiTitle Bitcoin Exchange Rates
#' @apiDescription Historic exchange rates by currency for the most recent 3 days.
#' @apiVersion 1.0.1

library(plumber)
library(DBI)
library(dygraphs)
library(xts)
library(dplyr)
library(dbplyr)
library(DT)

con <- dbConnect(RSQLite::SQLite(), "~/bitcoin.sqlite")
bitcoin <- tbl(con, "bitcoin")

start <- as.numeric(as.POSIXct(as.character(Sys.Date() - 3)))
end <- as.numeric(as.POSIXct(as.character(Sys.Date() + 1)))

currency <- function(code="USD"){
  bitcoin %>%
    filter(name == code) %>%
    filter(timestamp > start & timestamp <= end) %>%
    select(timestamp, last, symbol) %>%
    collect %>%
    mutate(timestamp = as.POSIXct(timestamp, origin = "1970-01-01"))
}

#' @get /data
#' @param code Currency code (USD; JPY; CNY; GBP)
function(code="USD"){
  currency(code)
}

#' @get /table
#' @param code Currency code (USD; JPY; CNY; GBP)
#' @serializer htmlwidget
function(code="USD"){
  currency(code) %>%
    datatable
}

#' @get /plot
#' @param code Currency code (USD; JPY; CNY; GBP)
#' @serializer htmlwidget
function(code="USD"){
  dat <- currency(code)
  tseries <- xts(dat$last, dat$timestamp)
  lab <- paste0("Bitcoin (", dat$symbol[1], ")")
  p <- dygraph(tseries, main = lab) %>%
    dyOptions(axisLineWidth = 1.5, 
              fillGraph = TRUE, 
              drawGrid = FALSE, 
              colors = "steelblue", 
              axisLineColor = "darkgrey", 
              axisLabelFontSize = 15) %>%
    dyRangeSelector(fillColor = "lightsteelblue", strokeColor = "white")
  print(p)
}

# rsconnect::deployAPI("sqlite/", account = "nathan", server = "colorado.rstudio.com", appName = "bitcoin-api-sqlite")
