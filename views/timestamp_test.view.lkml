# The name of this view in Looker is "Timestamp Test"
view: timestamp_test {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "LOOKER_TEST"."TIMESTAMP_TEST"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Test Val" in Explore.

  dimension: test_val {
    type: string
    sql: ${TABLE}."TEST_VAL" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestamp_ltz {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIMESTAMP_LTZ" ;;
  }

  dimension_group: timestamp_ntz {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIMESTAMP_NTZ" ;;
  }

  dimension_group: timestamp_tz {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CAST(${TABLE}."TIMESTAMP_TZ" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
