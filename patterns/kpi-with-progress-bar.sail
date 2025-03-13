a!columnslayout(
  columns: {
    a!columnLayout(
      contents: a!cardLayout(
        contents: {
          a!cardLayout(
            contents: {
              a!kpiField(
                /* Select a record type for the data parameter */
                data: null,
                template: "ADJACENT",
                iconStyle: "STAMP",
                icon: "usd",
                primaryText: "Total Revenue",
                trend: "NONE",
                secondaryText: "Target Revenue: $1,200,000"
              ),
              a!progressBarField(
                labelPosition: "COLLAPSED",
                percentage: 80,
                color: "POSITIVE",
                style: "THIN",
                marginAbove: "LESS",
                marginBelow: "NONE",
                showPercentage: false()
              )
            },
            style: "TRANSPARENT",
            padding: "NONE",
            showBorder: false
          )
        },
        style: "#0F1C2E",
        shape: "ROUNDED",
        padding: "STANDARD",
        showBorder: false,
        showShadow: true()
      )
    ),
    a!columnLayout(
      contents: a!cardLayout(
        contents: {
          a!kpiField(
            data: null(),
            template: "ADJACENT",
            iconColor: "#FAA92F",
            iconStyle: "STAMP",
            icon: "walking",
            primaryText: "Total Visitors",
            trend: "PERCENTAGE",
            secondaryText: "vs 2023"
          ),
          
        },
        style: "#0F1C2E",
        shape: "ROUNDED",
        padding: "STANDARD",
        showBorder: false,
        showShadow: true()
      )
    ),
    a!columnLayout(
      contents: a!cardLayout(
        contents: {
          a!kpiField(
            data: null(),
            template: "ADJACENT",
            iconStyle: "STAMP",
            icon: "shopping-basket",
            iconColor: "#EB4183",
            primaryText: "Total Orders",
            trend: "NONE",
            
          ),
          
        },
        style: "#0F1C2E",
        shape: "ROUNDED",
        padding: "STANDARD",
        showBorder: false,
        showShadow: true()
      )
    )
  }
),
