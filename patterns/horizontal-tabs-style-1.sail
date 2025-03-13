a!headerContentLayout(
  header: {
    a!cardLayout(
      contents: {
        a!cardLayout(
          contents: {
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: {
                    "My Account"
                  },
                  size: "LARGE_PLUS",
                  style: {
                    "STRONG"
                  }
                )
              }
            )
          },
          height: "AUTO",
          style: "NONE",
          padding: "MORE",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: {
                                    "Overview"
                                  },
                                  size: "MEDIUM",
                                  style: {
                                    "STRONG"
                                  }
                                )
                              },
                              align: "CENTER"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          marginBelow: "NONE",
                          showBorder: false,
                          accessibilityText: "Navigation tab selected"
                        ),
                        a!cardLayout(
                          contents: {},
                          height: "AUTO",
                          style: "#222",
                          padding: "EVEN_LESS",
                          marginBelow: "NONE",
                          showBorder: false
                        )
                      },
                      link: a!dynamicLink(
                        label: "Dynamic Link",
                        saveInto: {}
                      ),
                      height: "AUTO",
                      style: "NONE",
                      padding: "NONE",
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
                        a!cardLayout(
                          contents: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: {
                                    "Claims"
                                  },
                                  size: "MEDIUM"
                                )
                              },
                              align: "CENTER"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {},
                          height: "AUTO",
                          padding: "EVEN_LESS",
                          marginBelow: "NONE",
                          showBorder: false
                        )
                      },
                      link: a!dynamicLink(
                        label: "Dynamic Link",
                        saveInto: {}
                      ),
                      height: "AUTO",
                      style: "NONE",
                      padding: "NONE",
                      marginBelow: "NONE",
                      showBorder: false,
                      accessibilityText: "Navigation tab not selected"
                    )
                  },
                  width: "NARROW"
                ),
                a!columnLayout(
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: {
                                    "Preferences"
                                  },
                                  size: "MEDIUM"
                                )
                              },
                              align: "CENTER"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {},
                          height: "AUTO",
                          padding: "EVEN_LESS",
                          marginBelow: "NONE",
                          showBorder: false
                        )
                      },
                      link: a!dynamicLink(
                        label: "Dynamic Link",
                        saveInto: {}
                      ),
                      height: "AUTO",
                      style: "NONE",
                      padding: "NONE",
                      marginBelow: "NONE",
                      showBorder: false,
                      accessibilityText: "Navigation tab not selected"
                    )
                  },
                  width: "NARROW"
                ),
                a!columnLayout(
                  contents: {}
                )
              },
              spacing: "DENSE",
              stackWhen: {
                "NEVER"
              }
            )
          },
          height: "AUTO",
          style: "NONE",
          padding: "NONE",
          marginBelow: "NONE",
          showBorder: false
        )
      },
      height: "AUTO",
      style: "#fff",
      padding: "NONE",
      marginBelow: "MORE",
      showBorder: false
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {}
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Payment",
              labelSize: "MEDIUM",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!sectionLayout(
                      label: "NEXT PAYMENT",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      "$123.45"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      "Due July 1"
                                    },
                                    size: "MEDIUM_PLUS"
                                  )
                                }
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
                      label: "PAYMENT SOURCE",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      "Pine Street Bank xxxx3456"
                                    },
                                    size: "MEDIUM"
                                  )
                                }
                              ),
                              width: "AUTO"
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      "Edit"
                                    },
                                    link: a!safeLink(
                                      uri: "www.appian.com",
                                      openLinkIn: "NEW_TAB"
                                    ),
                                    linkStyle: "STANDALONE"
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
                              item: a!tagField(
                                label: "Tag Field",
                                labelPosition: "COLLAPSED",
                                tags: {
                                  a!tagItem(
                                    text: "AUTOPAY",
                                    backgroundColor: "#222"
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
                                    text: {
                                      "Withdraw balance due each month on due date"
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
                      divider: "NONE",
                      marginBelow: "NONE"
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  padding: "STANDARD",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              },
              marginBelow: "MORE"
            ),
            a!sectionLayout(
              label: "Insured Drivers",
              labelSize: "MEDIUM",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!sectionLayout(
                      label: "PRIMARY",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(
                                labelPosition: "COLLAPSED",
                                text: "J",
                                backgroundColor: "#222",
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
                                      "Jane"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      "44-year-old female"
                                    },
                                    size: "MEDIUM"
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
                                    text: {
                                      "Edit"
                                    },
                                    link: a!safeLink(
                                      uri: "www.appian.com",
                                      openLinkIn: "NEW_TAB"
                                    ),
                                    linkStyle: "STANDALONE"
                                  )
                                }
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
                      label: "SPOUSE",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(
                                labelPosition: "COLLAPSED",
                                text: "S",
                                backgroundColor: "#222",
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
                                      "Sharif"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      "42-year-old male"
                                    },
                                    size: "MEDIUM"
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
                                    text: {
                                      "Edit"
                                    },
                                    link: a!safeLink(
                                      uri: "www.appian.com",
                                      openLinkIn: "NEW_TAB"
                                    ),
                                    linkStyle: "STANDALONE"
                                  )
                                }
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
                      label: "DEPENDENT CHILD",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(
                                labelPosition: "COLLAPSED",
                                text: "B",
                                backgroundColor: "#222",
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
                                      "Benjamin"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      "16-year-old male"
                                    },
                                    size: "MEDIUM"
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
                                    text: {
                                      "Edit"
                                    },
                                    link: a!safeLink(
                                      uri: "www.appian.com",
                                      openLinkIn: "NEW_TAB"
                                    ),
                                    linkStyle: "STANDALONE"
                                  )
                                }
                              ),
                              width: "MINIMIZE"
                            )
                          },
                          alignVertical: "MIDDLE"
                        )
                      },
                      divider: "NONE",
                      marginBelow: "NONE"
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  padding: "STANDARD",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              },
              marginBelow: "MORE"
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Vehicles & Coverage",
              labelSize: "MEDIUM",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!sectionLayout(
                      label: "VEHICLE 1",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: {
                                        "2021 Polestar 2"
                                      },
                                      size: "MEDIUM_PLUS",
                                      style: {
                                        "STRONG"
                                      }
                                    ),
                                    char(10),
                                    a!richTextItem(
                                      text: {
                                        a!richTextItem(
                                          text: {
                                            "Edit"
                                          },
                                          size: "STANDARD"
                                        )
                                      },
                                      link: a!safeLink(
                                        uri: "www.appian.com",
                                        openLinkIn: "NEW_TAB"
                                      ),
                                      linkStyle: "STANDALONE"
                                    )
                                  }
                                )
                              }
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  label: "Comprehensive",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$500 Deductible"
                                  }
                                ),
                                a!richTextDisplayField(
                                  label: "Collision",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$500 Deductible"
                                  }
                                ),
                                a!richTextDisplayField(
                                  label: "Bodily Injury",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$250,000 Limit Per Person",
                                    char(10),
                                    "$500,000 Limit Per Incident"
                                  }
                                ),
                                a!richTextDisplayField(
                                  label: "Property Damage",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$100,000 Limit Per Incident"
                                  }
                                ),
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: {
                                        "Show More"
                                      },
                                      link: a!safeLink(
                                        uri: "www.appian.com",
                                        openLinkIn: "NEW_TAB"
                                      ),
                                      linkStyle: "STANDALONE"
                                    )
                                  }
                                )
                              }
                            )
                          }
                        )
                      },
                      divider: "BELOW"
                    ),
                    a!sectionLayout(
                      label: "VEHICLE 2",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: {
                                        "2009 Saab 9-5"
                                      },
                                      size: "MEDIUM_PLUS",
                                      style: {
                                        "STRONG"
                                      }
                                    ),
                                    char(10),
                                    a!richTextItem(
                                      text: {
                                        a!richTextItem(
                                          text: {
                                            "Edit"
                                          },
                                          size: "STANDARD"
                                        )
                                      },
                                      link: a!safeLink(
                                        uri: "www.appian.com",
                                        openLinkIn: "NEW_TAB"
                                      ),
                                      linkStyle: "STANDALONE"
                                    )
                                  }
                                )
                              }
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  label: "Comprehensive",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$500 Deductible"
                                  }
                                ),
                                a!richTextDisplayField(
                                  label: "Collision",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$500 Deductible"
                                  }
                                ),
                                a!richTextDisplayField(
                                  label: "Bodily Injury",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$250,000 Limit Per Person",
                                    char(10),
                                    "$500,000 Limit Per Incident"
                                  }
                                ),
                                a!richTextDisplayField(
                                  label: "Property Damage",
                                  labelPosition: "ABOVE",
                                  value: {
                                    "$100,000 Limit Per Incident"
                                  }
                                ),
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: {
                                        "Show More"
                                      },
                                      link: a!safeLink(
                                        uri: "www.appian.com",
                                        openLinkIn: "NEW_TAB"
                                      ),
                                      linkStyle: "STANDALONE"
                                    )
                                  }
                                )
                              }
                            )
                          }
                        )
                      },
                      divider: "NONE",
                      marginBelow: "NONE"
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  padding: "STANDARD",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              },
              marginBelow: "MORE"
            )
          },
          width: "WIDE"
        ),
        a!columnLayout(
          contents: {}
        )
      },
      stackWhen: {
        "PHONE",
        "TABLET_PORTRAIT",
        "TABLET_LANDSCAPE"
      }
    )
  },
  backgroundColor: "TRANSPARENT"
)
