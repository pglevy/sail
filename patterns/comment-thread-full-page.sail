a!headerContentLayout(
  header: {},
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(contents: {}),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Let's brainstorm ideas for how to 10x our search engine marketing success",
              labelSize: "LARGE",
              labelColor: "STANDARD",
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(
                      text: {
                        a!richTextIcon(icon: "chevron-left"),
                        " Back to all topics"
                      },
                      link: a!safeLink(
                        uri: "www.appian.com",
                        openLinkIn: "NEW_TAB"
                      ),
                      linkStyle: "STANDALONE"
                    )
                  }
                ),
                a!columnsLayout(
                  columns: {
                    a!columnLayout(
                      contents: {
                        a!imageField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          images: {
                            a!webImage(
                              source: "https://randomuser.me/api/portraits/women/90.jpg"
                            )
                          },
                          size: "SMALL",
                          isThumbnail: false,
                          style: "AVATAR"
                        )
                      },
                      width: "EXTRA_NARROW"
                    ),
                    a!columnLayout(
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: { "Irena Kim" },
                                    size: "MEDIUM",
                                    style: { "STRONG" }
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
                                    text: { "4 days ago" },
                                    color: "SECONDARY",
                                    size: "STANDARD"
                                  )
                                }
                              )
                            )
                          },
                          alignVertical: "BOTTOM",
                          spacing: "STANDARD"
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                              },
                              size: "MEDIUM"
                            )
                          }
                        )
                      }
                    )
                  },
                  marginAbove: "MORE",
                  spacing: "DENSE"
                ),
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(
                      text: { "4 Comments" },
                      size: "MEDIUM",
                      style: { "STRONG" }
                    )
                  },
                  marginAbove: "MORE",
                  marginBelow: "MORE"
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!imageField(
                        label: "",
                        labelPosition: "COLLAPSED",
                        images: {},
                        size: "TINY",
                        isThumbnail: false,
                        style: "AVATAR"
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!paragraphField(
                        label: "Post a Comment",
                        labelPosition: "COLLAPSED",
                        placeholder: "Type your comment here...",
                        saveInto: {},
                        refreshAfter: "UNFOCUS",
                        height: "MEDIUM",
                        validations: {}
                      )
                    )
                  },
                  alignVertical: "TOP"
                ),
                a!buttonArrayLayout(
                  buttons: {
                    a!buttonWidget(label: "Post Comment", style: "SOLID")
                  },
                  align: "END",
                  marginBelow: "MORE"
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!imageField(
                        label: "",
                        labelPosition: "COLLAPSED",
                        images: {
                          a!webImage(
                            source: "https://randomuser.me/api/portraits/women/90.jpg"
                          )
                        },
                        size: "TINY",
                        isThumbnail: false,
                        style: "AVATAR"
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(text: { "Irena Kim " }, style: { "STRONG" }),
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          char(10),
                          char(10),
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse ",
                          a!richTextItem(
                            text: {
                              a!richTextItem(text: { "...more" }, style: { "STRONG" })
                            },
                            link: a!safeLink(
                              uri: "www.appian.com",
                              openLinkIn: "NEW_TAB"
                            ),
                            linkStyle: "STANDALONE"
                          ),
                          char(10),
                          a!richTextItem(
                            text: { "5 minutes ago" },
                            color: "SECONDARY",
                            size: "SMALL"
                          )
                        },
                        /*marginAbove: "LESS"*/
                      )
                    )
                  },
                  alignVertical: "TOP",
                  marginBelow: "MORE"
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!imageField(
                        label: "",
                        labelPosition: "COLLAPSED",
                        images: {
                          a!webImage(
                            source: "https://randomuser.me/api/portraits/men/80.jpg"
                          )
                        },
                        size: "TINY",
                        isThumbnail: false,
                        style: "AVATAR"
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: { "Logan Douglas " },
                            style: { "STRONG" }
                          ),
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          char(10),
                          a!richTextItem(
                            text: { "2 hours ago" },
                            color: "SECONDARY",
                            size: "SMALL"
                          )
                        },
                        /*marginAbove: "LESS"*/
                      )
                    )
                  },
                  alignVertical: "TOP",
                  marginBelow: "MORE"
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!imageField(
                        label: "",
                        labelPosition: "COLLAPSED",
                        images: {
                          a!webImage(
                            source: "https://randomuser.me/api/portraits/women/90.jpg"
                          )
                        },
                        size: "TINY",
                        isThumbnail: false,
                        style: "AVATAR"
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(text: { "Irena Kim " }, style: { "STRONG" }),
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          char(10),
                          a!richTextItem(
                            text: { "Yesterday 10:19AM" },
                            color: "SECONDARY",
                            size: "SMALL"
                          )
                        },
                        /*marginAbove: "LESS"*/
                      )
                    )
                  },
                  alignVertical: "TOP",
                  marginBelow: "MORE"
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!imageField(
                        label: "",
                        labelPosition: "COLLAPSED",
                        images: {
                          a!webImage(
                            source: "https://randomuser.me/api/portraits/women/53.jpg"
                          )
                        },
                        size: "TINY",
                        isThumbnail: false,
                        style: "AVATAR"
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(text: { "Cheryl Hale " }, style: { "STRONG" }),
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          char(10),
                          a!richTextItem(
                            text: { "2 days ago" },
                            color: "SECONDARY",
                            size: "SMALL"
                          )
                        },
                        /*marginAbove: "LESS"*/
                      )
                    )
                  },
                  alignVertical: "TOP"
                )
              }
            )
          },
          width: "WIDE"
        ),
        a!columnLayout(contents: {})
      }
    )
  },
  backgroundColor: "WHITE"
)
