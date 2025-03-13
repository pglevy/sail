a!columnsLayout(
  columns: {
    a!columnLayout(
      contents: {
        a!cardLayout(
          contents: {
            a!sideBySideLayout(
              items: {
                a!sideBySideItem(
                  item: a!kpiField(
                    /* Select a record type for the data parameter */
                    data: null,
                    primaryText: "Total Orders",
                    icon: "shopping-basket",
                    trend: "PERCENTAGE",
                    size: "STANDARD",
                    
                  ),
                  width: "MINIMIZE"
                ),
                a!sideBySideItem(
                  item: a!lineChartField(
                    label: "",
                    labelPosition: "COLLAPSED",
                    categories: {
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec",
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec",
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec"
                    },
                    series: {
                      a!chartSeries(
                        label: "2023 Total Revenue",
                        data: {
                          1,
                          5,
                          10,
                          20,
                          28,
                          90,
                          29,
                          35,
                          39,
                          43,
                          40,
                          50,
                          52,
                          57,
                          60,
                          120,
                          80,
                          85,
                          90,
                          110,
                          130,
                          140,
                          160,
                          190,
                          185,
                          180,
                          210,
                          100,
                          240,
                          350,
                          290,
                          300,
                          340,
                          360,
                          390,
                          400
                        }
                      )
                    },
                    xAxisTitle: "",
                    yAxisTitle: "",
                    yAxisMin: null,
                    yAxisMax: null,
                    referenceLines: a!chartReferenceLine(value: null, style: "SOLID"),
                    showLegend: false,
                    showDataLabels: false,
                    showTooltips: false,
                    allowDecimalAxisLabels: false,
                    connectNulls: false,
                    colorScheme: a!colorSchemeCustom(colors: { "#756BD1", "#5448C6" }),
                    height: "MICRO",
                    xAxisStyle: "NONE",
                    yAxisStyle: "NONE"
                  ),
                  width: "AUTO"
                )
              }
            )
          },
          style: "#0F1C2E",
          shape: "ROUNDED",
          padding: "STANDARD",
          showBorder: false(),
          showShadow: true()
        )
      }
    ),
    a!columnLayout(
      contents: {
        a!cardLayout(
          contents: {
            a!sideBySideLayout(
              items: {
                a!sideBySideItem(
                  item: a!kpiField(
                    data: null,
                    primaryText: "Total Sales",
                    icon: "shopping-cart",
                    trend: "PERCENTAGE",
                    size: "STANDARD",
                    
                  ),
                  width: "MINIMIZE"
                ),
                a!sideBySideItem(
                  item: a!lineChartField(
                    label: "",
                    labelPosition: "COLLAPSED",
                    categories: {
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec",
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec",
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec"
                    },
                    series: {
                      a!chartSeries(
                        label: "2023 Total Revenue",
                        data: {
                          1,
                          5,
                          10,
                          20,
                          28,
                          50,
                          29,
                          35,
                          39,
                          25,
                          24,
                          20,
                          22,
                          37,
                          40,
                          50,
                          60,
                          75,
                          50,
                          40,
                          33,
                          24,
                          20,
                          29,
                          28,
                          30,
                          40,
                          40,
                          40,
                          50,
                          90,
                          60,
                          40,
                          60,
                          90,
                          100
                        }
                      )
                    },
                    xAxisTitle: "",
                    yAxisTitle: "",
                    yAxisMin: null,
                    yAxisMax: null,
                    referenceLines: a!chartReferenceLine(value: null, style: "SOLID"),
                    showLegend: false,
                    showDataLabels: false,
                    showTooltips: false,
                    allowDecimalAxisLabels: false,
                    connectNulls: false,
                    colorScheme: a!colorSchemeCustom(colors: { "#F47348", "#5448C6" }),
                    height: "MICRO",
                    xAxisStyle: "NONE",
                    yAxisStyle: "NONE"
                  ),
                  width: "AUTO"
                )
              }
            )
          },
          style: "#0F1C2E",
          shape: "ROUNDED",
          padding: "STANDARD",
          showBorder: false(),
          showShadow: true()
        )
      }
    ),
    a!columnLayout(
      contents: {
        a!cardLayout(
          contents: {
            a!sideBySideLayout(
              items: {
                a!sideBySideItem(
                  item: a!kpiField(
                    data: null,
                    primaryText: "Online Visitors",
                    icon: "globe-alt",
                    trend: "PERCENTAGE",
                    size: "STANDARD",
                    
                  ),
                  width: "MINIMIZE"
                ),
                a!sideBySideItem(
                  item: a!lineChartField(
                    label: "",
                    labelPosition: "COLLAPSED",
                    categories: {
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec",
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec",
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec"
                    },
                    series: {
                      a!chartSeries(
                        label: "2023 Total Revenue",
                        data: {
                          1,
                          5,
                          10,
                          20,
                          28,
                          90,
                          29,
                          35,
                          39,
                          43,
                          40,
                          50,
                          52,
                          57,
                          60,
                          120,
                          80,
                          85,
                          90,
                          110,
                          130,
                          140,
                          160,
                          190,
                          185,
                          180,
                          210,
                          100,
                          240,
                          350,
                          290,
                          200,
                          140,
                          120,
                          110,
                          100
                        }
                      )
                    },
                    xAxisTitle: "",
                    yAxisTitle: "",
                    yAxisMin: null,
                    yAxisMax: null,
                    referenceLines: a!chartReferenceLine(value: null, style: "SOLID"),
                    showLegend: false,
                    showDataLabels: false,
                    showTooltips: false,
                    allowDecimalAxisLabels: false,
                    connectNulls: false,
                    colorScheme: a!colorSchemeCustom(colors: { "#F8B439", "#5448C6" }),
                    height: "MICRO",
                    xAxisStyle: "NONE",
                    yAxisStyle: "NONE"
                  ),
                  width: "AUTO"
                )
              }
            )
          },
          style: "#0F1C2E",
          shape: "ROUNDED",
          padding: "STANDARD",
          showBorder: false(),
          showShadow: true()
        )
      }
    )
  }
),
