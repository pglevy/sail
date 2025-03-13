a!headerContentLayout(
  header: {
    a!cardLayout(
      contents: {
        a!sideBySideLayout(
          alignVertical: "MIDDLE",
          items: {
            a!sideBySideItem(
              width: "MINIMIZE",
              item: a!richTextDisplayField(
                marginBelow: "EVEN_LESS",
                labelPosition: "COLLAPSED",
                value: {
                  a!richTextIcon(
                    icon: "home",
                    size: "MEDIUM_PLUS"
                  ),
                }
              )
            ),
            a!sideBySideItem(
              item: a!headingField(
                marginBelow: "NONE",
                text: "Home",
                fontWeight: "SEMI_BOLD",
                size: "MEDIUM",
                headingTag: "H1"
              )
            )
          }
        )
      },
      height: "AUTO",
      style: "#F0B323",
      padding: "STANDARD",
      marginBelow: "NONE",
      showBorder: false
    )
  },
  contents: {},
  showWhen: true,
  backgroundColor: "WHITE"
)
