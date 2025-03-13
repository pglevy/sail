a!localVariables(
  local!formSteps: {
    "Choose Permit Area",
    "Select Permit Type",
    "Provide Basic Information",
    "Provide Relevant Details",
    "Payment & Confirmation"
  },
  local!currentFormStep: 1,
  a!headerContentLayout(
    header: {
      a!cardLayout(
        contents: {
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: {
                  a!cardLayout(
                    contents: {
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          char(10),
                          a!richTextItem(
                            text: {
                              a!richTextIcon(icon: "clipboard", color: "STANDARD"),
                              "  Apply for a Permit"
                            },
                            size: "MEDIUM_PLUS",
                            style: { "STRONG" }
                          ),
                          char(10),
                          char(10),
                          char(10)
                        }
                      ),
                      a!forEach(
                        items: local!formSteps,
                        expression: {
                          a!sideBySideLayout(
                            items: {
                              a!sideBySideItem(
                                item: if(
                                  fv!index < local!currentFormStep,
                                  a!stampField(
                                    labelPosition: "COLLAPSED",
                                    icon: "check",
                                    backgroundColor: "ACCENT",
                                    contentColor: "STANDARD",
                                    size: "TINY"
                                  ),
                                  a!stampField(
                                    labelPosition: "COLLAPSED",
                                    text: fv!index,
                                    backgroundColor: if(
                                      fv!index > local!currentFormStep,
                                      "#b7b7b7",
                                      "ACCENT"
                                    ),
                                    contentColor: "STANDARD",
                                    size: "TINY"
                                  )
                                ),
                                width: "MINIMIZE"
                              ),
                              a!sideBySideItem(
                                item: a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: { fv!item },
                                      color: if(
                                        fv!index < local!currentFormStep,
                                        "ACCENT",
                                        "STANDARD"
                                      ),
                                      size: "MEDIUM",
                                      style: if(
                                        fv!index = local!currentFormStep,
                                        "STRONG",
                                        "PLAIN"
                                      )
                                    )
                                  }
                                )
                              )
                            },
                            alignVertical: "MIDDLE",
                            marginBelow: "STANDARD"
                          ),
                          a!cardLayout(
                            contents: {},
                            height: "AUTO",
                            style: "#f0f0f0",
                            padding: "EVEN_LESS",
                            marginBelow: "NONE",
                            showBorder: false
                          )
                        }
                      ),
                      a!cardLayout(
                        contents: {},
                        height: "EXTRA_TALL",
                        style: "#f0f0f0",
                        marginBelow: "STANDARD",
                        showBorder: false
                      )
                    },
                    height: "AUTO",
                    style: "#f0f0f0",
                    padding: "MORE",
                    marginBelow: "NONE",
                    showBorder: false
                  )
                },
                width: "MEDIUM"
              ),
              a!columnLayout(
                contents: {
                  a!columnsLayout(
                    columns: {
                      a!columnLayout(contents: {}),
                      a!columnLayout(
                        contents: {
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              char(10),
                              char(10),
                              char(10),
                              a!richTextItem(
                                text: { local!formSteps[local!currentFormStep] },
                                size: "LARGE"
                              ),
                              char(10),
                              char(10),
                              char(10)
                            }
                          ),
                          {
                            a!cardLayout(
                              contents: {
                                a!localVariables(
                                  local!areaChoices: {
                                    a!map(
                                      id: 1,
                                      icon: "home",
                                      primaryText: "Residential"
                                    ),
                                    a!map(
                                      id: 2,
                                      icon: "building-o",
                                      primaryText: "Commercial"
                                    )
                                  },
                                  local!selectedarea: 1,
                                  {
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: repeat(3, char(10)),
                                      align: "CENTER"
                                    ),
                                    a!cardChoiceField(
                                      label: "area Choices",
                                      labelPosition: "COLLAPSED",
                                      data: local!areaChoices,
                                      cardTemplate: a!cardTemplateTile(
                                        id: fv!data.id,
                                        primaryText: fv!data.primaryText,
                                        icon: fv!data.icon
                                      ),
                                      value: local!selectedarea,
                                      saveInto: local!selectedarea,
                                      maxSelections: 1,
                                      align: "CENTER"
                                    ),
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: repeat(3, char(10)),
                                      align: "CENTER"
                                    ),
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: repeat(3, char(10)),
                                      align: "CENTER"
                                    )
                                  }
                                )
                              },
                              showWhen: local!currentFormStep = 1,
                              showBorder: false
                            ),
                            a!cardLayout(
                              contents: {},
                              showWhen: local!currentFormStep = 2,
                              showBorder: false
                            ),
                            a!cardLayout(
                              contents: {},
                              showWhen: local!currentFormStep = 3,
                              showBorder: false
                            ),
                            a!cardLayout(
                              contents: {},
                              showWhen: local!currentFormStep = 4,
                              showBorder: false
                            ),
                            a!cardLayout(
                              contents: {},
                              showWhen: local!currentFormStep = 5,
                              showBorder: false
                            )
                          },
                          a!sectionLayout(
                            label: "",
                            contents: {
                              a!columnsLayout(
                                columns: {
                                  a!columnLayout(
                                    contents: {
                                      a!buttonArrayLayout(
                                        buttons: {
                                          a!buttonWidget(
                                            label: "Back",
                                            value: local!currentFormStep - 1,
                                            saveInto: local!currentFormStep,
                                            style: "OUTLINE"
                                          ),
                                          a!buttonWidget(
                                            label: "Cancel",
                                            submit: true,
                                            style: "LINK"
                                          )
                                        },
                                        align: "START",
                                        marginBelow: "NONE"
                                      )
                                    }
                                  ),
                                  a!columnLayout(
                                    contents: {
                                      a!buttonArrayLayout(
                                        buttons: {
                                          a!buttonWidget(
                                            label: "Next",
                                            value: local!currentFormStep + 1,
                                            saveInto: local!currentFormStep,
                                            style: "SOLID",
                                            showWhen: local!currentFormStep < count(local!formSteps)
                                          ),
                                          a!buttonWidget(
                                            label: "Submit Application",
                                            saveInto: {
                                              a!save(ri!basePermit.requestedDateTime, now()),
                                              a!save(
                                                ri!basePermit.requestedBy,
                                                loggedInUser()
                                              )
                                            },
                                            submit: true,
                                            style: "SOLID",
                                            showWhen: local!currentFormStep = count(local!formSteps)
                                          )
                                        },
                                        align: "END",
                                        marginBelow: "NONE"
                                      )
                                    }
                                  )
                                }
                              )
                            },
                            divider: "ABOVE"
                          )
                        },
                        width: "MEDIUM_PLUS"
                      ),
                      a!columnLayout(contents: {})
                    }
                  )
                }
              )
            }
          )
        },
        height: "AUTO",
        padding: "NONE",
        marginBelow: "NONE",
        showBorder: false
      )
    },
    contents: {}
  )
)
