a!cardLayout(
  contents: {
    a!kpiField(
      /* Select a record type for the data parameter */
      data: null,
      primaryText: "Total Revenue",
      icon: "file-invoice-dollar",
      size: "LARGE"
    ),
    a!sectionLayout(
      label: "",
      contents: {},
      marginAbove: "NONE",
      marginBelow: "NONE"
    ),
    a!cardLayout(
      contents: {
        a!columnChartField(
          label: "",
          categories: { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" },
          series: {
            a!chartSeries(label: "2023 Total Revenue", data: { 100000, 290000, 330000, 300000, 400000,480000,520000,720000,680000,750000,950000,1000000})
          },
          xAxisTitle: "",
          yAxisTitle: "",
          yAxisMin: null,
          yAxisMax: 1250000,
          stacking: "NORMAL",
          referenceLines: a!chartReferenceLine(value: 1.85E3, color: "#2E2E35", style: "SHORTDASH"),
          showLegend: false,
          showDataLabels: false,
          showTooltips: true,
          allowDecimalAxisLabels: false,
          labelPosition: "COLLAPSED",
          colorScheme: a!colorSchemeCustom(
            colors: {
              "#ffbc11",
              "#9d4de3",
              "#F3961F",
              "#18b4ab",
              "#F9CC00"
            }
          ),
          height: "SHORT",
          xAxisStyle: "STANDARD",
          yAxisStyle: "NONE"
        )
      },
      style: "#FAFAFA",
      shape: "ROUNDED",
      padding: "LESS",
      showBorder: false
    )
  },
  height: "AUTO",
  shape: "ROUNDED",
  padding: "STANDARD",
  showBorder: false,
  showShadow: true()
)
