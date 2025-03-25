a!localVariables(
/* This dashboard displays 6 sections. The following variables can be set */
/* to hide/show each of these sections                                    */
local!showOrderTrendByStatus: true,
local!showOrdersDelivered: true,
local!showOrdersDeliveredYearToDate: true,
local!showNewOrders: true,
local!showOrdersByCustomer: true,
local!showCustomerRankings: true,

/* Filter lists for the various charts. */
/* Priority Filter */
/* Replace this with a query to get a list of priorities */
local!priorityForOrdersByCustomerDataSubset: a!dataSubset(
    data: {
    a!map(priority: "Critical"),
    a!map(priority: "High"),
    a!map(priority: "Medium"),
    a!map(priority: "Low")
    }
),
local!priorityListForOrdersByCustomer: a!forEach(
    items: index(local!priorityForOrdersByCustomerDataSubset.data, "priority"),
    expression: tostring(fv!item)
),

/* Status Filter */
/* Replace this with a query to get a list of statuses */
local!statusForOrdersByCustomerDataSubset: a!dataSubset(
    data: {
    a!map(status: "Open"),
    a!map(status: "Processing"),
    a!map(status: "Delivered")
    }
),
local!statusListForOrdersByCustomer: a!forEach(
    items: index(local!statusForOrdersByCustomerDataSubset.data, "status"),
    expression: tostring(fv!item)
),

/* Determines the tab to be displayed by default between 'Orders Trend by Status' & 'Orders Delivered: Monthly...' *
    * If local!showOrderTrendByStatus=false, then set this variable to 2                                           *
    * If local!showOrdersDelivered=false, then set this variable to 1                                              */
local!orderChartRadioButton: 1,
{
    a!columnsLayout(
    columns: {
        a!columnLayout(
        contents: {
            a!headingField(
            text: upper("Orders Analysis"),
            size: "SMALL",
            fontWeight: "SEMI_BOLD",
            marginBelow: "LESS"
            ),
            a!radioButtonField(
            choiceLabels: {"Order Trend by Status", "Orders Delivered: Monthly Revenue vs Profit"},
            choiceValues: {1, 2},
            value: local!orderChartRadioButton,
            saveInto: local!orderChartRadioButton,
            showWhen: and(local!showOrderTrendByStatus, local!showOrdersDelivered),
            choiceLayout: "COMPACT"
            ),
            a!localVariables(
            /* Filter values for 'Order Trend by Status' */
            local!priorityForOrderTrendByStatus,
            local!statusForOrderTrendByStatus,
            local!startdateForOrderTrendByStatus: date(year(today()), 1, 1), /* Beginning of the year */
            local!endDateForOrderTrendByStatus: today()-1, /* Yesterday, because this chart shows data as of end-of-day */

            /* Order Trend by Status*/
            /* Replace this with a query aggregating by createdOn, and status, and a count of id (id_count) */
            /* and also filter on priority, status, and a date range for createdOn dates */
            /* Use the following filter values respectively:  local!priorityForOrderTrendByStatus, */
            /* local!statusForOrderTrendByStatus, local!startdateForOrderTrendByStatus, local!endDateForOrderTrendByStatus */
            local!orderTrendDataSubset: a!dataSubset(
                data: {
                a!map(createdOn: date(2019,1,1),   status: "Open",        id_count: 30),
                a!map(createdOn: date(2019,1,1),   status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,1),   status: "Delivered",   id_count: 0),
                a!map(createdOn: date(2019,1,2),   status: "Open",        id_count: 32),
                a!map(createdOn: date(2019,1,2),   status: "Processing",  id_count: 37),
                a!map(createdOn: date(2019,1,2),   status: "Delivered",   id_count: 10),
                a!map(createdOn: date(2019,1,3),   status: "Open",        id_count: 28),
                a!map(createdOn: date(2019,1,3),   status: "Processing",  id_count: 30),
                a!map(createdOn: date(2019,1,3),   status: "Delivered",   id_count: 18),
                a!map(createdOn: date(2019,1,4),   status: "Open",        id_count: 20),
                a!map(createdOn: date(2019,1,4),   status: "Processing",  id_count: 26),
                a!map(createdOn: date(2019,1,4),   status: "Delivered",   id_count: 22),
                a!map(createdOn: date(2019,1,5),   status: "Open",        id_count: 23),
                a!map(createdOn: date(2019,1,5),   status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,5),   status: "Delivered",   id_count: 30),
                a!map(createdOn: date(2019,1,6),   status: "Open",        id_count: 30),
                a!map(createdOn: date(2019,1,6),   status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,6),   status: "Delivered",   id_count: 1),
                a!map(createdOn: date(2019,1,7),   status: "Open",        id_count: 32),
                a!map(createdOn: date(2019,1,7),   status: "Processing",  id_count: 37),
                a!map(createdOn: date(2019,1,7),   status: "Delivered",   id_count: 10),
                a!map(createdOn: date(2019,1,8),   status: "Open",        id_count: 28),
                a!map(createdOn: date(2019,1,8),   status: "Processing",  id_count: 30),
                a!map(createdOn: date(2019,1,8),   status: "Delivered",   id_count: 18),
                a!map(createdOn: date(2019,1,9),   status: "Open",        id_count: 20),
                a!map(createdOn: date(2019,1,9),   status: "Processing",  id_count: 26),
                a!map(createdOn: date(2019,1,9),   status: "Delivered",   id_count: 22),
                a!map(createdOn: date(2019,1,10),  status: "Open",        id_count: 23),
                a!map(createdOn: date(2019,1,10),  status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,10),  status: "Delivered",   id_count: 30),
                a!map(createdOn: date(2019,1,11),  status: "Open",        id_count: 30),
                a!map(createdOn: date(2019,1,11),  status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,11),  status: "Delivered",   id_count: 12),
                a!map(createdOn: date(2019,1,12),  status: "Open",        id_count: 32),
                a!map(createdOn: date(2019,1,12),  status: "Processing",  id_count: 37),
                a!map(createdOn: date(2019,1,12),  status: "Delivered",   id_count: 10),
                a!map(createdOn: date(2019,1,13),  status: "Open",        id_count: 28),
                a!map(createdOn: date(2019,1,13),  status: "Processing",  id_count: 30),
                a!map(createdOn: date(2019,1,13),  status: "Delivered",   id_count: 18),
                a!map(createdOn: date(2019,1,14),  status: "Open",        id_count: 20),
                a!map(createdOn: date(2019,1,14),  status: "Processing",  id_count: 26),
                a!map(createdOn: date(2019,1,14),  status: "Delivered",   id_count: 22),
                a!map(createdOn: date(2019,1,15),  status: "Open",        id_count: 23),
                a!map(createdOn: date(2019,1,15),  status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,15),  status: "Delivered",   id_count: 30),
                a!map(createdOn: date(2019,1,16),  status: "Open",        id_count: 30),
                a!map(createdOn: date(2019,1,16),  status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,16),  status: "Delivered",   id_count: 12),
                a!map(createdOn: date(2019,1,17),  status: "Open",        id_count: 32),
                a!map(createdOn: date(2019,1,17),  status: "Processing",  id_count: 37),
                a!map(createdOn: date(2019,1,17),  status: "Delivered",   id_count: 10),
                a!map(createdOn: date(2019,1,18),  status: "Open",        id_count: 28),
                a!map(createdOn: date(2019,1,18),  status: "Processing",  id_count: 30),
                a!map(createdOn: date(2019,1,18),  status: "Delivered",   id_count: 18),
                a!map(createdOn: date(2019,1,19),  status: "Open",        id_count: 20),
                a!map(createdOn: date(2019,1,19),  status: "Processing",  id_count: 26),
                a!map(createdOn: date(2019,1,19),  status: "Delivered",   id_count: 22),
                a!map(createdOn: date(2019,1,20),  status: "Open",        id_count: 23),
                a!map(createdOn: date(2019,1,20),  status: "Processing",  id_count: 35),
                a!map(createdOn: date(2019,1,20),  status: "Delivered",   id_count: 30)
                }
            ),

            /* Filter values for 'Orders Delivered...' */
            local!customerSelectionForOrdersDelivered,
            local!dateIndexForOrdersDelivered: 4,
            /* Example list of date ranges for 'Orders Delivered...' date range filter below */
            /* Odd elements are used in the "from" date, and even elements are used in the "to" date */
            /* This list retrieves the last 3 months, last 6 months, last 9 months, and last 12 months respectively */
            /*local!startDateListForOrdersDelivered: {*/
                /*eomonth(today(),-4) + 1,*/
                /*eomonth(today(),-7) + 1,*/
                /*eomonth(today(),-10) + 1,*/
                /*eomonth(today(),-13) + 1*/
            /*},*/
            /*local!dateRangeForOrdersDelivered: {*/
            /*  local!startDateListForOrdersDelivered[local!dateIndexForOrdersDelivered],*/
            /*  eomonth(today(),-1)*/
            /*},*/

            /* Datasets Section: All Charts*/
            /* Replace this with a query that groups by customer to obtain a unique list of customers */
            local!customerListDataSubset: a!dataSubset(
                data:{
                a!map(customer: "Ankunding-Senger"),
                a!map(customer: "Bailey-Pouros"),
                a!map(customer: "Bechtelar-Towne"),
                a!map(customer: "Gerhold-Schiller"),
                a!map(customer: "Gutmann Inc"),
                a!map(customer: "Kozey and Sons"),
                a!map(customer: "Labadie Group"),
                a!map(customer: "Nader-Kirlin"),
                a!map(customer: "Stoltenberg-Murphy"),
                a!map(customer: "Towne, Smith and Pfannerstill")
                }
            ),

            /* Orders Delivered ...*/
            /* Replace this with a query that groups by createdOn by year and mont, and returns sum of revenue and profit. */
            /* Use the local! customerOrdersDelivered as a value for a filter on customer. */
            /* Use the following filters on this query: */
            /*    status = 'Delivered' */
            /*    customer = local!customerSelectionForOrdersDelivered */
            /*    createdOn between  local!dateRangeForOrdersDelivered */
            local!ordersDeliveredDataSubset: a!dataSubset(
                data: {
                a!map(createdOn_year: 2019, createdOn_month: 1,  revenue_sum: 25000, profit_sum: 15000),
                a!map(createdOn_year: 2019, createdOn_month: 2,  revenue_sum: 27000, profit_sum: 17000),
                a!map(createdOn_year: 2019, createdOn_month: 3,  revenue_sum: 24000, profit_sum: 14000),
                a!map(createdOn_year: 2019, createdOn_month: 4,  revenue_sum: 32000, profit_sum: 22000),
                a!map(createdOn_year: 2019, createdOn_month: 5,  revenue_sum: 28500, profit_sum: 18500),
                a!map(createdOn_year: 2019, createdOn_month: 6,  revenue_sum: 31000, profit_sum: 21000),
                a!map(createdOn_year: 2019, createdOn_month: 7,  revenue_sum: 27800, profit_sum: 17800),
                a!map(createdOn_year: 2019, createdOn_month: 8,  revenue_sum: 32000, profit_sum: 22000),
                a!map(createdOn_year: 2019, createdOn_month: 9,  revenue_sum: 29000, profit_sum: 19000),
                a!map(createdOn_year: 2019, createdOn_month: 11, revenue_sum: 28500, profit_sum: 18500),
                a!map(createdOn_year: 2019, createdOn_month: 11, revenue_sum: 29500, profit_sum: 18500)
                }
            ),
            choose(
                key: local!orderChartRadioButton,
                /* Order Trend by Status Section */
                choice1: {
                a!columnsLayout(
                    columns: {
                    a!columnLayout(
                        contents: {
                        a!multipleDropdownField(
                            choiceLabels: local!priorityListForOrdersByCustomer,
                            choiceValues: local!priorityListForOrdersByCustomer,
                            label: "Priority",
                            labelPosition: "COLLAPSED",
                            placeholder: "All priorities",
                            value: local!priorityForOrderTrendByStatus,
                            saveInto: local!priorityForOrderTrendByStatus
                        )
                        },
                        width: "NARROW"
                    ),
                    a!columnLayout(
                        contents: {
                        a!multipleDropdownField(
                            choiceLabels: local!statusListForOrdersByCustomer,
                            choiceValues: local!statusListForOrdersByCustomer,
                            label: "Status",
                            labelPosition: "COLLAPSED",
                            placeholder: "All statuses",
                            value: local!statusForOrderTrendByStatus,
                            saveInto: local!statusForOrderTrendByStatus
                        )
                        },
                        width: "NARROW"
                    ),
                    a!columnLayout(
                        contents: {
                        a!sideBySideLayout(
                            items: {
                            a!sideBySideItem(
                                item: a!dateField(
                                label: "Start Date",
                                labelPosition: "COLLAPSED",
                                value: local!startdateForOrderTrendByStatus,
                                saveInto: local!startdateForOrderTrendByStatus
                                ),
                                width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                                item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: a!richTextItem(
                                    text: "to"
                                ),
                                align: "LEFT"
                                ),
                                width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                                item: a!dateField(
                                label: "End Date",
                                labelPosition: "COLLAPSED",
                                value: local!endDateForOrderTrendByStatus,
                                saveInto: local!endDateForOrderTrendByStatus,
                                validations: if(
                                    and(not(isnull(local!startdateForOrderTrendByStatus)), not(isnull(local!endDateForOrderTrendByStatus))),
                                    if(local!endDateForOrderTrendByStatus <= local!startdateForOrderTrendByStatus,
                                    "Please set the 'end date' to a value later than the 'start date'",
                                    ""
                                    ),
                                    ""
                                )
                                ),
                                width: "MINIMIZE"
                            )
                            },
                            alignVertical: "MIDDLE",
                            spacing: "DENSE",
                            stackWhen: {"NEVER"}
                        )
                        },
                        width: "MEDIUM"
                    )
                    },
                    alignVertical: "BOTTOM",
                    showWhen: local!showOrderTrendByStatus,
                    stackWhen: {"PHONE", "TABLET_LANDSCAPE"}
                ),
                /* Line chart using list of dynamic statuses and with date validation */
                a!localVariables(
                    /*Get unique ist of dates*/
                    local!dates:  union(
                    index(local!orderTrendDataSubset.data, "createdOn"),
                    cast(typeof(index(local!orderTrendDataSubset.data, "createdOn")), {})
                    ),
                    a!lineChartField(
                    categories: local!dates,
                    series: a!forEach(
                        /* For each status... */
                        items: local!statusListForOrdersByCustomer,
                        expression: a!localVariables(
                        local!status: fv!item,
                        a!chartSeries(
                            label: fv!item,
                            data: a!forEach(
                            /* Go through each date... */
                            items: local!dates,
                            /* And either insert the count that matches that date and status, *
                            * or insert a 0. */
                            expression: a!localVariables(
                                local!dataOnThisDate: index(
                                local!orderTrendDataSubset.data,
                                wherecontains(fv!item, todate(local!orderTrendDataSubset.data.createdOn))
                                ),
                                local!dataOnThisDateInThisStatus: index(
                                local!dataOnThisDate.id_count,
                                wherecontains(local!status, touniformstring(local!dataOnThisDate.status))
                                ),
                                if(
                                length(local!dataOnThisDateInThisStatus) < 1,
                                null,
                                local!dataOnThisDateInThisStatus
                                )
                            )
                            )
                        )
                        )
                    ),
                    connectNulls: true,
                    colorScheme: "RAINFOREST"
                    )
                )
                },
                /* Orders Delivered: Monthly Revenue vs. Profit Section */
                choice2: {
                a!columnsLayout(
                    columns: {
                    a!columnLayout(
                        contents: {
                        a!dropdownField(
                            choiceLabels: index(local!customerListDataSubset.data, "customer"),
                            choiceValues: index(local!customerListDataSubset.data, "customer"),
                            label: "Customer",
                            labelPosition: "COLLAPSED",
                            placeholder: "All customers",
                            value: local!customerSelectionForOrdersDelivered,
                            saveInto: local!customerSelectionForOrdersDelivered
                        )
                        }
                    ),
                    a!columnLayout(
                        contents: {
                        a!dropdownField(
                            choiceLabels: {"Last 3 Months", "Last 6 Months", "Last 9 Months", "Last 12 Months"},
                            choiceValues: {1,2,3,4},
                            label: "Date Range",
                            labelPosition: "COLLAPSED",
                            placeholder: "All date ranges",
                            value: local!dateIndexForOrdersDelivered,
                            saveInto: local!dateIndexForOrdersDelivered
                        )
                        }
                    ),
                    a!columnLayout()
                    },
                    stackWhen: {"PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE"}
                ),
                a!columnChartField(
                    categories: a!forEach(
                    items: index(local!ordersDeliveredDataSubset.data, "createdOn_month", null),
                    expression: text(
                        date(
                        index(local!ordersDeliveredDataSubset.data.createdOn_month, fv!index, null),
                        fv!item,
                        1
                        ),
                        "mmmm"
                    ) & " " & index(local!ordersDeliveredDataSubset.data, "createdOn_year", null)[fv!index]
                    ),
                    series: {
                    a!chartSeries(
                        label: "Revenue",
                        data: index(local!ordersDeliveredDataSubset.data, "revenue_sum", null)
                    ),
                    a!chartSeries(
                        label: "Profit",
                        data: index(local!ordersDeliveredDataSubset.data, "profit_sum", null)
                    )
                    },
                    stacking: "NONE",
                    showLegend: true,
                    showTooltips: true,
                    colorScheme: "RAINFOREST"
                )
                }
            )
            )

        }
        ),
        a!columnLayout(
        contents: {
            a!headingField(
            text: upper("Orders Delivered: Year to Date"),
            size: "SMALL",
            fontWeight: "SEMI_BOLD",
            align: "CENTER",
            marginBelow: "LESS"
            ),
            a!sectionLayout(),
            a!localVariables(
            /* Orders Delivered: YTD */
            /* Replace this with a query that groups by createdOn by year and returns sum of revenue. */
            /* Use the following filters on this query: */
            /*    status = 'Delivered' */
            /*    createdOn between 'Current Year to Date' (this is an option in Query Editor), */
            local!ordersDeliveredYTDDataSubset: a!dataSubset(
                data: {createdOn_year: 2020, revenue_sum: 4500000}
            ),
            local!ordersDeliveredYTDTarget: 14500000,
            local!currentMonth: month(today()),
            local!ordersDeliveredYTD: index(local!ordersDeliveredYTDDataSubset.data, "revenue_sum"),
            local!YTDValue: a!defaultValue(tointeger(local!ordersDeliveredYTD), 0),
            /* If year to date value is less than 70% of expected value to date, it is at risk */
            /* If year to date value is between  70% and 110% of expected value to date, it is On Track*/
            local!riskIndicator: if(local!YTDValue < local!currentMonth/12 * local!ordersDeliveredYTDTarget * .7,
            1,
            if(local!YTDValue < local!currentMonth/12 * local!ordersDeliveredYTDTarget * 1.1,
            2,
            3
            )
            ),
            {
                a!gaugeField(
                labelPosition: "COLLAPSED",
                percentage: (local!YTDValue/local!ordersDeliveredYTDTarget)*100,
                primaryText: text(local!YTDValue/1000000, "$###.#M"),
                secondaryText: "This Year",
                color: "ACCENT",
                size: "LARGE"
                ),
                a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: {
                    a!richTextItem(
                    text: {
                        a!richTextIcon(
                        icon: "dot-circle-o",
                        altText: "Target",
                        caption: "Target",
                        size: "LARGE"
                        )
                    },
                    color: "SECONDARY"
                    ),
                    a!richTextItem(
                    text:  text(local!ordersDeliveredYTDTarget/1000000, "$###.#M"),
                    size: "LARGE"
                    )
                },
                align: "CENTER"
                ),
                a!tagField(
                tags: {
                    a!tagItem(
                    text: choose(local!riskIndicator, upper("At Risk"), upper("On Track"), upper("Ahead")),
                    backgroundColor: choose(local!riskIndicator, "NEGATIVE", "SECONDARY", "POSITIVE")
                    )
                },
                align: "CENTER"
                )
            }
            )
        },
        width: "MEDIUM",
        showWhen: local!showOrdersDeliveredYearToDate
        )
    },
    alignVertical: "TOP",
    stackWhen: {"PHONE", "TABLET_PORTRAIT"}
    ),
    a!sectionLayout(divider: "ABOVE"),
    a!sectionLayout(),
    a!columnsLayout(
    columns: {
        a!columnLayout(
        contents: {
            a!headingField(
            text: upper("New Orders"),
            size: "SMALL",
            fontWeight: "SEMI_BOLD",
            align: "CENTER",
            marginBelow: "EVEN_LESS"
            ),
            a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
                a!richTextItem(
                text: "Opened by day/month/year",
                color: "SECONDARY",
                size: "SMALL"
                )
            },
            align: "CENTER"
            ),
            a!richTextDisplayField(labelPosition: "COLLAPSED"),
            a!columnsLayout(
            columns: {
                a!columnLayout(
                contents: {
                    a!localVariables(
                    /* New Orders: Today */
                    /* Replace this with a query that groups by createdOn (day) and returns count of id. */
                    /* Use the following filters on this query: */
                    /*    status = 'Open' */
                    /*    createdOn = 'Today' (this is an option in Query Editor), */
                    local!newOrdersTodayDataSubset: a!dataSubset(
                        data: {createdOn_year: 2020, id_count: 8500}
                    ),
                    local!TodayTargetValue: 15000,
                    local!hour: hour(now()),
                    local!newOrdersToday: index(local!newOrdersTodayDataSubset.data, "id_count"),
                    local!todayValue: a!defaultValue(tointeger(local!newOrdersToday), 0),
                    /* If daily value is less than 70% of expected value to date, it is at risk          *
                        * If daily value is between  70% and 110% of expected value to date, it is On Track *
                        * Consider a retail day from 9:00 a.m to 10 p.m                                     */
                    local!riskIndicator: if(local!todayValue < (local!hour-9)/13 * local!TodayTargetValue * .7,
                    1,
                    if(local!todayValue < (local!hour-9)/13  * local!TodayTargetValue * 1.1,
                    2,
                    3
                    )
                    ),
                    {
                        a!gaugeField(
                        label: "New Orders" & ":" & "Today",
                        labelPosition: "COLLAPSED",
                        percentage: (local!todayValue/local!TodayTargetValue)*100,
                        primaryText: text(local!todayValue/1000, "###.#K"),
                        secondaryText: "Today",
                        color: choose(local!riskIndicator, "NEGATIVE", "ACCENT", "POSITIVE"),
                        size: "SMALL"
                        ),
                        a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                            a!richTextItem(
                            text: {
                                a!richTextIcon(
                                icon: "dot-circle-o",
                                altText: "Target",
                                caption: "Target"
                                ),
                                text(local!TodayTargetValue/1000, "###.#K")
                            },
                            color: "SECONDARY"
                            )
                        },
                        align: "CENTER"
                        )
                    }
                    )
                }
                ),
                a!columnLayout(
                contents: {
                    a!localVariables(
                    /* New Orders: This Month */
                    /* Replace this with a query that groups by createdOn (group by month) and returns count of id. */
                    /* Use the following filters on this query: */
                    /*    status = 'Open' */
                    /*    createdOn = 'Current Month to Date' (this is an option in Query Editor), */
                    local!newOrdersThisMonthDataSubset: a!dataSubset(
                        data: {createdOn_month: 2, id_count: 99000}
                    ),
                    local!thisMonthTargetValue: 165000,
                    local!day: day(today()),
                    local!daysInMonth: daysinmonth(2, year(today())) ,
                    local!newOrdersThisMonth: index(local!newOrdersThisMonthDataSubset.data, "id_count"),
                    local!thisMonthValue: a!defaultValue(tointeger(local!newOrdersThisMonth), 0),
                    /* If daily value is less than 70% of expected value day to month, it is at risk          *
                        * If daily value is between  70% and 110% of expected value Day to Month, it is On Track */
                    local!riskIndicator: if(local!thisMonthValue < local!day/local!daysInMonth * local!thisMonthTargetValue * .7,
                    1,
                    if(local!thisMonthValue < local!day/local!daysInMonth  * local!thisMonthTargetValue * 1.1,
                    2,
                    3
                    )
                    ),
                    {
                        a!sideBySideLayout(
                        items: {
                            a!sideBySideItem(
                            item: a!gaugeField(
                                label: "New Orders" & ":" & "This Month",
                                labelPosition: "COLLAPSED",
                                percentage: (local!thisMonthValue/local!thisMonthTargetValue)*100,
                                primaryText: text(local!thisMonthValue/1000, "###.#K"),
                                secondaryText: "This Month",
                                color: choose(local!riskIndicator, "NEGATIVE", "ACCENT", "POSITIVE"),
                                size: "SMALL"
                            )
                            )
                        },
                        alignVertical: "MIDDLE"
                        ),
                        a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                            a!richTextItem(
                            text: {
                                a!richTextIcon(
                                icon: "dot-circle-o",
                                altText: "Target",
                                caption: "Target"
                                ),
                                text(local!thisMonthTargetValue/1000, "###.#K")
                            },
                            color: "SECONDARY"
                            )
                        },
                        align: "CENTER"
                        )
                    }
                    )
                }
                ),
                a!columnLayout(
                contents: {
                    a!localVariables(
                    /* New Orders: YTD */
                    /* Replace this with a query that groups by createdOn (group by year) and returns count of id. */
                    /* Use the following filters on this query: */
                    /*    status = 'Open' */
                    /*    createdOn = 'Year to Date' (this is an option in Query Editor), */
                    local!newOrdersThisYearDataSubset: a!dataSubset(
                        data: {createdOn_year: 2020, id_count: 1320000}
                    ),
                    local!thisYearTargetValue: 1980000,
                    local!month: month(today()),
                    local!newOrdersThisYear: index(local!newOrdersThisYearDataSubset.data, "id_count"),
                    local!thisYearValue: a!defaultValue(tointeger(local!newOrdersThisYear), 0),
                    /* If daily value is less than 70% of expected value to date, it is at risk          *
                        * If daily value is between  70% and 110% of expected value to date, it is On Track *
                        * Consider a retail day from 9:00 a.m to 10 p.m                                     */
                    local!riskIndicator: if(local!thisYearValue < local!month/12 * local!thisYearTargetValue * .7,
                    1,
                    if(local!thisYearValue < local!month/12  * local!thisYearTargetValue * 1.1,
                    2,
                    3
                    )
                    ),
                    {
                        a!gaugeField(
                        label: "New Orders" & ":" & "YTD",
                        labelPosition: "COLLAPSED",
                        percentage: (local!thisYearValue/local!thisYearTargetValue)*100,
                        primaryText: text(local!thisYearValue/1000000, "###.##M"),
                        secondaryText: "This Year",
                        color: choose(local!riskIndicator, "NEGATIVE", "ACCENT", "POSITIVE"),
                        size: "SMALL"
                        ),
                        a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                            a!richTextItem(
                            text: {
                                a!richTextIcon(
                                icon: "dot-circle-o",
                                altText: "Target",
                                caption: "Target"
                                ),
                                text(local!thisYearTargetValue/1000000, "###.##M")
                            },
                            color: "SECONDARY"
                            )
                        },
                        align: "CENTER"
                        )
                    }
                    )
                }
                )
            },
            stackWhen: {"PHONE", "TABLET_LANDSCAPE", "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE"}
            )
        },
        width: "NARROW",
        showWhen: local!showNewOrders
        ),
        a!columnLayout(
        contents: {
            a!headingField(
            text: upper("Orders by Customer"),
            size: "SMALL",
            fontWeight: "SEMI_BOLD",
            marginBelow: "EVEN_LESS"
            ),
            a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
                a!richTextItem(
                text: "Total number of orders opened within the selected timeframe",
                color: "SECONDARY",
                size: "SMALL"
                )
            }
            ),
            a!localVariables(
            /* Filter values for 'Orders by Customer' */
            local!priorityForOrdersByCustomer,
            local!statusForOrdersByCustomer,
            local!startDateForOrdersByCustomer: date(year(today()), 1, 1), /* Beginning of the year */
            local!endDateForOrdersByCustomer: today(),

            /* Orders By Customer */
            /* Replace this with a query that groups by customer and status, and returns count of id. */
            /* The column chart will use customer and status to group in that same order, make sure to keep this. */
            /* Use the following filters on this query: */
            /*    priority in local!priorityForOrdersByCustomer */
            /*    status in local!statusForOrdersByCustomer */
            /*    createdOn between {local!startDateForOrdersByCustomer, local!endDateForOrdersByCustomer} */
            local!ordersByCustomerDataSubset: a!dataSubset(
                data: {
                a!map(customer: "Ankunding-Senger",               status: "Open",       id_count: 0),
                a!map(customer: "Ankunding-Senger",               status: "Processing", id_count: 3),
                a!map(customer: "Ankunding-Senger",               status: "Delivered",  id_count: 2),
                a!map(customer: "Bailey-Pouros",                  status: "Open",       id_count: 2),
                a!map(customer: "Bailey-Pouros",                  status: "Processing", id_count: 2),
                a!map(customer: "Bailey-Pouros",                  status: "Delivered",  id_count: 4),
                a!map(customer: "Bechtelar-Towne",                status: "Open",       id_count: 3),
                a!map(customer: "Bechtelar-Towne",                status: "Processing", id_count: 4),
                a!map(customer: "Bechtelar-Towne",                status: "Delivered",  id_count: 5),
                a!map(customer: "Gerhold-Schiller",               status: "Open",       id_count: 2),
                a!map(customer: "Gerhold-Schiller",               status: "Processing", id_count: 1),
                a!map(customer: "Gerhold-Schiller",               status: "Delivered",  id_count: 1),
                a!map(customer: "Gutmann Inc",                    status: "Open",       id_count: 0),
                a!map(customer: "Gutmann Inc",                    status: "Processing", id_count: 1),
                a!map(customer: "Gutmann Inc",                    status: "Delivered",  id_count: 5),
                a!map(customer: "Kozey and Sons",                 status: "Open",       id_count: 2),
                a!map(customer: "Kozey and Sons",                 status: "Processing", id_count: 1),
                a!map(customer: "Kozey and Sons",                 status: "Delivered",  id_count: 4),
                a!map(customer: "Labadie Group",                  status: "Open",       id_count: 2),
                a!map(customer: "Labadie Group",                  status: "Processing", id_count: 3),
                a!map(customer: "Labadie Group",                  status: "Delivered",  id_count: 5),
                a!map(customer: "Nader-Kirlin",                   status: "Open",       id_count: 6),
                a!map(customer: "Nader-Kirlin",                   status: "Processing", id_count: 5),
                a!map(customer: "Nader-Kirlin",                   status: "Delivered",  id_count: 0),
                a!map(customer: "Stoltenberg-Murphy",             status: "Open",       id_count: 5),
                a!map(customer: "Stoltenberg-Murphy",             status: "Processing", id_count: 1),
                a!map(customer: "Stoltenberg-Murphy",             status: "Delivered",  id_count: 3),
                a!map(customer: "Towne, Smith and Pfannerstill",  status: "Open",       id_count: 1),
                a!map(customer: "Towne, Smith and Pfannerstill",  status: "Processing", id_count: 3),
                a!map(customer: "Towne, Smith and Pfannerstill",  status: "Delivered",  id_count: 2)
                }
            ),
            {
                a!columnsLayout(
                columns: {
                    a!columnLayout(
                    contents: {
                        a!multipleDropdownField(
                        choiceLabels: local!priorityListForOrdersByCustomer,
                        choiceValues: local!priorityListForOrdersByCustomer,
                        label: "Priority",
                        labelPosition: "COLLAPSED",
                        placeholder: "All priorities",
                        value: local!priorityForOrdersByCustomer,
                        saveInto: local!priorityForOrdersByCustomer
                        )
                    },
                    width: "NARROW"
                    ),
                    a!columnLayout(
                    contents: {
                        a!multipleDropdownField(
                        choiceLabels: local!statusListForOrdersByCustomer,
                        choiceValues: local!statusListForOrdersByCustomer,
                        label: "Status",
                        labelPosition: "COLLAPSED",
                        placeholder: "All statuses",
                        value: local!statusForOrdersByCustomer,
                        saveInto: local!statusForOrdersByCustomer
                        )
                    },
                    width: "NARROW"
                    ),
                    a!columnLayout(
                    contents: {
                        a!sideBySideLayout(
                        items: {
                            a!sideBySideItem(
                            item: a!dateField(
                                label: "Start Date",
                                labelPosition: "COLLAPSED",
                                value: local!startDateForOrdersByCustomer,
                                saveInto: local!startDateForOrdersByCustomer
                            ),
                            width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                            item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: a!richTextItem(
                                text: "to"
                                ),
                                align: "LEFT"
                            ),
                            width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                            item: a!dateField(
                                label: "End Date",
                                labelPosition: "COLLAPSED",
                                value: local!endDateForOrdersByCustomer,
                                saveInto: local!endDateForOrdersByCustomer,
                                validations: if(
                                and(not(isnull(local!startDateForOrdersByCustomer)), not(isnull(local!endDateForOrdersByCustomer))),
                                if(local!endDateForOrdersByCustomer <= local!startDateForOrdersByCustomer,
                                "Please set the 'end date' to a value later than the 'start date'",
                                ""
                                ),
                                ""
                                )
                            ),
                            width: "MINIMIZE"
                            )
                        },
                        alignVertical: "MIDDLE",
                        spacing: "DENSE",
                        stackWhen: {"NEVER"}
                        )
                    },
                    width: "MEDIUM_PLUS"
                    )
                },
                alignVertical: "BOTTOM",
                marginBelow: "NONE",
                stackWhen: {"PHONE", "TABLET_LANDSCAPE"}
                ),
                /* ORDERS BY CUSTOMER: Logic for Stacked Chart */
                a!localVariables(
                /* local!categories is returning all department values. local!uniqueDepartments *
                * is reducing the list down to only unique values. This populates the column   *
                * chart categories.                                                            *
                *
                * To use your data, change the second parameter in the index function from     *
                * "department" to whatever data point is going to be your category             */

                local!categories: index(local!ordersByCustomerDataSubset.data, "customer", {}),
                local!uniqueCategories: union(local!categories, cast(typeof(local!categories), {})),

                /* local!labels and local!uniqueLabels provide the name of each piece in the *
                * column.                                                                   *
                *                                                                           *
                * To use your data, change the second parameter in the index function from  *
                * "title" to whatever data point is going to be the label of each piece     */

                local!labels: index(local!ordersByCustomerDataSubset.data, "status", {}),
                local!uniqueLabels: union(local!labels, cast(typeof(local!labels), {})),

                /* local!series puts everything together for the column chart. It runs through  *
                * two a!forEach() loops. The first loop will lopp over a list of categories to *
                * find matching data, while the second a!forEach() loop will find all matching *
                * datapoints in that category.                                                 *
                *                                                                              *
                * To use your data, change the second parameter in the index function at the   *
                * end of the second a!forEach() loop. Replace "id" to whatever data point is   *
                * providing the numeric value to count on in your dataset.                     */

                local!series: a!forEach(
                    items: local!uniquelabels,
                    expression: with(
                    local!label:fv!item,
                    a!chartSeries(
                        label: local!label,
                        /* Loops over list of categories to find each datapoint that matches *
                        * the series label and the category. This will ensure that the      *
                        * datapoints are in the correct order to display in the chart.      */
                        data: a!forEach(
                        items: local!uniqueCategories,
                        expression: with(
                            /* Find all datapoints that match both the category and chart series label   */
                            local!intersection: intersection(
                            where(local!categories=cast(typeof(local!categories), fv!item), 0),
                            where(local!labels=cast(typeof(local!labels), local!label), 0)
                            ),
                            if(
                            length(local!intersection)=0,
                            /* If there is no datapoint for this category-label pair, return 0 *
                                * so that all subsequent points are in the correct order with the *
                                * categories.                                                     */
                            0,
                            index(index(local!ordersByCustomerDataSubset.data, "id_count", {}), local!intersection, 0)
                            )
                        )
                        )
                    )
                    )
                ),
                a!columnChartField(
                    categories: local!uniqueCategories,
                    series: local!series,
                    xAxisTitle: "Customer",
                    yAxisTitle: "# of Orders",
                    stacking: "NORMAL",
                    colorScheme: "RAINFOREST"
                )
                )
            }
            )
        },
        showWhen: local!showOrdersByCustomer
        ),
        a!columnLayout(
        contents: {
            a!headingField(
            text: upper("Customer Rankings"),
            size: "SMALL",
            fontWeight: "SEMI_BOLD",
            marginBelow: "EVEN_LESS"
            ),
            a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
                a!richTextItem(
                text: "Total dollar value for all new orders opened this month",
                color: "SECONDARY",
                size: "SMALL"
                )
            }
            ),
            a!localVariables(
            local!customerRankingsList: {"Top 5", "Top 10", "Bottom 5", "Bottom 10"},
            /* Predefined pagings for the various rankings defined by local!customerRankingsList */
            local!customerRankingsPagingList: {
                a!pagingInfo(startIndex: 1, batchSize: 5, sort: a!sortInfo(field: "revenue_sum", ascending: false)),
                a!pagingInfo(startIndex: 1, batchSize: 10, sort: a!sortInfo(field: "revenue_sum", ascending: false)),
                a!pagingInfo(startIndex: 1, batchSize: 5, sort: a!sortInfo(field: "revenue_sum", ascending: true)),
                a!pagingInfo(startIndex: 1, batchSize: 10, sort: a!sortInfo(field: "revenue_sum", ascending: true))
            },
            /* Filter values for 'Customer Rankings' */
            local!customerRankingSelection: "Top 5",
            /* Index selected from the Top/Bommon X dropdown */
            local!customerRankingIndex: wherecontains(local!customerRankingSelection, local!customerRankingsList),
            /* Paging selection to be used in the final query */
            local!customerRankingsPaging: index(local!customerRankingsPagingList, local!customerRankingIndex),

            /* Customer Rankings */
            /* Replace this with a query that groups by customer and returns sum of revenue. */
            /* The query uses the local!customerRankingsPaging variable for the pagingInfo parameter. */
            /* This variable is set by the dropdown to choose from Top 5, Top 10, Bottom 5 and Bottom 10. */
            /* Use the following filters on this query: */
            /*              createdOn" between 'Current Month to Date' */
            /*              status" = 'Open' */
            local!customerRankingsDataSubset: a!dataSubset(
                data: {
                a!map(customer: "Bechtelar-Towne",    revenue_sum: 12000),
                a!map(customer: "Nader-Kirlin",       revenue_sum: 9600),
                a!map(customer: "Labadie Group",      revenue_sum: 8500),
                a!map(customer: "Stoltenberg-Murphy", revenue_sum: 6500),
                a!map(customer: "Kozey and Sons",     revenue_sum: 5000)
                }
            ),
            {
                a!columnsLayout(
                columns: {
                    a!columnLayout(
                    contents: {
                        a!dropdownField(
                        choiceLabels: local!customerRankingsList,
                        choiceValues: local!customerRankingsList,
                        labelPosition: "COLLAPSED",
                        value: local!customerRankingSelection,
                        saveInto: {
                            local!customerRankingSelection,
                            a!save(local!customerRankingIndex, wherecontains(local!customerRankingSelection, local!customerRankingsList)),
                            a!save(local!customerRankingsPaging, local!customerRankingsPagingList[local!customerRankingIndex])
                        }
                        )
                    },
                    width: "AUTO"
                    ),
                    a!columnLayout(
                    contents: {
                        a!buttonArrayLayout(
                        buttons: {
                            a!buttonWidget(
                            label: "Send Alert",
                            icon: "envelope-o",
                            tooltip: "Assign a task to account executives so they can follow-up on their bottom performers",
                            size: "SMALL",
                            style: "OUTLINE",
                            color: "SECONDARY"
                            )
                        },
                        showWhen: or(local!customerRankingSelection="Bottom 5", local!customerRankingSelection="Bottom 10"),
                        align: "START",
                        marginBelow: "NONE"
                        )
                    },
                    width: "AUTO"
                    )
                },
                stackWhen: {"PHONE", "TABLET_PORTRAIT"}
                ),
                a!barChartField(
                categories: index(local!customerRankingsDataSubset.data, "customer"),
                series: {
                    a!chartSeries(
                    data: index(local!customerRankingsDataSubset.data, "revenue_sum")
                    )
                },
                yAxisTitle: "Dollars ($)",
                stacking: "NONE",
                showLegend: false,
                showTooltips: true,
                colorScheme: "RAINFOREST"
                )
            }
            )
        },
        showWhen: local!showCustomerRankings
        )
    },
    stackWhen: {"PHONE", "TABLET_PORTRAIT"}
    )
}
)