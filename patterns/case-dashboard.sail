a!localVariables(
  /* ~~~ Open Cases By Status ~~~ */
  /* Query for cases created in a time range that are not resolved, aggregate by status and order by status */
  local!openCasesByStatus: a!dataSubset(
    data: {
      a!map(status: "Assigned", id_count: 140),
      a!map(status: "Customer Action", id_count: 20),
      a!map(status: "In Queue", id_count: 16)
    },
    sort: a!sortInfo(
      field: "status",
      ascending: true
    )
  ),

  /* ~~~ Cases Resolved by day/month/year (%) ~~~ */
  /* Query for a count of open & resolved cases grouped by case type for the same time range */
  local!resolvedCasesTargetDS: a!dataSubset(
    data: {
      a!map(type: "Today", id_count: 30),
      a!map(type: "This Month", id_count: 600),
      a!map(type: "This Year", id_count: 7200)
    },
    sort: a!sortInfo(
      field: "type",
      ascending: true
    )
  ),
  local!resolvedCasesByTime: a!dataSubset(
    data: {
      a!map(type: "Today", id_count: 12),
      a!map(type: "This Month", id_count: 480),
      a!map(type: "This Year", id_count: 2400)
    },
    sort: a!sortInfo(
      field: "type",
      ascending: true
    )
  ),
  local!resolvedCasesTarget: tointeger(index(local!resolvedCasesTargetDS.data, "id_count")),
  local!caseResolvedByTimeThreshold: 0.5,

  /* ~~~ Top Accounts by Open Cases ~~~ */
  /* Sample data to filter queries for the Top 5 Accounts chart.                                    *
   * Substitute with a query that aggregates the numbers of cases (count of IDs), and filters for   *
   * cases that are not Resolved.                                                                   *
   * Select a batch size of -1 and sort in descending order on the numerical field to get accounts  *
   * with the most cases first.                                                                     */
  local!topFiveAccts: todatasubset({
    a!map(account_name: "Devbug", id_count: 20),
    a!map(account_name: "Browsecat", id_count: 16),
    a!map(account_name: "Aivee", id_count: 15),
    a!map(account_name: "Dabjam", id_count: 14),
    a!map(account_name: "Trilith", id_count: 14)
  }),

  /* Sample data to display in the Top 5 Accounts chart.                                            *
   * Substitute with a query that groups cases by status, and filters for accounts in the previous  *
   * variable and for cases that are not Resolved.                                                  *
   * Select a batch size of -1 and sort in descending order on the numerical field.                 */
  local!topFiveAcctsOpenCases: todatasubset(
    {
      a!map(account_name: "Trilith", id_count: 10, status: "Assigned"),
      a!map(account_name: "Browsecat", id_count: 9, status: "Assigned"),
      a!map(account_name: "Devbug", id_count: 9, status: "Assigned"),
      a!map(account_name: "Dabjam", id_count: 8, status: "Assigned"),
      a!map(account_name: "Aivee", id_count: 7, status: "Assigned"),
      a!map(account_name: "Devbug", id_count: 6, status: "In Queue"),
      a!map(account_name: "Aivee", id_count: 5, status: "Customer Action"),
      a!map(account_name: "Browsecat", id_count: 5, status: "In Queue"),
      a!map(account_name: "Devbug", id_count: 5, status: "Customer Action"),
      a!map(account_name: "Dabjam", id_count: 4, status: "In Queue"),
      a!map(account_name: "Aivee", id_count: 3, status: "In Queue"),
      a!map(account_name: "Browsecat", id_count: 2, status: "Customer Action"),
      a!map(account_name: "Dabjam", id_count: 2, status: "Customer Action"),
      a!map(account_name: "Trilith", id_count: 2, status: "Customer Action"),
      a!map(account_name: "Trilith", id_count: 2, status: "In Queue")
    },
    a!pagingInfo(
      startIndex: 1,
      batchSize: -1,
      sort: {
        a!sortInfo(
          field: "id_count",
          ascending: false
        ),
        a!sortInfo(
          field: "account_name",
          ascending: true
        ),
        a!sortInfo(
          field: "status",
          ascending: true
        )
      }
    )
  ),

  /* Lists of all and unique accounts and statuses will be used across the components below. */
  local!accountNames: index(local!topFiveAcctsOpenCases.data,"account_name",{}),
  local!uniqueAccountNames: index(local!topFiveAccts.data,"account_name",{}),
  local!accountStatuses: index(local!topFiveAcctsOpenCases.data,"status",{}),
  local!uniqueAccountStatuses: union(local!accountStatuses,cast(typeof(local!accountStatuses),{})),

  /* Filter values that come from clicking on the chart, used in subsequent queries. */
  local!selectedAccount,
  local!selectedStatus,

  /* ~~~ Open vs. Closed Cases ~~~ */
  /* Query for the count of Closed cases, aggregating by the date they were closed on. */
  local!resolvedByDate: a!dataSubset(
    data: {
      a!map(created_on: datetime(2019, 1, 1, 0, 0, 0, 0), id_count: 50),
      a!map(created_on: datetime(2019, 1, 2, 0, 0, 0, 0), id_count: 55),
      a!map(created_on: datetime(2019, 1, 3, 0, 0, 0, 0), id_count: 52),
      a!map(created_on: datetime(2019, 1, 4, 0, 0, 0, 0), id_count: 50),
      a!map(created_on: datetime(2019, 1, 5, 0, 0, 0, 0), id_count: 55),
      a!map(created_on: datetime(2019, 1, 6, 0, 0, 0, 0), id_count: 56),
      a!map(created_on: datetime(2019, 1, 7, 0, 0, 0, 0), id_count: 58),
      a!map(created_on: datetime(2019, 1, 8, 0, 0, 0, 0), id_count: 52),
      a!map(created_on: datetime(2019, 1, 9, 0, 0, 0, 0), id_count: 60),
      a!map(created_on: datetime(2019, 1, 10, 0, 0, 0, 0), id_count: 65),
      a!map(created_on: datetime(2019, 1, 11, 0, 0, 0, 0), id_count: 66),
      a!map(created_on: datetime(2019, 1, 12, 0, 0, 0, 0), id_count: 67),
      a!map(created_on: datetime(2019, 1, 13, 0, 0, 0, 0), id_count: 70),
      a!map(created_on: datetime(2019, 1, 14, 0, 0, 0, 0), id_count: 72),
      a!map(created_on: datetime(2019, 1, 15, 0, 0, 0, 0), id_count: 69),
      a!map(created_on: datetime(2019, 1, 16, 0, 0, 0, 0), id_count: 75),
      a!map(created_on: datetime(2019, 1, 17, 0, 0, 0, 0), id_count: 73),
      a!map(created_on: datetime(2019, 1, 18, 0, 0, 0, 0), id_count: 77),
      a!map(created_on: datetime(2019, 1, 19, 0, 0, 0, 0), id_count: 80),
      a!map(created_on: datetime(2019, 1, 20, 0, 0, 0, 0), id_count: 76),
      a!map(created_on: datetime(2019, 1, 21, 0, 0, 0, 0), id_count: 78),
      a!map(created_on: datetime(2019, 1, 22, 0, 0, 0, 0), id_count: 80),
      a!map(created_on: datetime(2019, 1, 23, 0, 0, 0, 0), id_count: 77),
      a!map(created_on: datetime(2019, 1, 24, 0, 0, 0, 0), id_count: 75),
      a!map(created_on: datetime(2019, 1, 25, 0, 0, 0, 0), id_count: 80),
      a!map(created_on: datetime(2019, 1, 26, 0, 0, 0, 0), id_count: 83),
      a!map(created_on: datetime(2019, 1, 27, 0, 0, 0, 0), id_count: 86),
      a!map(created_on: datetime(2019, 1, 28, 0, 0, 0, 0), id_count: 83),
      a!map(created_on: datetime(2019, 1, 29, 0, 0, 0, 0), id_count: 88),
      a!map(created_on: datetime(2019, 1, 30, 0, 0, 0, 0), id_count: 90),
      a!map(created_on: datetime(2019, 1, 31, 0, 0, 0, 0), id_count: 94),
      a!map(created_on: datetime(2019, 2, 1, 0, 0, 0, 0), id_count: 93),
      a!map(created_on: datetime(2019, 2, 2, 0, 0, 0, 0), id_count: 100),
      a!map(created_on: datetime(2019, 2, 3, 0, 0, 0, 0), id_count: 99),
      a!map(created_on: datetime(2019, 2, 4, 0, 0, 0, 0), id_count: 105),
      a!map(created_on: datetime(2019, 2, 5, 0, 0, 0, 0), id_count: 106),
      a!map(created_on: datetime(2019, 2, 6, 0, 0, 0, 0), id_count: 108),
      a!map(created_on: datetime(2019, 2, 7, 0, 0, 0, 0), id_count: 105),
      a!map(created_on: datetime(2019, 2, 8, 0, 0, 0, 0), id_count: 104),
      a!map(created_on: datetime(2019, 2, 9, 0, 0, 0, 0), id_count: 109),
      a!map(created_on: datetime(2019, 2, 10, 0, 0, 0, 0), id_count: 108),
      a!map(created_on: datetime(2019, 2, 11, 0, 0, 0, 0), id_count: 111),
      a!map(created_on: datetime(2019, 2, 12, 0, 0, 0, 0), id_count: 115),
      a!map(created_on: datetime(2019, 2, 13, 0, 0, 0, 0), id_count: 112),
      a!map(created_on: datetime(2019, 2, 14, 0, 0, 0, 0), id_count: 118),
      a!map(created_on: datetime(2019, 2, 15, 0, 0, 0, 0), id_count: 119),
      a!map(created_on: datetime(2019, 2, 16, 0, 0, 0, 0), id_count: 117),
      a!map(created_on: datetime(2019, 2, 17, 0, 0, 0, 0), id_count: 120),
      a!map(created_on: datetime(2019, 2, 18, 0, 0, 0, 0), id_count: 122),
      a!map(created_on: datetime(2019, 2, 19, 0, 0, 0, 0), id_count: 124),
      a!map(created_on: datetime(2019, 2, 20, 0, 0, 0, 0), id_count: 123),
      a!map(created_on: datetime(2019, 2, 21, 0, 0, 0, 0), id_count: 125),
      a!map(created_on: datetime(2019, 2, 22, 0, 0, 0, 0), id_count: 25),
      a!map(created_on: datetime(2019, 2, 23, 0, 0, 0, 0), id_count: 127),
      a!map(created_on: datetime(2019, 2, 24, 0, 0, 0, 0), id_count: 126),
      a!map(created_on: datetime(2019, 2, 25, 0, 0, 0, 0), id_count: 129),
      a!map(created_on: datetime(2019, 2, 26, 0, 0, 0, 0), id_count: 130),
      a!map(created_on: datetime(2019, 2, 27, 0, 0, 0, 0), id_count: 128),
      a!map(created_on: datetime(2019, 2, 28, 0, 0, 0, 0), id_count: 131),
      a!map(created_on: datetime(2019, 3, 1, 0, 0, 0, 0), id_count: 135),
      a!map(created_on: datetime(2019, 3, 2, 0, 0, 0, 0), id_count: 132),
      a!map(created_on: datetime(2019, 3, 3, 0, 0, 0, 0), id_count: 136),
      a!map(created_on: datetime(2019, 3, 4, 0, 0, 0, 0), id_count: 138),
      a!map(created_on: datetime(2019, 3, 5, 0, 0, 0, 0), id_count: 134),
      a!map(created_on: datetime(2019, 3, 6, 0, 0, 0, 0), id_count: 137),
      a!map(created_on: datetime(2019, 3, 7, 0, 0, 0, 0), id_count: 135),
      a!map(created_on: datetime(2019, 3, 8, 0, 0, 0, 0), id_count: 137),
      a!map(created_on: datetime(2019, 3, 9, 0, 0, 0, 0), id_count: 135),
      a!map(created_on: datetime(2019, 3, 10, 0, 0, 0, 0), id_count: 138),
      a!map(created_on: datetime(2019, 3, 11, 0, 0, 0, 0), id_count: 137),
      a!map(created_on: datetime(2019, 3, 12, 0, 0, 0, 0), id_count: 139),
      a!map(created_on: datetime(2019, 3, 13, 0, 0, 0, 0), id_count: 140),
      a!map(created_on: datetime(2019, 3, 14, 0, 0, 0, 0), id_count: 136),
      a!map(created_on: datetime(2019, 3, 15, 0, 0, 0, 0), id_count: 142),
      a!map(created_on: datetime(2019, 3, 16, 0, 0, 0, 0), id_count: 146),
      a!map(created_on: datetime(2019, 3, 17, 0, 0, 0, 0), id_count: 144),
      a!map(created_on: datetime(2019, 3, 18, 0, 0, 0, 0), id_count: 146),
      a!map(created_on: datetime(2019, 3, 19, 0, 0, 0, 0), id_count: 150),
      a!map(created_on: datetime(2019, 3, 20, 0, 0, 0, 0), id_count: 146),
      a!map(created_on: datetime(2019, 3, 21, 0, 0, 0, 0), id_count: 146),
      a!map(created_on: datetime(2019, 3, 22, 0, 0, 0, 0), id_count: 148),
      a!map(created_on: datetime(2019, 3, 23, 0, 0, 0, 0), id_count: 145),
      a!map(created_on: datetime(2019, 3, 24, 0, 0, 0, 0), id_count: 147),
      a!map(created_on: datetime(2019, 3, 25, 0, 0, 0, 0), id_count: 145)
    }
  ),

  /* Query for the count of Open cases, aggregating by the date they were created on. */
  local!openByDate: a!dataSubset(
    data: {
      a!map(created_on: datetime(2019, 1, 1, 0, 0, 0, 0), id_count: 220),
      a!map(created_on: datetime(2019, 1, 2, 0, 0, 0, 0), id_count: 220),
      a!map(created_on: datetime(2019, 1, 3, 0, 0, 0, 0), id_count: 221),
      a!map(created_on: datetime(2019, 1, 4, 0, 0, 0, 0), id_count: 224),
      a!map(created_on: datetime(2019, 1, 5, 0, 0, 0, 0), id_count: 225),
      a!map(created_on: datetime(2019, 1, 6, 0, 0, 0, 0), id_count: 227),
      a!map(created_on: datetime(2019, 1, 7, 0, 0, 0, 0), id_count: 229),
      a!map(created_on: datetime(2019, 1, 8, 0, 0, 0, 0), id_count: 233),
      a!map(created_on: datetime(2019, 1, 9, 0, 0, 0, 0), id_count: 229),
      a!map(created_on: datetime(2019, 1, 10, 0, 0, 0, 0), id_count: 231),
      a!map(created_on: datetime(2019, 1, 11, 0, 0, 0, 0), id_count: 229),
      a!map(created_on: datetime(2019, 1, 12, 0, 0, 0, 0), id_count: 222),
      a!map(created_on: datetime(2019, 1, 13, 0, 0, 0, 0), id_count: 224),
      a!map(created_on: datetime(2019, 1, 14, 0, 0, 0, 0), id_count: 222),
      a!map(created_on: datetime(2019, 1, 15, 0, 0, 0, 0), id_count: 218),
      a!map(created_on: datetime(2019, 1, 16, 0, 0, 0, 0), id_count: 223),
      a!map(created_on: datetime(2019, 1, 17, 0, 0, 0, 0), id_count: 220),
      a!map(created_on: datetime(2019, 1, 18, 0, 0, 0, 0), id_count: 216),
      a!map(created_on: datetime(2019, 1, 19, 0, 0, 0, 0), id_count: 217),
      a!map(created_on: datetime(2019, 1, 20, 0, 0, 0, 0), id_count: 215),
      a!map(created_on: datetime(2019, 1, 21, 0, 0, 0, 0), id_count: 212),
      a!map(created_on: datetime(2019, 1, 22, 0, 0, 0, 0), id_count: 210),
      a!map(created_on: datetime(2019, 1, 23, 0, 0, 0, 0), id_count: 215),
      a!map(created_on: datetime(2019, 1, 24, 0, 0, 0, 0), id_count: 218),
      a!map(created_on: datetime(2019, 1, 25, 0, 0, 0, 0), id_count: 220),
      a!map(created_on: datetime(2019, 1, 26, 0, 0, 0, 0), id_count: 211),
      a!map(created_on: datetime(2019, 1, 27, 0, 0, 0, 0), id_count: 219),
      a!map(created_on: datetime(2019, 1, 28, 0, 0, 0, 0), id_count:205),
      a!map(created_on: datetime(2019, 1, 29, 0, 0, 0, 0), id_count:229),
      a!map(created_on: datetime(2019, 1, 30, 0, 0, 0, 0), id_count:218),
      a!map(created_on: datetime(2019, 1, 31, 0, 0, 0, 0), id_count:221),
      a!map(created_on: datetime(2019, 2, 1, 0, 0, 0, 0), id_count: 219),
      a!map(created_on: datetime(2019, 2, 2, 0, 0, 0, 0), id_count: 218),
      a!map(created_on: datetime(2019, 2, 3, 0, 0, 0, 0), id_count: 211),
      a!map(created_on: datetime(2019, 2, 4, 0, 0, 0, 0), id_count: 216),
      a!map(created_on: datetime(2019, 2, 5, 0, 0, 0, 0), id_count: 218),
      a!map(created_on: datetime(2019, 2, 6, 0, 0, 0, 0), id_count: 220),
      a!map(created_on: datetime(2019, 2, 7, 0, 0, 0, 0), id_count: 219),
      a!map(created_on: datetime(2019, 2, 8, 0, 0, 0, 0), id_count: 217),
      a!map(created_on: datetime(2019, 2, 9, 0, 0, 0, 0), id_count: 215),
      a!map(created_on: datetime(2019, 2, 10, 0, 0, 0, 0), id_count: 211),
      a!map(created_on: datetime(2019, 2, 11, 0, 0, 0, 0), id_count: 206),
      a!map(created_on: datetime(2019, 2, 12, 0, 0, 0, 0), id_count: 211),
      a!map(created_on: datetime(2019, 2, 13, 0, 0, 0, 0), id_count: 209),
      a!map(created_on: datetime(2019, 2, 14, 0, 0, 0, 0), id_count: 210),
      a!map(created_on: datetime(2019, 2, 15, 0, 0, 0, 0), id_count: 207),
      a!map(created_on: datetime(2019, 2, 16, 0, 0, 0, 0), id_count: 205),
      a!map(created_on: datetime(2019, 2, 17, 0, 0, 0, 0), id_count: 216),
      a!map(created_on: datetime(2019, 2, 18, 0, 0, 0, 0), id_count: 211),
      a!map(created_on: datetime(2019, 2, 19, 0, 0, 0, 0), id_count: 214),
      a!map(created_on: datetime(2019, 2, 20, 0, 0, 0, 0), id_count: 210),
      a!map(created_on: datetime(2019, 2, 21, 0, 0, 0, 0), id_count: 211),
      a!map(created_on: datetime(2019, 2, 22, 0, 0, 0, 0), id_count: 320),
      a!map(created_on: datetime(2019, 2, 23, 0, 0, 0, 0), id_count: 209),
      a!map(created_on: datetime(2019, 2, 24, 0, 0, 0, 0), id_count: 204),
      a!map(created_on: datetime(2019, 2, 25, 0, 0, 0, 0), id_count: 206),
      a!map(created_on: datetime(2019, 2, 26, 0, 0, 0, 0), id_count: 208),
      a!map(created_on: datetime(2019, 2, 27, 0, 0, 0, 0), id_count: 205),
      a!map(created_on: datetime(2019, 2, 28, 0, 0, 0, 0), id_count: 207),
      a!map(created_on: datetime(2019, 3, 1, 0, 0, 0, 0), id_count: 205),
      a!map(created_on: datetime(2019, 3, 2, 0, 0, 0, 0), id_count: 201),
      a!map(created_on: datetime(2019, 3, 3, 0, 0, 0, 0), id_count: 200),
      a!map(created_on: datetime(2019, 3, 4, 0, 0, 0, 0), id_count: 192),
      a!map(created_on: datetime(2019, 3, 5, 0, 0, 0, 0), id_count: 190),
      a!map(created_on: datetime(2019, 3, 6, 0, 0, 0, 0), id_count: 184),
      a!map(created_on: datetime(2019, 3, 7, 0, 0, 0, 0), id_count: 186),
      a!map(created_on: datetime(2019, 3, 8, 0, 0, 0, 0), id_count: 188),
      a!map(created_on: datetime(2019, 3, 9, 0, 0, 0, 0), id_count: 185),
      a!map(created_on: datetime(2019, 3, 10, 0, 0, 0, 0), id_count: 183),
      a!map(created_on: datetime(2019, 3, 11, 0, 0, 0, 0), id_count: 178),
      a!map(created_on: datetime(2019, 3, 12, 0, 0, 0, 0), id_count: 181),
      a!map(created_on: datetime(2019, 3, 13, 0, 0, 0, 0), id_count: 180),
      a!map(created_on: datetime(2019, 3, 14, 0, 0, 0, 0), id_count: 184),
      a!map(created_on: datetime(2019, 3, 15, 0, 0, 0, 0), id_count: 178),
      a!map(created_on: datetime(2019, 3, 16, 0, 0, 0, 0), id_count: 180),
      a!map(created_on: datetime(2019, 3, 17, 0, 0, 0, 0), id_count: 177),
      a!map(created_on: datetime(2019, 3, 18, 0, 0, 0, 0), id_count: 175),
      a!map(created_on: datetime(2019, 3, 19, 0, 0, 0, 0), id_count: 173),
      a!map(created_on: datetime(2019, 3, 20, 0, 0, 0, 0), id_count: 175),
      a!map(created_on: datetime(2019, 3, 21, 0, 0, 0, 0), id_count: 178),
      a!map(created_on: datetime(2019, 3, 22, 0, 0, 0, 0), id_count: 170),
      a!map(created_on: datetime(2019, 3, 23, 0, 0, 0, 0), id_count: 172),
      a!map(created_on: datetime(2019, 3, 24, 0, 0, 0, 0), id_count: 175),
      a!map(created_on: datetime(2019, 3, 25, 0, 0, 0, 0), id_count: 176)
    }
  ),

  {
    a!columnsLayout(
      columns: {
        /* Open Cases by Status Section */
        a!columnLayout(
          contents: {
            a!headingField(
              text: "OPEN CASES",
              size: "SMALL",
              fontWeight: "BOLD",
              marginBelow: "LESS"
            ),
            a!columnsLayout(
              columns: {
                a!forEach(
                  items: local!openCasesByStatus.data,
                  expression: {
                    a!columnLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelposition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: fv!item.id_count,
                              color: "ACCENT",
                              size: "LARGE",
                              style: "STRONG"
                            ),
                            char(10),
                            a!richTextItem(
                              text: fv!item.status,
                              color: "SECONDARY"
                            )
                          },
                          align: "CENTER"
                        ),
                        a!richTextDisplayField(
                          value: a!richTextItem(),
                          showWhen: not(fv!isLast)
                        )
                      }
                    )
                  }
                )
              },
              stackWhen: {
                "NEVER"
              }
            ),
            a!headingField(
              text: "CLOSED CASES",
              size: "SMALL",
              fontWeight: "BOLD",
              marginBelow: "LESS"
            ),
            a!columnsLayout(
              columns: {
                a!forEach(
                  items: local!resolvedCasesByTime.data,
                  expression: {
                    a!columnLayout(
                      contents: {
                        a!gaugeField(
                          labelPosition: "COLLAPSED",
                          percentage: (tointeger(fv!item.id_count) / local!resolvedCasesTarget[fv!index]) * 100,
                          primaryText: fv!item.id_count,
                          secondaryText: fv!item.type,
                          color: if(
                            tointeger(fv!item.id_count)/ local!resolvedCasesTarget[fv!index] < local!caseResolvedByTimeThreshold,
                            "NEGATIVE",
                            "POSITIVE"
                          ),
                          size: "SMALL",
                          align: "CENTER",
                          accessibilityText: fv!item.id_count & " cases closed " & fv!item.type
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextIcon(
                              icon: "dot-circle-o",
                              altText: "Target",
                              caption: "Target",
                              color: "SECONDARY"
                            ),
                            a!richTextItem(
                              text: " " & local!resolvedCasesTarget[fv!index],
                              color: "SECONDARY"
                            )
                          },
                          align: "CENTER",
                          accessibilityText: "Target for " & fv!item.type & " is " & local!resolvedCasesTarget[fv!index]
                        )
                      }
                    )
                  }
                )
              }
            )
          },
          width: "AUTO"
        ),
        /* TOP 5 ACCOUNTS BY # OF OPEN CASES */
        a!columnLayout(
          contents: {
            a!headingField(
              text: "TOP CASE RESOLVERS",
              size: "SMALL",
              fontWeight: "BOLD",
              marginBelow: "LESS"
            ),
            a!gridField(
              labelPosition: "ABOVE",
              /* Query for cases in a recent time range (e.g., this month), grouping by employee and taking *
               * count of cases, average of customer satisfaction, and average of response time.            */
              data: todatasubset(
                {
                  a!map(assigned_to: "Aguste Screech", id_count: 10, avg_customer_satisfaction: 87, time_to_resolve_average: 6887.0),
                  a!map(assigned_to: "Alexine Lodin", id_count: 8, avg_customer_satisfaction: 90, time_to_resolve_average: 14107.0),
                  a!map(assigned_to: "Alia Amiss", id_count: 12, avg_customer_satisfaction: 66, time_to_resolve_average: 3422.0),
                  a!map(assigned_to: "Alicia Flobert", id_count: 15, avg_customer_satisfaction: 88, time_to_resolve_average: 1311.0),
                  a!map(assigned_to: "Alidia Bursnoll", id_count: 17, avg_customer_satisfaction: 90, time_to_resolve_average: 8549.0)
                },
                fv!pagingInfo
              ),
              columns: {
                a!gridColumn(
                  value: a!imageField(
                    images: if(
                      isnull(fv!row.assigned_to),
                      {},
                      a!userImage(
                        user: fv!row.assigned_to,
                        caption: fv!row.assigned_to
                      )
                    ),
                    size: "ICON",
                    style: "AVATAR"
                  ),
                  align: "CENTER",
                  width: "ICON"
                ),
                a!gridColumn(
                  label: "Employee",
                  sortField: "assigned_to",
                  value: a!linkField(
                    links: a!userRecordLink(
                      label: fv!row.assigned_to,
                      user: fv!row.assigned_to
                    )
                  )
                ),
                a!gridColumn(
                  label: "# Cases",
                  sortField: "id_count",
                  value: fv!row.id_count,
                  align: "END",
                  width: "NARROW"
                ),
                a!gridColumn(
                  label: "Avg. Cust. Sat.",
                  sortField: "avg_customer_satisfaction",
                  value: a!richTextDisplayField(
                    value: {
                      a!richTextIcon(
                        icon: if(
                          fv!row.avg_customer_satisfaction < 70,
                          "caret-down",
                          "caret-up"
                        ),
                        color: if(
                          fv!row.avg_customer_satisfaction < 70,
                          "NEGATIVE",
                          "POSITIVE"
                        )
                      ),
                      a!richTextItem(
                        text: fv!row.avg_customer_satisfaction & "%",
                        color: if(
                          fv!row.avg_customer_satisfaction < 70,
                          "NEGATIVE",
                          "POSITIVE"
                        )
                      )
                    },
                    align: "RIGHT"
                  )
                ),
                a!gridColumn(
                  label: "Avg. Response Time",
                  sortField: "time_to_resolve_average",
                  value: fv!row.time_to_resolve_average & " m",
                  align: "END"
                )
              },
              initialSorts: a!sortInfo(field: "id_count", ascending: false),
              spacing: "DENSE",
              borderStyle: "LIGHT"
            )
          }
        )
      },
      stackWhen: {
        "PHONE",
        "TABLET_PORTRAIT"
      }
    ),
    a!columnsLayout(
      columns: {
        /* Cases Resolved By Time Section */
        a!columnLayout(
          contents: {
            a!headingField(
              text: "OPEN VS. CLOSED CASES",
              size: "SMALL",
              fontWeight: "BOLD",
              marginBelow: "LESS"
            ),
            a!lineChartField(
              labelPosition: "COLLAPSED",
              categories: index(local!resolvedByDate.data, "created_on"),
              series: {
                a!chartSeries(
                  label: "Closed",
                  data: index(local!resolvedByDate.data, "id_count"),
                  color: "GREEN"
                ),
                a!chartSeries(
                  label: "Open",
                  data: index(local!openByDate.data, "id_count"),
                  color: "RED"
                )
              }
            )
          },
          width: "AUTO"
        ),

        /* OPEN VS. CLOSED CASES */
        a!columnLayout(
          contents: {
            a!headingField(
              text: "TOP 5 ACCOUNTS BY # OF OPEN CASES",
              size: "SMALL",
              fontWeight: "BOLD",
              marginBelow: "LESS"
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: {
                    a!richTextIcon(
                      icon: "arrow-left"
                    ),
                    " ",
                    a!richTextItem(
                      text: "Back to chart"
                    )
                  },
                  link: a!dynamicLink(saveInto: {
                    a!save(local!selectedAccount, null),
                    a!save(local!selectedStatus, null)
                  }),
                  linkStyle: "STANDALONE"
                )
              },
              showWhen: not(isnull(local!selectedAccount))
            ),
            a!gridField(
              label: "Case Details",
              labelPosition: "ABOVE",
              /* Sample data to display in the Case Details grid.                                *
               * Substitute with a query that selects fields for every column in the grid,       *
               * filtering for cases where account matches local!selectedAccount and status      *
               * matches local!selectedStatus.                                                   */
              data: {
                a!map(id:203, priority: "Medium", name: "Seamless motivating functionalities", account_name: "Devbug", assigned_to: "Jordain Nazair", status: "Assigned", created_on: now()-11.5, updated_on: now()-1.8, days_since_created: 171),
                a!map(id:311, priority: "Medium", name: "Adaptive logistical frame", account_name: "Devbug", assigned_to: "Skye Mahaddie", status: "Assigned", created_on: now()-10.61, updated_on: now()-1.1, days_since_created: 199),
                a!map(id:343, priority: "Medium", name: "Business-focused hybrid projection", account_name: "Devbug", assigned_to: "Giorgi Bazoge", status: "Assigned", created_on: now()-9.57, updated_on: now()-1.47, days_since_created: 23),
                a!map(id:373, priority: "Medium", name: "Adaptive background instruction set", account_name: "Devbug", assigned_to: "Hetti Castanares", status: "Assigned", created_on: now()-9.11, updated_on: now()-1.21, days_since_created: 276),
                a!map(id:384, priority: "Medium", name: "Universal real-time structure", account_name: "Devbug", assigned_to: "Corette Mordey", status: "Assigned", created_on: now()-7.44, updated_on: now()-1.39, days_since_created: 74),
                a!map(id:442, priority: "Medium", name: "Enterprise-wide 6th generation forecast", account_name: "Devbug", assigned_to: "Justin Ricci", status: "Assigned", created_on: now()-6.53, updated_on: now()-1.99, days_since_created: 7),
                a!map(id:540, priority: "Medium", name: "Implemented client-server open system", account_name: "Devbug", assigned_to: "Gifford Reames", status: "Assigned", created_on: now()-6.42, updated_on: now()-1.71, days_since_created: 126),
                a!map(id:541, priority: "Medium", name: "Enterprise-wide explicit projection", account_name: "Devbug", assigned_to: "Brittni Handley", status: "Assigned", created_on: now()-5.17, updated_on: now()-1.85, days_since_created: 157),
                a!map(id:558, priority: "Medium", name: "Horizontal scalable initiative", account_name: "Devbug", assigned_to: "Adah Crumby", status: "Assigned", created_on: now()-5, updated_on: now()-1.29, days_since_created: 364)
              },
              columns: {
                a!gridColumn(
                  label: "Case#",
                  sortField: "id",
                  value: fv!row.id
                ),
                a!gridColumn(
                  label: "Name",
                  sortField: "name",
                  value: fv!row.name
                ),
                a!gridColumn(
                  label: "Account",
                  sortField: "account_name",
                  value: fv!row.account_name
                ),
                a!gridColumn(
                  label: "Assignee",
                  sortField: "assigned_to",
                  value: fv!row.assigned_to
                ),
                a!gridColumn(
                  label: "Status",
                  sortField: "status",
                  value: fv!row.status
                ),
                a!gridColumn(
                  label: "Created",
                  sortField: "created_on",
                  value: datetext(fv!row.created_on, "default"),
                  align: "END"
                ),
                a!gridColumn(
                  label: "Updated",
                  sortField: "updated_on",
                  value: datetext(fv!row.updated_on, "default"),
                  align: "END"
                )
              },
              pageSize:  10,
              initialSorts: {
                a!sortInfo(
                  field: "days_since_created",
                  ascending: false
                )
              },
              pagingSaveInto: fv!pagingInfo,
              showWhen: not(isnull(local!selectedAccount)),
              validations: {},
              spacing: "DENSE",
              borderStyle: "LIGHT",
              shadeAlternateRows: true
            ),
            a!columnChartField(
              instructions: "Click on a column to see additional details",
              categories: local!uniqueAccountNames,
              series: a!forEach(
                items: local!uniqueAccountStatuses,
                expression: a!localVariables(
                  local!label: fv!item,
                  a!chartSeries(
                    label: local!label,
                    /* Loops over list of categories to find each datapoint that matches  *
                     * the series label and the category. This will ensure that the       *
                     * datapoints are in the correct order to display in the chart.       */
                    data: a!forEach(
                      items: local!uniqueAccountNames,
                      expression: a!localVariables(
                        /* Find all datapoints that match both the category and chart series label.  */
                        local!intersection: intersection(
                          where(
                            local!accountNames = cast(typeof(local!accountNames),fv!item),
                            0
                          ),
                          where(
                            local!accountStatuses = cast(typeof(local!accountStatuses),local!label),
                            0
                          )
                        ),
                        if(
                          length(local!intersection) = 0,
                          /* If there is no datapoint for this category-label pair, return 0 so that *
                           * all subsequent points are in the correct order with the categories.     */
                          0,
                          index(
                            index(local!topFiveAcctsOpenCases.data,"id_count",{}),
                            local!intersection,
                            0
                          )
                        )
                      )
                    ),
                    links: a!forEach(
                      items: local!uniqueAccountNames,
                      expression: a!dynamicLink(
                        /* Since this is a stacked chart, each link saves both the account and *
                         * the status that was clicked on, to filter the query in the grid.    */
                        saveInto: {
                          a!save(local!selectedAccount, fv!item),
                          a!save(local!selectedStatus, local!label)
                        }
                      )
                    )
                  )
                )
              ),
              xAxisTitle: "Account",
              yAxisTitle: "# of Cases",
              stacking: "NORMAL",
              labelPosition: "COLLAPSED",
              showWhen: isnull(local!selectedAccount),
              colorScheme: "CLASSIC"
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