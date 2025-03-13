{
  a!columnsLayout(
    columns: {
      a!columnLayout(
        contents: {},
        width: "EXTRA_NARROW"
      ),
      a!columnLayout(
        contents: {
          a!sectionLayout(
            label: "Karen Anderson",
            labelSize: "LARGE_PLUS",
            labelColor: "STANDARD",
            contents: {},
            marginAbove: "EVEN_MORE",
            marginBelow: "EVEN_MORE"
          ),
          a!sectionLayout(
            label: "",
            contents: {
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: {
                      a!sectionLayout(
                        label: "Contact Information",
                        labelSize: "MEDIUM",
                        labelHeadingTag: "H2",
                        labelColor: "ACCENT",
                        contents: {}
                      )
                    },
                    width: "MEDIUM_PLUS"
                  ),
                  a!columnLayout(
                    contents: {
                      a!sectionLayout(
                        label: "",
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
                                          "Email"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "karen.anderson@email.com"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "BELOW",
                        marginBelow: "STANDARD"
                      ),
                      a!sectionLayout(
                        label: "",
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
                                          "Phone Number"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "703.555.1212"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "BELOW"
                      ),
                      a!sectionLayout(
                        label: "",
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
                                          "Mailing Address"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "9836 Rocky River Court "
                                        },
                                        size: "MEDIUM_PLUS"
                                      ),
                                      char(10),
                                      a!richTextItem(
                                        text: {
                                          "Annandale, VA 22003"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "NONE"
                      )
                    }
                  )
                }
              )
            },
            divider: "BELOW",
            marginBelow: "MORE"
          ),
          a!sectionLayout(
            label: "",
            contents: {
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: {
                      a!sectionLayout(
                        label: "Gift Commitment",
                        labelSize: "MEDIUM",
                        labelHeadingTag: "H2",
                        labelColor: "ACCENT",
                        contents: {
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: {
                                  "The supporter's current gift commitment"
                                },
                                color: "SECONDARY"
                              )
                            }
                          )
                        }
                      )
                    },
                    width: "MEDIUM_PLUS"
                  ),
                  a!columnLayout(
                    contents: {
                      a!sectionLayout(
                        label: "",
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
                                          "Frequency"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "Monthly"
                                        },
                                        size: "MEDIUM_PLUS"
                                      ),
                                      char(10),
                                      a!richTextItem(
                                        text: {
                                          "On the 1st of each month"
                                        },
                                        color: "SECONDARY",
                                        size: "STANDARD"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "BELOW",
                        marginBelow: "STANDARD"
                      ),
                      a!sectionLayout(
                        label: "",
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
                                          "Amount"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "$25"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "BELOW"
                      ),
                      a!sectionLayout(
                        label: "",
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
                                          "Source"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "Email Campaign"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "BELOW"
                      ),
                      a!sectionLayout(
                        label: "",
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
                                          "Tier"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "Bronze"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "NONE"
                      )
                    }
                  )
                }
              )
            },
            divider: "BELOW",
            marginBelow: "MORE"
          ),
          a!sectionLayout(
            label: "",
            contents: {
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: {
                      a!sectionLayout(
                        label: "History",
                        labelSize: "MEDIUM",
                        labelHeadingTag: "H2",
                        labelColor: "ACCENT",
                        contents: {
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: {
                                  "Information is available for supporters since 2013"
                                },
                                color: "SECONDARY"
                              )
                            }
                          )
                        }
                      )
                    },
                    width: "MEDIUM_PLUS"
                  ),
                  a!columnLayout(
                    contents: {
                      a!sectionLayout(
                        label: "",
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
                                          "Supporter Since"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "February 2017"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "BELOW",
                        marginBelow: "STANDARD"
                      ),
                      a!sectionLayout(
                        label: "",
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
                                          "Lifetime Giving"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "$1,390"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "BELOW"
                      ),
                      a!sectionLayout(
                        label: "",
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
                                          "Highest Tier Reached"
                                        },
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  )
                                },
                                width: "MEDIUM"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "Gold"
                                        },
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "RIGHT"
                                  )
                                }
                              )
                            },
                            marginBelow: "NONE"
                          )
                        },
                        divider: "NONE"
                      )
                    }
                  )
                }
              )
            },
            divider: "NONE"
          )
        },
        width: "AUTO"
      ),
      a!columnLayout(
        contents: {},
        width: "EXTRA_NARROW"
      )
    }
  )
}