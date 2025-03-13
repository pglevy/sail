a!localVariables(

  /* When user clicks on a tab, its index is persisted to this variable */
  local!selectedTab: 1,

  /* Determines content background color. Set to "WHITE", "TRANSPARENT", "CHARCOAL_SCHEME", "NAVY_SCHEME", "PLUM_SCHEME", or any valid hex code */
  local!headerContentBackgroundColor:"WHITE",

  /* Determines navigation background color */
  local!navBackgroundColor: "#020A51",

  /* Determines top-level navigation text color */
  local!topLevelTextColor: "#FCB858",

  /* Determines selected tab background color */
  local!selectedTabColor: "#2322F0",

  /* Array of text that defines the top-level tabs. Replace with your desired values */
  local!topLevelTabs: { "Cases", "Resources", "Help" },

  /* Array of sub-tab data. Replace with your desired values.
       topLevel: Set to the index of the top-level tab the subtab falls under. This value should not be more than the number of items in the "topLevelTab" array.
       name: Desired name of the tab
  */
  local!subTabs: {
    a!map(topLevel: 1, name: "Dashboard"),
    a!map(topLevel: 1, name: "My Cases"),
    a!map(topLevel: 1, name: "Overdue"),
    a!map(topLevel: 1, name: "All Cases"),
    a!map(topLevel: 2, name: "Popular Links"),
    a!map(topLevel: 2, name: "Knowledge Base"),
    a!map(topLevel: 2, name: "Training"),
    a!map(topLevel: 3, name: "Report an Issue"),
    a!map(topLevel: 3, name: "Support Forum")
  },

  a!headerContentLayout(
    header: {},
    contents: {
      a!columnsLayout(
        columns: {
          a!columnLayout(
            contents: {
              a!cardLayout(
                height: "AUTO",
                style: local!navBackgroundColor,
                marginBelow: "NONE",
                showBorder: false
              ),
              a!forEach(
                items: local!topLevelTabs,
                expression: {
                  a!localVariables(
                    local!topLevel: fv!index,
                    {
                      a!cardLayout(
                        contents: {
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: { upper(fv!item) },
                                color: local!topLevelTextColor,
                                style: { "STRONG" }
                              )
                            }
                          )
                        },
                        height: "AUTO",
                        style: local!navBackgroundColor,
                        padding: "LESS",
                        marginBelow: "NONE",
                        showBorder: false
                      ),
                      a!forEach(
                        items: local!subTabs,
                        expression: {
                          a!cardLayout(
                            contents: {
                              a!sideBySideLayout(
                                items: {
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: { "❘" },
                                          color: if(
                                            fv!index = local!selectedTab,
                                            "STANDARD",
                                            local!navBackgroundColor
                                          ),
                                          size: "LARGE"
                                        )
                                      }
                                    ),
                                    width: "MINIMIZE"
                                  ),
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: { fv!item.name },
                                          color: "STANDARD",
                                          size: "MEDIUM",
                                          style: if(
                                            fv!index = local!selectedTab,
                                            { "STRONG" },
                                            { "PLAIN" }
                                          )
                                        )
                                      },
                                      preventWrapping: true
                                    )
                                  )
                                },
                                alignVertical: "MIDDLE"
                              )
                            },
                            link: a!dynamicLink(
                              label: "Dynamic Link",
                              value: fv!index,
                              saveInto: { local!selectedTab }
                            ),
                            tooltip: "",
                            height: "AUTO",
                            showWhen: fv!item.topLevel = local!topLevel,
                            style: if(
                              fv!index = local!selectedTab,
                              local!selectedTabColor,
                              local!navBackgroundColor
                            ),
                            padding: "EVEN_LESS",
                            marginBelow: "NONE",
                            showBorder: false
                          )
                        }
                      )
                    }
                  )
                }
              ),
              a!cardLayout(
                height: "EXTRA_TALL",
                style: local!navBackgroundColor,
                marginBelow: "NONE",
                showBorder: false
              )
            },
            width: "NARROW"
          ),
          a!columnLayout(
            contents: {
              a!cardLayout(
                contents: {
                  /* Conditionally display selected navigation section.       *
               * Sections are created individually here because they will *
               * have varying contents, so if you change the list in      *
               * local!subtabs, you will need to make sure *
               * the list of sections here is the correct length.         */
                  a!sectionLayout(
                    label: local!subTabs[local!selectedTab].name,
                    labelSize: "LARGE_PLUS",
                    labelHeadingTag: "H1",
                    labelColor: "STANDARD",
                    contents: {

                      choose(
                        local!selectedTab,
                        {},
                        {},
                        {},
                        {},
                        {},
                        {},
                        {},
                        {},
                        {}

                      )
                    }
                  )
                },
                height: "AUTO",
                style: "NONE",
                padding: "MORE",
                marginBelow: "STANDARD",
                showBorder: false
              )
            }
          )
        },
        spacing: "DENSE",
        stackWhen: {
          "PHONE",
          "TABLET_PORTRAIT",
          "TABLET_LANDSCAPE",
          "DESKTOP_NARROW"
        }
      )
    },
    showWhen: true,
    backgroundColor: local!headerContentBackgroundColor,
    contentsPadding: "NONE"
  )
)
