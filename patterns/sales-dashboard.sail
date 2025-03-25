a!localVariables(
  local!selectedAccountExec,
  /* This variable would normally be retrieved with a rule like rule!getOpportunities(). Here, a random set of opportunities is generated. */
  local!opportunities: a!forEach(
    items: enumerate(100) + 1,
    expression: {
      id: fv!item,
      accountExecId: tointeger(round(rand() * 14, 0)),
      stage: round(rand() * 7, 0),
      amount: (round(rand(), 1) * 250000) + 300000
    }
  ),
  local!oppsTarget: 75,
  local!conversionTarget: 5,
  local!dealSizeTarget: 425,
  local!pipelineTarget: 50,
  a!headerContentLayout(
    contents: {
      a!columnsLayout(
        columns: {
          a!columnLayout(
            contents: {
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: {
                      a!localVariables(
                        /* This value would normally be retrieved with a rule that aggregates *
                       * to get the total count of opportunities.                           */
                        local!totalActiveOpps: (round(rand()*10, 0)*3)+70,
                        {
                          a!cardLayout(
                            contents: {
                              a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(text: {"TOTAL ACTIVE OPPS"}, color: "SECONDARY", style: "STRONG")
                                }
                              ),
                              a!sideBySideLayout(
                                items: {
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(text: {local!totalActiveOpps},
                                                       color: if(local!totalActiveOpps >= local!oppsTarget, "POSITIVE", "NEGATIVE"),
                                                       size: "LARGE"),
                                        " ",
                                        a!richTextIcon(icon: "handshake-o", size: "LARGE")
                                      }
                                    )
                                  ),
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextIcon(icon: "bullseye", color: "SECONDARY"),
                                        " ",
                                        a!richTextItem(text: {local!oppsTarget}, color: "SECONDARY")
                                      },
                                      align: "RIGHT"
                                    ),
                                    width: "MINIMIZE"
                                  )
                                },
                                alignVertical: "BOTTOM"
                              )
                            },
                            height: "AUTO"
                          )
                        }
                      )
                    }
                  ),
                  a!columnLayout(
                    contents: {
                      a!localVariables(
                        /* This value would normally be retrieved with a query that aggregates *
                       * to get the average conversion rate of all account execs.            */
                        local!conversionRate: round(rand()*10, 1),
                        {
                          a!cardLayout(
                            contents: {
                              a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(text: {"AVG CONVERSION RATE"}, color: "SECONDARY", style: "STRONG")
                                }
                              ),
                              a!sideBySideLayout(
                                items: {
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: {
                                            local!conversionRate,
                                            "%",
                                            " "
                                          },
                                          color: if(local!conversionRate >= local!conversionTarget, "POSITIVE", "NEGATIVE"),
                                          size: "LARGE"
                                        ),
                                        a!richTextIcon(icon: "refresh", size: "LARGE")
                                      }
                                    )
                                  ),
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextIcon(icon: "bullseye", color: "SECONDARY"),
                                        " ",
                                        a!richTextItem(
                                          text: {
                                            local!conversionTarget,
                                            "%"
                                          },
                                          color: "SECONDARY"
                                        )
                                      },
                                      align: "RIGHT"
                                    ),
                                    width: "MINIMIZE"
                                  )
                                },
                                alignVertical: "BOTTOM"
                              )
                            },
                            height: "AUTO"
                          )
                        }
                      )
                    }
                  )
                },
                stackWhen: {
                  "PHONE",
                  "TABLET_PORTRAIT"
                }
              )
            }
          ),
          a!columnLayout(
            contents: {
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: {
                      a!localVariables(
                        /* This value would normally be retrieved with a rule that aggregates *
                       * to get the average value of opportunities.                         */
                        local!avgDealSize: round(rand()*100, 0) + 375,
                        {
                          a!cardLayout(
                            contents: {
                              a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(text: {"AVG DEAL SIZE"}, color: "SECONDARY", style: "STRONG")
                                }
                              ),
                              a!sideBySideLayout(
                                items: {
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: {
                                            "$",
                                            local!avgDealSize,
                                            "K",
                                            " "
                                          },
                                          color: if(local!avgDealSize >= local!dealSizeTarget, "POSITIVE", "NEGATIVE"),
                                          size: "LARGE"
                                        ),
                                        a!richTextIcon(icon: "money", size: "LARGE")
                                      }
                                    )
                                  ),
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextIcon(icon: "bullseye", color: "SECONDARY"),
                                        " ",
                                        a!richTextItem(text: {"$", local!dealSizeTarget, "K"}, color: "SECONDARY")
                                      },
                                      align: "RIGHT"
                                    ),
                                    width: "MINIMIZE"
                                  )
                                },
                                alignVertical: "BOTTOM"
                              )
                            },
                            height: "AUTO"
                          )
                        }
                      )
                    }
                  ),
                  a!columnLayout(
                    contents: {
                      a!localVariables(
                        /* This value would normally be retrieved with a rule that aggregates *
                       * to get the total sum of all opportunity values.                    */
                        local!totalPipeline: round(rand()*10, 1) + 45,
                        {
                          a!cardLayout(
                            contents: {
                              a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(text: {"TOTAL PIPELINE"}, color: "SECONDARY", style: "STRONG")
                                }
                              ),
                              a!sideBySideLayout(
                                items: {
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: {"$", local!totalPipeline, "M"},
                                          color: if(local!totalPipeline >= local!pipelineTarget, "POSITIVE", "NEGATIVE"),
                                          size: "LARGE"
                                        ),
                                        " ",
                                        a!richTextIcon(icon: "line-chart", size: "LARGE")
                                      }
                                    )
                                  ),
                                  a!sideBySideItem(
                                    item: a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextIcon(icon: "bullseye", color: "SECONDARY"),
                                        " ",
                                        a!richTextItem(text: {"$", local!pipelineTarget, "M"}, color: "SECONDARY")
                                      },
                                      align: "RIGHT"
                                    ),
                                    width: "MINIMIZE"
                                  )
                                },
                                alignVertical: "BOTTOM"
                              )
                            },
                            height: "AUTO"
                          )
                        }
                      )
                    }
                  )
                },
                stackWhen: {
                  "PHONE",
                  "TABLET_PORTRAIT"
                }
              )
            }
          )
        },
        stackWhen: {
          "PHONE",
          "TABLET_PORTRAIT",
          "TABLET_LANDSCAPE"
        }
      ),
      a!columnsLayout(
        columns: {
          a!columnLayout(
            contents: {
              a!cardLayout(
                contents: {
                  a!gridField(
                    labelPosition: "COLLAPSED",
                    /* Replace this with a query to get account exec info, using fv!pagingInfo */
                    data: todatasubset(
                      {
                        /* The display names would normally be calculated later, based on the usernames. *
                   * Since these usernames are fake, we're providing display names directly.       */
                        a!map(id: 1,  username: "karen.phillips",   displayName: "Karen Phillips",   numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 2,  username: "suzanne.fletcher", displayName: "Suzanne Fletcher", numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 3,  username: "thomas.reed",      displayName: "Thomas Reed",      numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 4,  username: "vincent.buchanan", displayName: "Vincent Buchanan", numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 5,  username: "oscar.kim",        displayName: "Oscar Kim",        numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 6,  username: "simone.ferguson",  displayName: "Simone Ferguson",  numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 7,  username: "james.smith",      displayName: "James Smith",      numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 8,  username: "carolyn.wall",     displayName: "Carolyn Wall",     numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 9,  username: "franklin.stewart", displayName: "Franklin Stewart", numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 10, username: "dillon.booth",     displayName: "Dillon Booth",     numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 11, username: "josh.moreno",      displayName: "Josh Moreno",      numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 12, username: "conor.hale",       displayName: "Conor Hale",       numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 13, username: "elliana.white",    displayName: "Elliana White",    numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1)),
                        a!map(id: 14, username: "greg.oliver",      displayName: "Greg Oliver",      numOpps: round(rand()*10, 0)+4, totalAmt: round(rand()*10, 2)*1000000, conversion: round(rand() * 10, 1))
                      },
                      fv!pagingInfo
                    ),
                    columns: {
                      a!gridColumn(
                        label: "Account Exec",
                        sortField: "displayName",
                        value: fv!row.displayName
                      ),
                      a!gridColumn(
                        sortField: "username",
                        value: a!imageField(
                          images: {a!userImage(user: fv!row.username)},
                          size: "TINY",
                          style: "AVATAR"
                        )
                      ),
                      a!gridColumn(
                        label: "# Opps",
                        sortField: "numOpps",
                        value: fv!row.numOpps,
                        align: "END"
                      ),
                      a!gridColumn(
                        label: "Total Amt",
                        sortField: "totalAmt",
                        value: a!currency(isoCode: "USD", value: fv!row.totalAmt, decimalPlaces: 0, format: "SYMBOL"),
                        align: "END"
                      ),
                      a!gridColumn(
                        label: "Conversion",
                        sortField: "conversion",
                        value: a!richTextDisplayField(
                          value: {
                            a!richTextItem(
                              text: {fv!row.conversion, "%"},
                              color: if(tointeger(fv!row.conversion) > 7, "POSITIVE", "NEGATIVE")
                            )
                          },
                          align: "RIGHT"
                        ),
                        align: "END"
                      )
                    },
                    pageSize: 14,
                    initialSorts: {a!sortInfo("totalAmt", false)},
                    selectable: true,
                    selectionStyle: "ROW_HIGHLIGHT",
                    selectionValue: index(local!selectedAccountExec, "id", {}),
                    selectionSaveInto: {
                      /* This save replaces the value of the previously selected item with that of the newly selected item, ensuring only one item can be selected at once. */
                      a!save(
                        local!selectedAccountExec,
                        if(
                          length(fv!selectedRows) > 1,
                          fv!selectedRows[2],
                          fv!selectedRows
                        )
                      ),
                      /* If you deselect a row, this save brings you back to the original state of the interface. */
                      if(
                        length(fv!deselectedRows) > 0,
                        a!save(local!selectedAccountExec, null),
                        {}
                      )
                    },
                    spacing: "DENSE",
                    height: "MEDIUM",
                    borderStyle: "LIGHT",
                    rowHeader: 1
                  )
                },
                height: "AUTO",
                style: "NONE",
                marginBelow: "STANDARD"
              )
            }
          ),
          a!columnLayout(
            contents: {
              a!cardLayout(
                contents: {
                  a!columnChartField(
                    /* If we have a selected AccountExec, look for their name to display */
                    label: if(
                  isnull(local!selectedAccountExec),
                  "",
                  local!selectedAccountExec.displayName & ": "
                ) & "Opportunities By Pipeline Stage",
                    categories: {"Stage 1", "Stage 2", "Stage 3", "Stage 4", "Stage 5", "Stage 6", "Stage 7"},
                    series: a!chartSeries(
                      label: "# Opportunities",
                      data: a!forEach(
                        items: enumerate(7) + 1,
                        expression: a!localVariables(
                          local!oppsForStage: index(local!opportunities, wherecontains(fv!item, tointeger(local!opportunities.stage))),
                          /* If we have a selected AccountExec, look for only their opportunities */
                          if(
                            isnull(local!selectedAccountExec),
                            count(local!oppsForStage),
                            count(where(local!selectedAccountExec.id = tointeger(local!oppsForStage.accountExecId)))
                          )
                        )
                      )
                    ),
                    showLegend: false,
                    showTooltips: true,
                    labelPosition: "ABOVE",
                    colorScheme: "OCEAN"
                  )
                },
                height: "AUTO",
                style: "NONE",
                marginBelow: "STANDARD"
              )
            }
          )
        },
        stackWhen: {
          "PHONE",
          "TABLET_PORTRAIT"
        }
      )
    },
    /*Set the background to be transparent*/
    /*This will appear grey in Sites*/
    /*and match the defined background color in Tempo*/
    backgroundColor: "TRANSPARENT"
  )
)