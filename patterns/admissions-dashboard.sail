a!localVariables(
  local!defaultSemester: 1,
  a!headerContentLayout(
    contents: {
      a!sideBySideLayout(
        items: {
          a!sideBySideItem(
            item: a!headingField(
              text: "Undergraduate Admissions" & " ",
              size: "MEDIUM",
              headingTag: "H1",
              fontWeight: "SEMI_BOLD",
              marginBelow: "NONE"
            ),
            width: "MINIMIZE"
          ),
          a!sideBySideItem(
            item: a!dropdownField(
              choiceLabels: { "Fall 2020", "Spring 2020", "Fall 2019", "Spring 2019" },
              choiceValues: { 1, 2, 3, 4 },
              label: "Semester Filter",
              labelPosition: "COLLAPSED",
              placeholder: "--- " & "Select Semester" & " ---",
              value: local!defaultSemester
            ),
            width: "MINIMIZE"
          )
        },
        alignVertical: "MIDDLE"
      ),
      a!cardGroupLayout(
        marginBelow: "LESS",
        cards: {
          /* Top left bar chart */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "1500 " & "Applications Received",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD",
                marginBelow: "NONE"
              ),
              a!barChartField(
                labelPosition: "COLLAPSED",
                categories: { "Applications" },
                series: {
                  a!chartSeries(label: "Pending", data: { 750 }),
                  a!chartSeries(label: "Declined", data: { 450 }),
                  a!chartSeries(label: "Accepted", data: { 300 })
                },
                stacking: "NORMAL",
                showLegend: true,
                showTooltips: true,
                colorScheme: "PARACHUTE",
                height: "MICRO",
                xAxisStyle: "NONE",
                yAxisStyle: "NONE"
              )
            },
            height: "AUTO",
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            marginBelow: "STANDARD",
            showBorder: false
          ),
          /* Top middle column chart */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "200 " & "Applications Reviewed Weekly",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD",
                marginBelow: "NONE"
              ),
              a!sideBySideLayout(
                items: {
                  a!sideBySideItem(
                    a!columnChartField(
                      categories: { "Week 1", "Week 2", "Week 3", "Week 4", "Week 5" },
                      series: {
                        a!chartSeries(
                          label: "Not Reviewed",
                          data: { 350, 400, 600, 650, 700 },
                          color: "#d8d8d8"
                        ),
                        a!chartSeries(
                          label: "Reviewed",
                          data: { 0, 200, 400, 600, 800 },
                          color: "#3aa5d1"
                        )
                      },
                      yAxisMax: 1500,
                      stacking: "NORMAL",
                      showLegend: false,
                      showDataLabels: false,
                      labelPosition: "COLLAPSED",
                      colorScheme: "PARACHUTE",
                      height: "MICRO",
                      xAxisStyle: "NONE",
                      yAxisStyle: "NONE"
                    )
                  ),
                  a!sideBySideItem(
                    item: a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextIcon(
                          icon: "circle",
                          color: "#D8D8D8",
                          size: "SMALL"
                        ),
                        " ",
                        a!richTextItem(text: "Not Reviewed", size: "SMALL"),
                        char(10),
                        a!richTextIcon(
                          icon: "circle",
                          color: "#3aa5d1",
                          size: "SMALL"
                        ),
                        " ",
                        a!richTextItem(text: "Reviewed", size: "SMALL")
                      }
                    ),
                    width: "MINIMIZE"
                  )
                },
                alignVertical: "MIDDLE",
                stackWhen: {
                  "PHONE",
                  "TABLET_PORTRAIT",
                  "TABLET_LANDSCAPE"
                }
              )
            },
            height: "AUTO",
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            marginBelow: "STANDARD",
            showBorder: false
          ),
          /* Top right rich text display */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "Early Decision Deadline",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD",
                marginBelow: "NONE"
              ),
              a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: {
                  a!richTextItem(text: "Nov. 1, 2020", size: "LARGE"),
                  char(10),
                  char(10),
                  a!richTextItem(
                    text: "3 days remaining",
                    color: "NEGATIVE",
                    size: "MEDIUM"
                  )
                },
                align: "LEFT"
              )
            },
            height: "AUTO",
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            marginBelow: "STANDARD",
            showBorder: false
          )
        },
        cardWidth: "NARROW_PLUS",
        fillContainer: true
      ),
      a!cardGroupLayout(
        marginBelow: "LESS",
        cards: {
          /* Middle left bar chart */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "Accepted Students by Gender and Race",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD"
              ),
              a!barChartField(
                label: "Accepted Students by Gender and Race",
                labelPosition: "COLLAPSED",
                categories: { "Male", "Female" },
                series: {
                  a!chartSeries(label: "Other", data: { 301, 199 }),
                  a!chartSeries(label: "Hispanic/Latino", data: { 168, 197 }),
                  a!chartSeries(label: "Asian", data: { 270, 316 }),
                  a!chartSeries(label: "African American", data: { 291, 340 }),
                  a!chartSeries(label: "White", data: { 1277, 1491 })
                },
                stacking: "NORMAL",
                showLegend: true,
                showDataLabels: false,
                colorScheme: "PARACHUTE",
                height: "SHORT",
                xAxisStyle: "STANDARD",
                yAxisStyle: "NONE"
              )
            },
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            showBorder: false
          ),
          /* Middle column chart */
          a!cardLayout(
            contents: {
              {
                a!headingField(
                  text: "Applicant Statuses",
                  size: "SMALL",
                  headingTag: "H2",
                  fontWeight: "SEMI_BOLD"
                ),
                a!columnChartField(
                  label: "Applicant Statuses",
                  categories: { "Pending", "Accepted", "Declined" } ,
                  series: {
                    a!chartSeries(label: "Total Applicants", data: { 1050, 436, 215 } )
                  } ,
                  yAxisMax: 1050,
                  showLegend: false,
                  showDataLabels: true(),
                  labelPosition: "COLLAPSED",
                  colorScheme: "PARACHUTE",
                  height: "SHORT",
                  yAxisStyle: "MINIMAL"
                )
              }
            } ,
            height: "AUTO",
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            marginBelow: "STANDARD",
            showBorder: false
          ),
          /* Middle right gauge */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "Funds Used (USD)",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD"
              ),
              a!gaugeField(
                label: "Funds Used (USD)",
                labelPosition: "COLLAPSED",
                percentage: 47.0,
                primaryText: "663k",
                secondaryText: "/ 1.4m",
                color: "#3AA5D1",
                size: "MEDIUM"
              )
            } ,
            height: "AUTO",
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            marginBelow: "STANDARD",
            showBorder: false
          )
        } ,
        cardWidth: "NARROW_PLUS",
        fillContainer: true
      ),
      a!cardGroupLayout(
        marginBelow: "LESS",
        cards: {
          /* Bottom left column chart */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "Applicant Residencies",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD"
              ),
              a!barChartField(
                label: "Applicant Residencies",
                labelPosition: "COLLAPSED",
                categories: {
                  "In-State Freshmen",
                  "Out-of-State Freshmen",
                  "In-State Transfers",
                  "Other Campus Transfers",
                  "International",
                  "Out-of-State Transfers"
                } ,
                series: {
                  a!chartSeries(
                    label: "Total Applicants",
                    data: { 750, 400, 135, 135, 103, 80 }
                  )
                } ,
                stacking: "NONE",
                showLegend: false,
                showTooltips: true,
                colorScheme: "PARACHUTE",
                height: "SHORT",
                xAxisStyle: "STANDARD",
                yAxisStyle: "STANDARD"
              )
            } ,
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            showBorder: false
          ),
          /* Bottom middle donut chart */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "Available Funds (USD)",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD"
              ),
              a!pieChartField(
                label: "Available Funds (USD)",
                labelPosition: "COLLAPSED",
                series: {
                  a!chartSeries(label: "Financial Aid", data: 980000),
                  a!chartSeries(label: "Scholarships", data: 280000)
                } ,
                showDataLabels: true,
                showAsPercentage: false,
                colorScheme: "PARACHUTE",
                style: "DONUT",
                seriesLabelStyle: "LEGEND",
                height: "SHORT"
              )
            } ,
            height: "AUTO",
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            marginBelow: "STANDARD",
            showBorder: false
          ),
          /* Bottom right grid */
          a!cardLayout(
            contents: {
              a!headingField(
                text: "Breakdown of Available Funds",
                size: "SMALL",
                headingTag: "H2",
                fontWeight: "SEMI_BOLD"
              ),
              a!gridField(
                label: "Breakdown of Available Funds",
                labelPosition: "COLLAPSED",
                data: todatasubset(
                  {
                    {
                      id: 1,
                      type: "Financial Aid",
                      name: "Grants",
                      totalAmount: "588000"
                    } ,
                    {
                      id: 2,
                      type: "Financial Aid",
                      name: "Loans",
                      totalAmount: "392000"
                    } ,
                    {
                      id: 3,
                      type: "Scholarship",
                      name: "Academic Scholarships",
                      totalAmount: "168000"
                    } ,
                    {
                      id: 4,
                      type: "Scholarship",
                      name: "Athletic Scholarships",
                      totalAmount: "112000"
                    }
                  } ,
                  fv!pagingInfo
                ),
                columns: {
                  a!gridColumn(
                    label: "Type of Aid",
                    value: a!richTextDisplayField(
                      value: {
                        a!richTextIcon(
                          icon: "dot-circle-o",
                          caption: fv!row.type,
                          color: if(
                            tostring(fv!row.type) = "Financial Aid",
                            "#e65f8e",
                            "#a86bd1"
                          ),
                          size: "SMALL"
                        ),
                        " ",
                        fv!row.name
                      }
                    )
                  ),
                  a!gridColumn(
                    label: "Funds",
                    value: a!richTextDisplayField(value: "$" & fv!row.totalAmount / 1000 & "k")
                  )
                } ,
                initialSorts: a!sortInfo(field: "totalAmount", ascending: false),
                spacing: "STANDARD",
                borderStyle: "LIGHT",
                shadeAlternateRows: false
              )
            } ,
            height: "AUTO",
            style: "CHARCOAL_SCHEME",
            padding: "STANDARD",
            marginBelow: "STANDARD",
            showBorder: false
          )
        },
        cardWidth: "NARROW_PLUS",
        fillContainer: true
      )
    } ,
    backgroundColor: "CHARCOAL_SCHEME"
  )
)