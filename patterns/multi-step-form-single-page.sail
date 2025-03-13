a!headerContentLayout(
  header: {
	a!cardLayout(
  	contents: {
    	a!columnsLayout(
      	columns: {
        	a!columnLayout(
          	contents: {}
        	),
        	a!columnLayout(
          	contents: {
            	a!richTextDisplayField(
              	labelPosition: "COLLAPSED",
              	value: {
                	char(10),
                	char(10),
                	a!richTextItem(
                  	text: {
                    	"Create New Campaign"
                  	},
                  	size: "LARGE"
                	),
                	char(10),
                	char(10)
              	}
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
                                	a!richTextIcon(
                                  	icon: "info-circle"
                                	),
                                	" Description"
                              	},
                              	size: "MEDIUM_PLUS",
                              	style: {
                                	"STRONG"
                              	}
                            	),
                            	char(10)
                          	}
                        	)
                      	},
                      	width: "AUTO"
                    	),
                    	a!columnLayout(
                      	contents: {
                        	a!textField(
                          	label: "Title",
                          	labelPosition: "ABOVE",
                          	saveInto: {},
                          	refreshAfter: "UNFOCUS",
                          	validations: {}
                        	),
                         a!styledTextEditorField(
                           label: "Summary",
                           labelPosition: "ABOVE",
                           saveInto: {},
                           sizeLimit: 4000,
                           height: "MEDIUM",
                           validations: {}
                         )
                      	}
                    	)
                  	},
                  	spacing: "SPARSE"
                	)
              	},
              	divider: "ABOVE"
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
                                	a!richTextIcon(
                                  	icon: "folder-open"
                                	),
                                	" Type"
                              	},
                              	size: "MEDIUM_PLUS",
                              	style: {
                                	"STRONG"
                              	}
                            	),
                            	char(10),
                            	char(10),
                            	a!richTextItem(
                              	text: {
                                	"The selected campaign category dictates available templates for building out campaign details."
                              	},
                              	color: "SECONDARY",
                              	size: "STANDARD"
                            	),
                            	char(10),
                            	char(10),
                            	a!richTextItem(
                              	text: {
                                	"Mark campaigns as Internal to prevent them from appearing on the master list."
                              	},
                              	color: "SECONDARY",
                              	size: "STANDARD"
                            	)
                          	}
                        	)
                      	},
                      	width: "AUTO"
                    	),
                    	a!columnLayout(
                      	contents: {
                        	a!richTextDisplayField(
                          	labelPosition: "COLLAPSED",
                          	value: {
                            	a!richTextItem(
                              	text: {
                                	"Category"
                              	},
                              	style: {
                                	"STRONG"
                              	}
                            	)
                          	}
                        	),
                        	a!columnsLayout(
                          	columns: {
                            	a!columnLayout(
                              	contents: {
                                	a!cardLayout(
                                  	contents: {
                                    	a!richTextDisplayField(
                                      	labelPosition: "COLLAPSED",
                                      	value: {
                                        	a!richTextIcon(
                                          	icon: "money",
                                          	color: "ACCENT",
                                          	size: "LARGE_PLUS"
                                        	),
                                        	char(10),
                                        	a!richTextItem(
                                          	text: {
                                            	"Fundraiser"
                                          	},
                                          	color: "SECONDARY",
                                          	size: "STANDARD"
                                        	),
                                        	char(10),
                                        	char(10)
                                      	},
                                      	align: "CENTER"
                                    	)
                                  	},
                                  	link: a!dynamicLink(
                                    	label: "Dynamic Link",
                                    	saveInto: {}
                                  	),
                                  	height: "AUTO",
                                  	style: "NONE",
                                  	padding: "LESS",
                                  	marginBelow: "STANDARD"
                                	)
                              	}
                            	),
                            	a!columnLayout(
                              	contents: {
                                	a!cardLayout(
                                  	contents: {
                                    	a!richTextDisplayField(
                                      	labelPosition: "COLLAPSED",
                                      	value: {
                                        	a!richTextIcon(
                                          	icon: "bullhorn",
                                          	color: "ACCENT",
                                          	size: "LARGE_PLUS"
                                        	),
                                        	char(10),
                                        	a!richTextItem(
                                          	text: {
                                            	"Awareness"
                                          	},
                                          	color: "SECONDARY",
                                          	size: "STANDARD"
                                        	),
                                        	char(10),
                                        	char(10)
                                      	},
                                      	align: "CENTER"
                                    	)
                                  	},
                                  	link: a!dynamicLink(
                                    	label: "Dynamic Link",
                                    	saveInto: {}
                                  	),
                                  	height: "AUTO",
                                  	style: "NONE",
                                  	padding: "LESS",
                                  	marginBelow: "STANDARD"
                                	)
                              	}
                            	),
                            	a!columnLayout(
                              	contents: {
                                	a!cardLayout(
                                  	contents: {
                                    	a!richTextDisplayField(
                                      	labelPosition: "COLLAPSED",
                                      	value: {
                                        	a!richTextIcon(
                                          	icon: "handshake-o",
                                          	color: "ACCENT",
                                          	size: "LARGE_PLUS"
                                        	),
                                        	char(10),
                                        	a!richTextItem(
                                          	text: {
                                            	"Lobbying"
                                          	},
                                          	color: "SECONDARY",
                                          	size: "STANDARD"
                                        	),
                                        	char(10),
                                        	char(10)
                                      	},
                                      	align: "CENTER"
                                    	)
                                  	},
                                  	link: a!dynamicLink(
                                    	label: "Dynamic Link",
                                    	saveInto: {}
                                  	),
                                  	height: "AUTO",
                                  	style: "NONE",
                                  	padding: "LESS",
                                  	marginBelow: "STANDARD"
                                	)
                              	}
                            	)
                          	}
                        	),
                        	a!radioButtonField(
                          	label: "Visibility",
                          	labelPosition: "ABOVE",
                          	choiceLabels: {"Public", "Internal"},
                          	choiceValues: {1, 2},
                          	value: 1,
                          	saveInto: {},
                          	choiceLayout: "COMPACT",
                          	choiceStyle: "CARDS",
                          	validations: {}
                        	)
                      	}
                    	)
                  	},
                  	spacing: "SPARSE"
                	)
              	},
              	divider: "ABOVE"
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
                                	a!richTextIcon(
                                  	icon: "calendar"
                                	),
                                	" Schedule"
                              	},
                              	size: "MEDIUM_PLUS",
                              	style: {
                                	"STRONG"
                              	}
                            	),
                            	char(10),
                            	char(10),
                            	a!richTextItem(
                              	text: {
                                	"Choose one of the standard campaign durations for more reliable comparison of results."
                              	},
                              	color: "SECONDARY",
                              	size: "STANDARD"
                            	),
                            	char(10)
                          	}
                        	)
                      	},
                      	width: "AUTO"
                    	),
                    	a!columnLayout(
                      	contents: {
                        	a!dateField(
                          	label: "Start",
                          	labelPosition: "ABOVE",
                          	saveInto: {},
                          	validations: {}
                        	),
                        	a!richTextDisplayField(
                          	labelPosition: "COLLAPSED",
                          	value: {
                            	a!richTextItem(
                              	text: {
                                	"End"
                              	},
                              	style: {
                                	"STRONG"
                              	}
                            	)
                          	}
                        	),
                        	a!radioButtonField(
                          	label: "Schedule Type",
                          	labelPosition: "COLLAPSED",
                          	choiceLabels: {"Custom", "30 Days", "60 Days"},
                          	choiceValues: {1, 2, 3},
                          	value: 1,
                          	saveInto: {},
                          	choiceLayout: "COMPACT",
                          	choiceStyle: "CARDS",
                          	validations: {}
                        	),
                        	a!dateField(
                          	label: "End",
                          	labelPosition: "COLLAPSED",
                          	saveInto: {},
                          	validations: {}
                        	)
                      	}
                    	)
                  	},
                  	spacing: "SPARSE"
                	)
              	},
              	divider: "ABOVE"
            	),
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
                              	label: "cancel",
                              	style: "OUTLINE"
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
                              	label: "Create",
                              	style: "SOLID"
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
          	width: "WIDE_PLUS"
        	),
        	a!columnLayout(
          	contents: {}
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
  contents: {
	a!columnsLayout(
  	columns: {
    	a!columnLayout(
      	contents: {}
    	),
    	a!columnLayout(
      	contents: {},
      	width: "MEDIUM_PLUS"
    	),
    	a!columnLayout(
      	contents: {}
    	)
  	}
	)
  }
)
