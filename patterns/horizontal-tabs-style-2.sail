a!localVariables(
  local!tabs: {
    a!map(name: "Home", id: 1),
    a!map(name: "Academics", id: 2),
    a!map(name: "Housing", id: 3),
    a!map(name: "Career Services", id: 4),
    a!map(name: "Financial Aid", id: 5)
  },
  local!selectedTab: 1,
  a!headerContentLayout(
    header: {
      a!cardLayout(
        contents: {
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: {
                  a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextItem(
                        text: { "Good morning, Karen!" },
                        size: "MEDIUM_PLUS",
                        style: { "STRONG" }
                      )
                    }
                  )
                }
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
                              text: {
                                a!richTextIcon(icon: "cloud"),
                                " ",
                                a!richTextItem(text: { "62°F" }, style: { "STRONG" }),
                                " Cloudy"
                              },
                              size: "MEDIUM"
                            )
                          },
                          align: "RIGHT"
                        ),
                        width: if(
                          a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" }),
                          "MINIMIZE",
                          "AUTO"
                        )
                      ),
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "High ",
                                a!richTextItem(text: { "71°" }, style: { "STRONG" }),
                                "F "
                              },
                              size: "MEDIUM"
                            )
                          },
                          align: "RIGHT"
                        ),
                        width: "MINIMIZE"
                      ),
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "Low ",
                                a!richTextItem(text: { "54°" }, style: { "STRONG" }),
                                "F "
                              },
                              size: "MEDIUM"
                            )
                          },
                          align: "RIGHT"
                        ),
                        width: "MINIMIZE"
                      )
                    },
                    alignVertical: "MIDDLE",
                    spacing: "SPARSE"
                  )
                }
              )
            },
            alignVertical: "MIDDLE",
            marginAbove: "STANDARD",
            marginBelow: "LESS",
            stackWhen: { "PHONE", "TABLET_PORTRAIT" }
          )
        },
        height: "AUTO",
        style: "#230f3d",
        padding: "STANDARD",
        marginBelow: "NONE",
        showBorder: false
      )
    },
    contents: {
      a!columnsLayout(
        columns: {
          a!forEach(
            local!tabs,
            a!columnLayout(
              contents: {
                a!cardLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { fv!item.name },
                          size: "MEDIUM",
                          style: if(
                            local!selectedTab = fv!item.id,
                            { "STRONG" },
                            "PLAIN"
                          )
                        )
                      },
                      preventWrapping: true,
                      align: "CENTER"
                    )
                  },
                  link: a!dynamicLink(
                    label: fv!item.name & " Tab" & if(
                      local!selectedTab = fv!item.id,
                      " (Selected)",
                      " Not Selected"
                    ),
                    saveInto: { a!save(local!selectedTab, fv!item.id) }
                  ),
                  height: "AUTO",
                  style: if(
                    local!selectedTab = fv!item.id,
                    "#f3f0f6",
                    "#402e57"
                  ),
                  marginBelow: "NONE",
                  showBorder: false,
                  decorativeBarPosition: "TOP",
                  decorativeBarColor: if(
                    local!selectedTab = fv!item.id,
                    "#674ea7",
                    "#402e57"
                  ),
                  accessibilityText: "Selected tab"
                )
              },
              width: "NARROW"
            )
          ),
          a!columnLayout(
            contents: {},
            showWhen: a!isPageWidth(
              {
                "TABLET_LANDSCAPE",
                "DESKTOP_NARROW",
                "DESKTOP",
                "DESKTOP_WIDE"
              }
            )
          )
        },
        marginBelow: "NONE",
        spacing: "DENSE"
      ),
      a!cardLayout(
        contents: {
          choose(
            local!selectedTab,
            /*First tab contents        */
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!sectionLayout(
                      label: "My Class Schedule",
                      labelSize: "MEDIUM",
                      labelColor: "STANDARD",
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(text: { "Monday" }, size: "MEDIUM")
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "9:00AM – 10:00AM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          "CS 3100 Data Structures & Algorithms II"
                                        }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Thompson 404"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE",
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "12:45PM – 2:15PM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: { "CS 3205 HCI in Software Development" }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Flores A201"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE",
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "4:00PM – 5:30PM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          "CS 3701 Introduction to Cybersecurity"
                                        }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Orborne Hall"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          showShadow: true,
                          decorativeBarPosition: "START",
                          decorativeBarColor: "#fff"
                        ),
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "Tuesday" },
                                            size: "MEDIUM",
                                            style: { "STRONG" }
                                          )
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "10:15AM – 11:30AM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: { "KOR 2020 Intermediate Korean II" }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Phillips 329"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE",
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "3:30PM – 4:45PM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: { "CS 4710 Artificial Intelligence" }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Orborne Hall"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          showShadow: true,
                          decorativeBarPosition: "START",
                          decorativeBarColor: "ACCENT"
                        ),
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(text: { "Wednesday" }, size: "MEDIUM")
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "9:00AM – 10:00AM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          "CS 3100 Data Structures & Algorithms II"
                                        }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Thompson 404"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE",
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "12:45PM – 2:15PM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: { "CS 3205 HCI in Software Development" }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Flores A201"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE",
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "4:00PM – 5:30PM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          "CS 3701 Introduction to Cybersecurity"
                                        }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Orborne Hall"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          showShadow: true,
                          decorativeBarPosition: "START",
                          decorativeBarColor: "#fff"
                        ),
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(text: { "Thursday" }, size: "MEDIUM")
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "10:15AM – 11:30AM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: { "KOR 2020 Intermediate Korean II" }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Phillips 329"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE",
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "3:30PM – 4:45PM" },
                                            style: { "STRONG" }
                                          )
                                        }
                                      ),
                                      width: "2X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: { "CS 4710 Artificial Intelligence" }
                                      ),
                                      width: "5X"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(icon: "map-marker"),
                                          " Orborne Hall"
                                        }
                                      ),
                                      width: "2X"
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              divider: "ABOVE"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          showShadow: true,
                          decorativeBarPosition: "START",
                          decorativeBarColor: "#fff"
                        ),
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(text: { "Friday" }, size: "MEDIUM")
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              marginBelow: "NONE"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: { "No classes scheduled" },
                                      color: "SECONDARY"
                                    )
                                  },
                                  align: "CENTER",
                                  marginAbove: "LESS"
                                )
                              },
                              divider: "ABOVE",
                              marginAbove: "NONE",
                              marginBelow: "STANDARD"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          showShadow: true,
                          decorativeBarPosition: "START",
                          decorativeBarColor: "#fff"
                        )
                      }
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!sectionLayout(
                      label: "My Path to Graduation",
                      labelSize: "MEDIUM",
                      labelColor: "STANDARD",
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!gaugeField(
                                    labelPosition: "COLLAPSED",
                                    percentage: 77.0,
                                    primaryText: a!gaugeIcon(icon: "graduation-cap", color: "#555"),
                                    size: "SMALL"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Bachelor of Science (BS)" },
                                        size: "MEDIUM_PLUS"
                                      ),
                                      char(10),
                                      a!richTextItem(text: { "Spring 2022" }, size: "MEDIUM")
                                    }
                                  )
                                )
                              },
                              alignVertical: "MIDDLE",
                              spacing: "SPARSE",
                              marginAbove: "LESS",
                              marginBelow: "STANDARD"
                            ),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: { "REQUIRED CREDITS" },
                                          color: "SECONDARY",
                                          size: "SMALL"
                                        ),
                                        char(10),
                                        a!richTextItem(text: { "120" }, size: "LARGE")
                                      }
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: { "COMPLETED CREDITS" },
                                          color: "SECONDARY",
                                          size: "SMALL"
                                        ),
                                        char(10),
                                        a!richTextItem(text: { "92" }, size: "LARGE")
                                      }
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: { "IN-PROGRESS CREDITS" },
                                          color: "SECONDARY",
                                          size: "SMALL"
                                        ),
                                        char(10),
                                        a!richTextItem(text: { "15" }, size: "LARGE")
                                      }
                                    )
                                  }
                                )
                              },
                              alignVertical: "MIDDLE",
                              showDividers: true
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "check-circle",
                                            color: "POSITIVE",
                                            size: "MEDIUM_PLUS"
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
                                            text: { "Exceed minimum GPA" },
                                            size: "MEDIUM"
                                          )
                                        }
                                      )
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "info-circle",
                                            color: "SECONDARY",
                                            size: "SMALL"
                                          )
                                        }
                                      ),
                                      width: "MINIMIZE"
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                ),
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "check-circle",
                                            color: "POSITIVE",
                                            size: "MEDIUM_PLUS"
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
                                            text: { "Maintain good standing" },
                                            size: "MEDIUM"
                                          )
                                        }
                                      )
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "info-circle",
                                            color: "SECONDARY",
                                            size: "SMALL"
                                          )
                                        }
                                      ),
                                      width: "MINIMIZE"
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                ),
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "circle-o-notch",
                                            color: "SECONDARY",
                                            size: "MEDIUM_PLUS"
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
                                            text: { "Complete required degree classes" },
                                            size: "MEDIUM"
                                          )
                                        }
                                      )
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "info-circle",
                                            color: "SECONDARY",
                                            size: "SMALL"
                                          )
                                        }
                                      ),
                                      width: "MINIMIZE"
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                ),
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "check-circle",
                                            color: "POSITIVE",
                                            size: "MEDIUM_PLUS"
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
                                            text: { "Complete required electives" },
                                            size: "MEDIUM"
                                          )
                                        }
                                      )
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "info-circle",
                                            color: "SECONDARY",
                                            size: "SMALL"
                                          )
                                        }
                                      ),
                                      width: "MINIMIZE"
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              divider: "ABOVE",
                              marginBelow: "EVEN_LESS"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          showShadow: true
                        )
                      }
                    ),
                    a!cardLayout(
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    /*a!documentImage(*/
                                    /*document: cons!READING_ILLUSTRATION*/
                                    /*)*/
                                    
                                  },
                                  size: "FIT",
                                  isThumbnail: false,
                                  style: "STANDARD"
                                )
                              },
                              width: "NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: {
                                        "Spring Semester Class Registration is Now Open"
                                      },
                                      color: "ACCENT",
                                      size: "MEDIUM",
                                      style: { "STRONG" }
                                    )
                                  }
                                ),
                                a!buttonArrayLayout(
                                  buttons: {
                                    a!buttonWidget(
                                      label: "Register Now",
                                      icon: "pen-fancy",
                                      size: "SMALL",
                                      style: "OUTLINE"
                                    )
                                  },
                                  align: "START"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE"
                        )
                      },
                      height: "AUTO",
                      style: "#f1e8f4",
                      marginBelow: "MORE",
                      showBorder: false,
                      showShadow: true,
                      decorativeBarPosition: "TOP",
                      decorativeBarColor: "ACCENT"
                    ),
                    a!sectionLayout(
                      label: "My Support Team",
                      labelSize: "MEDIUM",
                      labelColor: "STANDARD",
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!imageField(
                                        label: "",
                                        labelPosition: "COLLAPSED",
                                        images: {
                                          a!webImage(
                                            source: "https://randomuser.me/api/portraits/women/27.jpg"
                                          )
                                        },
                                        size: "SMALL",
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
                                            text: { "Marsha McCoy" },
                                            size: "MEDIUM",
                                            style: { "STRONG" }
                                          ),
                                          char(10),
                                          "Faculty Advisor"
                                        }
                                      )
                                    ),
                                    a!sideBySideItem(
                                      item: a!buttonArrayLayout(
                                        buttons: {
                                          a!buttonWidget(
                                            label: "Schedule Meeting",
                                            icon: "calendar",
                                            size: "SMALL",
                                            style: "OUTLINE",
                                            color: "SECONDARY"
                                          )
                                        },
                                        align: "START",
                                        marginBelow: "NONE"
                                      ),
                                      width: "MINIMIZE"
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              divider: "BELOW"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!imageField(
                                        label: "",
                                        labelPosition: "COLLAPSED",
                                        images: {
                                          a!webImage(
                                            source: "https://randomuser.me/api/portraits/men/39.jpg"
                                          )
                                        },
                                        size: "SMALL",
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
                                            text: { "Praveen Sharma" },
                                            size: "MEDIUM",
                                            style: { "STRONG" }
                                          ),
                                          char(10),
                                          "Peer Advisor"
                                        }
                                      )
                                    ),
                                    a!sideBySideItem(
                                      item: a!buttonArrayLayout(
                                        buttons: {
                                          a!buttonWidget(
                                            label: "Schedule Meeting",
                                            icon: "calendar",
                                            size: "SMALL",
                                            style: "OUTLINE",
                                            color: "SECONDARY"
                                          )
                                        },
                                        align: "START",
                                        marginBelow: "NONE"
                                      ),
                                      width: "MINIMIZE"
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              divider: "BELOW"
                            ),
                            a!sectionLayout(
                              label: "",
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!imageField(
                                        label: "",
                                        labelPosition: "COLLAPSED",
                                        images: {
                                          a!webImage(
                                            source: "https://randomuser.me/api/portraits/women/59.jpg"
                                          )
                                        },
                                        size: "SMALL",
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
                                            text: { "Sara Vargas" },
                                            size: "MEDIUM",
                                            style: { "STRONG" }
                                          ),
                                          char(10),
                                          "Wellness Coach"
                                        }
                                      )
                                    ),
                                    a!sideBySideItem(
                                      item: a!buttonArrayLayout(
                                        buttons: {
                                          a!buttonWidget(
                                            label: "Schedule Meeting",
                                            icon: "calendar",
                                            size: "SMALL",
                                            style: "OUTLINE",
                                            color: "SECONDARY"
                                          )
                                        },
                                        align: "START",
                                        marginBelow: "NONE"
                                      ),
                                      width: "MINIMIZE"
                                    )
                                  },
                                  alignVertical: "MIDDLE"
                                )
                              },
                              divider: "NONE",
                              marginBelow: "EVEN_LESS"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          showShadow: true
                        )
                      }
                    )
                  },
                  width: "MEDIUM_PLUS"
                )
              },
              spacing: "SPARSE",
              stackWhen: {
                "PHONE",
                "TABLET_PORTRAIT",
                "TABLET_LANDSCAPE",
                "DESKTOP_NARROW"
              }
            ),
            /*Second tab contents        */
            {},
            /*Third tab contents        */
            {},
            /*Fourth tab contents        */
            {},
            /*Fifth tab contents        */
            {}
          )
        },
        height: "AUTO",
        style: "#f3f0f6",
        padding: "MORE",
        marginBelow: "NONE",
        showBorder: false
      )
      
    },
    backgroundColor: "#230f3d",
    contentsPadding: "STANDARD"
  )
)
