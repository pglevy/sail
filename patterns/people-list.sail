{
  a!columnsLayout(
    columns: {
      a!columnLayout(
        contents: {
          a!sideBySideLayout(
            items: {
              a!sideBySideItem(
                item: a!imageField(
                  label: "User Photo",
                  labelPosition: "COLLAPSED",
                  images: {
                    a!userImage(
                      user: "charles.tsui.s"
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
                      text: {
                        "Karen Anderson"
                      },
                      color: "ACCENT",
                      style: {
                        "STRONG"
                      }
                    ),
                    char(10),
                    a!richTextItem(
                      text: {
                        "Vice President, Business Development"
                      },
                      color: "SECONDARY"
                    )
                  }
                )
              )
            },
            alignVertical: "MIDDLE"
          ),
          a!sideBySideLayout(
            items: {
              a!sideBySideItem(
                item: a!stampField(
                  labelPosition: "COLLAPSED",
                  text: "JG",
                  backgroundColor: "#674ea7",
                  contentColor: "STANDARD",
                  size: "TINY"
                ),
                width: "MINIMIZE"
              ),
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(
                      text: {
                        "Joel Guzman"
                      },
                      color: "ACCENT",
                      style: {
                        "STRONG"
                      }
                    ),
                    char(10),
                    a!richTextItem(
                      text: {
                        "Regional Account Executive"
                      },
                      color: "SECONDARY"
                    )
                  }
                )
              )
            },
            alignVertical: "MIDDLE"
          ),
          a!sideBySideLayout(
            items: {
              a!sideBySideItem(
                item: a!stampField(
                  labelPosition: "COLLAPSED",
                  text: "MH",
                  backgroundColor: "#38761d",
                  contentColor: "STANDARD",
                  size: "TINY"
                ),
                width: "MINIMIZE"
              ),
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(
                      text: {
                        "Marc Horton"
                      },
                      color: "ACCENT",
                      style: {
                        "STRONG"
                      }
                    ),
                    char(10),
                    a!richTextItem(
                      text: {
                        "Manager, Business Development"
                      },
                      color: "SECONDARY"
                    )
                  }
                )
              )
            },
            alignVertical: "MIDDLE"
          ),
          a!sideBySideLayout(
            items: {
              a!sideBySideItem(
                item: a!stampField(
                  labelPosition: "COLLAPSED",
                  text: "TZ",
                  backgroundColor: "#990000",
                  contentColor: "STANDARD",
                  size: "TINY"
                ),
                width: "MINIMIZE"
              ),
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(
                      text: {
                        "Tracy Zimmerman"
                      },
                      color: "ACCENT",
                      style: {
                        "STRONG"
                      }
                    ),
                    char(10),
                    a!richTextItem(
                      text: {
                        "Senior Business Development Representative"
                      },
                      color: "SECONDARY"
                    )
                  }
                )
              )
            },
            alignVertical: "MIDDLE"
          )
        },
        width: "MEDIUM"
      ),
      a!columnLayout(
        contents: {}
      )
    }
  )
}
