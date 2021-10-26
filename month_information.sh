#!/bin/bash

LAST_MONTH=$(date "+%F" -d "$(date +'%Y-%m-01') -1 month")
YEAR=$(date "+%Y" -d "$(date +'%Y-%m-01') -1 month")
MONTH=$(date "+%m" -d "$(date +'%Y-%m-01') -1 month")
DAY_START=$(date "+%d" -d "$(date +'%Y-%m-01') -1 month")
DAY_END=$(date "+%d" -d "$LAST_MONTH +1 month -1 day")

echo "Полная дата:   $LAST_MONTH"
echo "Год прошлого месяца:  $YEAR"
echo "Номер прошлого месяца:  $MONTH"
echo "Первый день прошлого месяца: $DAY_START"
echo "Последний день прошлого месяца: $DAY_END"
